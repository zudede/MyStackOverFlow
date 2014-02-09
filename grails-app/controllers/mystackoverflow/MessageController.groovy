package mystackoverflow



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MessageController {

	def rewardDistributorService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Message.list(params), model:[messageInstanceCount: Message.count()]
    }

    def show(Message messageInstance) {
        respond messageInstance
    }

    def create() {
		Message message = new Message(params)
		message.topic = Topic.get(params["topic.id"])
		respond(message)
        //respond new Message(params)
		//render (view: "create", model:[messageInstance:new Message(params), 'topic.id': params["topic.id"]])
    }

    @Transactional
    def save(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }
		User user = User.get(session["user"])
		Topic topic = messageInstance.topic
		messageInstance.author = user
		messageInstance.creationDate = new Date()
		messageInstance.rate = 0
		messageInstance.validate()
		
        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'create'
            return
        }
		
		messageInstance.save flush:true
		rewardDistributorService.updateActivity(user, topic)
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'messageInstance.label', default: 'Message'), messageInstance.id])
                //redirect messageInstance
				redirect messageInstance.topic
            }
            '*' { respond messageInstance, [status: CREATED] }
        }
		
    }

    def edit(Message messageInstance) {
        respond messageInstance
    }
	
	def upvote(Message messageInstance) {
		messageInstance.registerCurrentUserVote(session["user"]);
		++messageInstance.rate
		messageInstance.save flush:true
		redirect messageInstance.topic
	}
	
	def downvote(Message messageInstance) {
		messageInstance.registerCurrentUserVote(session["user"]);
		--messageInstance.rate
		messageInstance.save flush:true
		redirect messageInstance.topic
	}

    @Transactional
    def update(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view:'edit'
            return
        }

        messageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance.topic
            }
            '*'{ respond messageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Message messageInstance) {

        if (messageInstance == null) {
            notFound()
            return
        }

        messageInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageInstance.label', default: 'Message'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
