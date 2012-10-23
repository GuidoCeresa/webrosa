
<%@ page import="it.algos.rosa.Agenda" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName"
           value="${message(code: 'agenda.label', default: 'Agenda')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message
            code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message
            code="default.new.label" args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="id"
                                  title="${message(code: 'agenda.id.label', default: 'Id')}"/>
                
                <g:sortableColumn property="nome"
                                  title="${message(code: 'agenda.nome.label', default: 'Nome')}"/>
                
                <g:sortableColumn property="cognome"
                                  title="${message(code: 'agenda.cognome.label', default: 'Cognome')}"/>
                
                <g:sortableColumn property="telefono"
                                  title="${message(code: 'agenda.telefono.label', default: 'Telefono')}"/>
                
                <g:sortableColumn property="categoria"
                                  title="${message(code: 'agenda.categoria.label', default: 'Categoria')}"/>
                
                <g:sortableColumn property="localita"
                                  title="${message(code: 'agenda.localita.label', default: 'Localita')}"/>
                
                <g:sortableColumn property="note"
                                  title="${message(code: 'agenda.note.label', default: 'Note')}"/>
                
                <g:sortableColumn property="email"
                                  title="${message(code: 'agenda.email.label', default: 'Email')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${agendaInstanceList}" status="i" var="agendaInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "id")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "nome")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "cognome")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "telefono")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "categoria")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "localita")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "note")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "email")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${agendaInstanceTotal}"/>
    </div>
</div>
</body>
</html>
