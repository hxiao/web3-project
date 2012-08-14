package web3.project

import org.springframework.dao.DataIntegrityViolationException

class ContactController {

		def securityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contactInstanceList: Contact.list(params), contactInstanceTotal: Contact.count()]
    }

    def create() {
				if(session.user == null || session.user.role.type.equals("Player")) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
				
        [contactInstance: new Contact(params), lastController: params.lastController, lastAction: params.lastAction]
    }

    def save() {
	
				if(session.user == null) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
	
        def contactInstance = new Contact(params)
        if (!contactInstance.save(flush: true)) {
            render(view: "create", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])

				if(params.lastController == null || params.lastAction == null) {
        	redirect(action: "show", id: contactInstance.id)
				}
				else {
					redirect(controller: params.lastController, action: params.lastAction, params: [newContactId: contactInstance.id])
				}
    }

    def show(Long id) {
				
				if(session.user == null) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
	
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        [contactInstance: contactInstance]
    }

    def edit(Long id) {
				
				if(session.user == null) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
				
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        [contactInstance: contactInstance]
    }

    def update(Long id, Long version) {
	
				if(session.user == null) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
	
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contactInstance.version > version) {
                contactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contact.label', default: 'Contact')] as Object[],
                          "Another user has updated this Contact while you were editing")
                render(view: "edit", model: [contactInstance: contactInstance])
                return
            }
        }

        contactInstance.properties = params

        if (!contactInstance.save(flush: true)) {
            render(view: "edit", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
        redirect(action: "show", id: contactInstance.id)
    }

    def delete(Long id) {
	
				if(session.user == null || !session.user.role.type.equals("League Admin")) {
					flash.message = "You are not authorized to do that."
					redirect(action: "list")
				}
	
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        try {
            contactInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "show", id: id)
        }
    }

		def login = {}

	  def authenticate = {
	    def user = Contact.findByEmailAndPassword(params.email, params.password, [fetch: [teams:"eager"]])
	    if(user){
	      session.user = user
	      session.user.role = user.role
	      flash.message = "Hello ${user.firstName}!"
	      redirect(controller:"league", action:"list")      
	    }else{
	      flash.message = "Sorry, that username/password is not recognized. Please try again."
	      redirect(action:"login")
	    }
	  }

	  def logout = {
			if(session.user == null) {
				flash.message = "You are not logged in."
				redirect(action: "list")
			}
		
	    flash.message = "Goodbye ${session.user.firstName}."
	    session.user = null
	    redirect(uri: "/")      
	  }
}
