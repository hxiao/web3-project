package web3.project

import org.springframework.dao.DataIntegrityViolationException

class LocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [locationInstanceList: Location.list(params), locationInstanceTotal: Location.count()]
    }

    def create() {
        [locationInstance: new Location(params)]
    }

    def save() {
        def locationInstance = new Location(params)
        if (!locationInstance.save(flush: true)) {
            render(view: "create", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def show(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def edit(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def update(Long id, Long version) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (locationInstance.version > version) {
                locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'location.label', default: 'Location')] as Object[],
                          "Another user has updated this Location while you were editing")
                render(view: "edit", model: [locationInstance: locationInstance])
                return
            }
        }

        locationInstance.properties = params

        if (!locationInstance.save(flush: true)) {
            render(view: "edit", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def delete(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        try {
            locationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "show", id: id)
        }
    }
}
