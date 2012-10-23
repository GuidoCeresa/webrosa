package it.algos.rosa

class AgendaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def lista

        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        if (servletContext.startController) {
            servletContext.startController = ""
            lista = Agenda.listOrderByCognome(params)
        } else {
            lista = Agenda.list(params)
        }// fine del blocco if-else

        [agendaInstanceList: lista, agendaInstanceTotal: Agenda.count()]
    }

    def create = {
        def agendaInstance = new Agenda()
        agendaInstance.properties = params
        return [agendaInstance: agendaInstance]
    }

    def save = {
        def agendaInstance = new Agenda(params)
        if (agendaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'agenda.label', default: 'Agenda'), agendaInstance.id])}"
            redirect(action: "show", id: agendaInstance.id)
        }
        else {
            render(view: "create", model: [agendaInstance: agendaInstance])
        }
    }

    def show = {
        def agendaInstance = Agenda.get(params.id)
        if (!agendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
        else {
            [agendaInstance: agendaInstance]
        }
    }

    def edit = {
        def agendaInstance = Agenda.get(params.id)
        if (!agendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [agendaInstance: agendaInstance]
        }
    }

    def update = {
        def agendaInstance = Agenda.get(params.id)
        if (agendaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (agendaInstance.version > version) {

                    agendaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'agenda.label', default: 'Agenda')] as Object[], "Another user has updated this Agenda while you were editing")
                    render(view: "edit", model: [agendaInstance: agendaInstance])
                    return
                }
            }
            agendaInstance.properties = params
            if (!agendaInstance.hasErrors() && agendaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'agenda.label', default: 'Agenda'), agendaInstance.id])}"
                redirect(action: "show", id: agendaInstance.id)
            }
            else {
                render(view: "edit", model: [agendaInstance: agendaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def agendaInstance = Agenda.get(params.id)
        if (agendaInstance) {
            try {
                agendaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
    }
}
