package mystackoverflow



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RewardController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reward.list(params), model:[rewardInstanceCount: Reward.count()]
    }

    def show(Reward rewardInstance) {
        respond rewardInstance
    }

    def create() {
        respond new Reward(params)
    }

    @Transactional
    def save(Reward rewardInstance) {
        if (rewardInstance == null) {
            notFound()
            return
        }

        if (rewardInstance.hasErrors()) {
            respond rewardInstance.errors, view:'create'
            return
        }

        rewardInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rewardInstance.label', default: 'Reward'), rewardInstance.id])
                redirect rewardInstance
            }
            '*' { respond rewardInstance, [status: CREATED] }
        }
    }

    def edit(Reward rewardInstance) {
        respond rewardInstance
    }

    @Transactional
    def update(Reward rewardInstance) {
        if (rewardInstance == null) {
            notFound()
            return
        }

        if (rewardInstance.hasErrors()) {
            respond rewardInstance.errors, view:'edit'
            return
        }

        rewardInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reward.label', default: 'Reward'), rewardInstance.id])
                redirect rewardInstance
            }
            '*'{ respond rewardInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reward rewardInstance) {

        if (rewardInstance == null) {
            notFound()
            return
        }

        rewardInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reward.label', default: 'Reward'), rewardInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rewardInstance.label', default: 'Reward'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
