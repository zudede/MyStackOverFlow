package mystackoverflow



import static org.springframework.http.HttpStatus.*

import org.springframework.web.servlet.view.RedirectView;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

		log.info "New user created"
        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }
	
    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def connect() {
		render (view: "login", model:[userInstance:new User(params)])
	}
	
	def disconnect() {
		log.info "Disconnect"
		session["user"]=null
		session["moderator"]=null
		session["administrator"]=null
		redirect uri:""
	}
	
	def login(User userInstance) {
		String login = userInstance.login
		String password = userInstance.passwordHash
		def user = User.findByLogin(login)
		if(user) {
			if (user.isBlocked)
			{
				log.info String.format("user %s is blocked", user)
				request.withFormat {
					form {
						flash.message = message(code:'user.isblocked')	
						redirect action:"connect", method: "GET"
					}
				}
			}
			else if (password.equals(user.passwordHash)) {
				log.info String.format("User %s is connected", user)
				session["user"]=user.id
				session["moderator"]=user.isModerator
				session["administrator"]=user.isAdmin
				redirect uri:""
			}
			else {
				log.info "Wrong Password"
				request.withFormat {
					form {
						flash.message = message(code:'user.wrongPassword')
						redirect action:"connect", method: "GET"
					}
				}
			} 
		} else {
			render view:"login", model:[authenticationFailed:true]
		}
	}
	
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
