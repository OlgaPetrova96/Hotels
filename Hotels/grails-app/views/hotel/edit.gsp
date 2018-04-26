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
                <table style="width: 20%; border: none; margin-left: 20%;">
                    <tr>
                        <td><b>Название</b></td>
                        <td><g:field class="form-control" type="text" name="name" required="true" value="${this.hotel.name}"/></td>
                    </tr>
                    <tr>
                        <td><b>Звездность</b></td>
                        <td><g:field class="form-control" type="text" name="stars" required="true" value="${this.hotel.stars}"/></td>
                    </tr>
                    <tr>
                        <td><b>Страна</b></td>
                        <td><g:field class="form-control" type="text" name="country" required="true" value="${this.hotel.country}"/></td>
                    </tr>
                    <tr>
                        <td><b>Сайт</b></td>
                        <td><g:field class="form-control" type="text" name="url" required="false" value="${this.hotel.url}"/></td>
                    </tr>
                </table>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="Изменить" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
