package mystackoverflow



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }

    def show(Topic topicInstance) {
        respond topicInstance
    }

    def create() {
        //respond new Topic(params)
		Topic topic = new Topic(params)
		topic.author =  User.get(session["user"])
		topic.creationDate = new Date()
		render (view: "create", model:[topicInstance:topic])
    }

    @Transactional
    def save(Topic topicInstance) {
        
		if (topicInstance == null) {
            notFound()
            return
		}
		
		def author = User.get(session["user"])
		topicInstance.author= User.get(session["user"])
		topicInstance.creationDate = new Date()
		topicInstance.rate = 0
		topicInstance.validate()
        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }

		log.info String.format("New topic created by %s", author)
        topicInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topicInstance.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topicInstance.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
