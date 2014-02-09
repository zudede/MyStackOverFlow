package mystackoverflow



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentInstanceCount: Comment.count()]
    }

    def show(Comment commentInstance) {
        respond commentInstance
    }

    def create() {
		Comment comment = new Comment(params)
		comment.message = Message.get(params["message.id"])
		respond(comment)
    }

    @Transactional
    def save(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

		User user = User.get(session["user"])
		commentInstance.author = user
		commentInstance.creationDate = new Date()
		commentInstance.validate()
		
		
        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view:'create'
            return
        }

		
		log.info String.format("New comment created by %s", user)
        commentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'commentInstance.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance.message.topic
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }

    def edit(Comment commentInstance) {
        respond commentInstance
    }

    @Transactional
    def update(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view:'edit'
            return
        }

        commentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance.message.topic
            }
            '*'{ respond commentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comment commentInstance) {

        if (commentInstance == null) {
            notFound()
            return
        }

        commentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentInstance.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
