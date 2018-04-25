<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title>Редактирование отеля</title>
    </head>
    <body>
    <content tag="nav">
            <li>
                <a href="/Hotels/index" role="button">Поиск</a>
            </li>
            <li>
                <g:link controller="hotel">Справочник стран</g:link>
            </li>
            <li>
                <g:link controller="hotel">Справочник отелей</g:link>
            </li>
        </content>
        <a href="#edit-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index">Список отелей</g:link></li>
                <li><g:link class="create" action="create">Добавить отель</g:link></li>
            </ul>
        </div>
        <div id="edit-hotel" class="content scaffold-edit" role="main">
            <h1>Изменить отель</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.hotel}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.hotel}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.hotel}" method="PUT">
                <g:hiddenField name="version" value="${this.hotel?.version}" />
                <fieldset class="form">
                    <f:field bean="hotel" property="name" label="Название"/>
                    <f:field bean="hotel" property="country" label="Страна"/>
                    <f:field bean="hotel" property="stars" label="Звездность"/>
                    <f:field bean="hotel" property="url" label="Сайт"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="Изменить" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
