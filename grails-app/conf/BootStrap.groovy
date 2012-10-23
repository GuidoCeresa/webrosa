class BootStrap {

    def init = { servletContext ->
        servletContext.startController = "/webrosa/agenda/"
    }

    def destroy = {
    }
}
