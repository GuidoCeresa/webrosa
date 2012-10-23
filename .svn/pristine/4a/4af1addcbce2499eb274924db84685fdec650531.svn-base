package it.algos.rosa

class LocalitaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [localitaInstanceList: Localita.list(params), localitaInstanceTotal: Localita.count()]
    }

    def create = {
        def localitaInstance = new Localita()
        localitaInstance.properties = params
        return [localitaInstance: localitaInstance]
    }

    def save = {
        def localitaInstance = new Localita(params)
        if (localitaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'localita.label', default: 'Localita'), localitaInstance.id])}"
            redirect(action: "show", id: localitaInstance.id)
        }
        else {
            render(view: "create", model: [localitaInstance: localitaInstance])
        }
    }

    def show = {
        def localitaInstance = Localita.get(params.id)
        if (!localitaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
            redirect(action: "list")
        }
        else {
            [localitaInstance: localitaInstance]
        }
    }

    def edit = {
        def localitaInstance = Localita.get(params.id)
        if (!localitaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [localitaInstance: localitaInstance]
        }
    }

    def update = {
        def localitaInstance = Localita.get(params.id)
        if (localitaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (localitaInstance.version > version) {
                    
                    localitaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'localita.label', default: 'Localita')] as Object[], "Another user has updated this Localita while you were editing")
                    render(view: "edit", model: [localitaInstance: localitaInstance])
                    return
                }
            }
            localitaInstance.properties = params
            if (!localitaInstance.hasErrors() && localitaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'localita.label', default: 'Localita'), localitaInstance.id])}"
                redirect(action: "show", id: localitaInstance.id)
            }
            else {
                render(view: "edit", model: [localitaInstance: localitaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def localitaInstance = Localita.get(params.id)
        if (localitaInstance) {
            try {
                localitaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localita.label', default: 'Localita'), params.id])}"
            redirect(action: "list")
        }
    }
}
