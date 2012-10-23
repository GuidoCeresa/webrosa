

<%@ page import="it.algos.rosa.Agenda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${agendaInstance}">
            <div class="errors">
                <g:renderErrors bean="${agendaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${agendaInstance?.id}" />
                <g:hiddenField name="version" value="${agendaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="agenda.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${agendaInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cognome"><g:message code="agenda.cognome.label" default="Cognome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'cognome', 'errors')}">
                                    <g:textField name="cognome" value="${agendaInstance?.cognome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="agenda.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${agendaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="agenda.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'categoria', 'errors')}">
                                    <g:select name="categoria.id" from="${it.algos.rosa.Categoria.list()}" optionKey="id" value="${agendaInstance?.categoria?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localita"><g:message code="agenda.localita.label" default="Localita" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'localita', 'errors')}">
                                    <g:select name="localita.id" from="${it.algos.rosa.Localita.list()}" optionKey="id" value="${agendaInstance?.localita?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="note"><g:message code="agenda.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'note', 'errors')}">
                                    <g:textArea name="note" cols="40" rows="5" value="${agendaInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="agenda.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${agendaInstance?.email}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
