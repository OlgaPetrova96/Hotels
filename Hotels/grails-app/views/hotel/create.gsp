<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title>Добавление отеля</title>
    </head>
    <body>
        <content tag="nav">
            <li>
                <a href="/Hotels/index" role="button">Поиск</a>
            </li>
            <li>
                <g:link controller="country">Справочник стран</g:link>
            </li>
            <li>
                <g:link controller="hotel">Справочник отелей</g:link>
            </li>
        </content>
        <a href="#create-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index">Список отелей</g:link></li>
            </ul>
        </div>
        <div id="create-hotel" class="content scaffold-create" role="main">
            <h1>Добавить отель</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.hotel}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.hotel}" var="error">
                <li <g:if test="${error in org.springframework.validation.ValidationError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.hotel}" method="POST">
                <table style="width: 20%; border: none; margin-left: 20%;">
                    <tr>
                        <td><b>Название</b></td>
                        <td>
                            <g:field class="form-control" type="text" name="name" required="true" /></td>
                    </tr>
                    <tr>
                        <td><b>Звездность</b></td>
                        <td><g:field class="form-control" type="number" min="1" max="5" name="stars" required="true" /></td>
                    </tr>
                    <tr>
                        <td><b>Страна</b></td>
                        <td><g:field class="form-control" type="text" name="country" required="true" /></td>
                    </tr>
                    <tr>
                        <td><b>Сайт</b></td>
                        <td><g:field class="form-control" type="text" name="url" pattern="^(http:\\/\\/|https:\\/\\/)[\\w\\d\\-\\.\\/]*"/></td>
                    </tr>
                </table>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Добавить" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
