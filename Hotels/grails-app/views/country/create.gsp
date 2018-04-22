<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
        <title>Добавление страны</title>
    </head>
    <body>
        <content tag="nav">
            <li>
                <a href="/index" role="button">Поиск</a>
            </li>
            <li>
                <g:link controller="country">Справочник стран</g:link>
            </li>
            <li>
                <g:link controller="hotel">Справочник отелей</g:link>
            </li>
        </content>

        <a href="#create-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index">Список стран</g:link></li>
            </ul>
        </div>
        <div id="create-country" class="content scaffold-create" role="main">
            <h1>Добавить страну</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.country}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.country}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.country}" method="POST">
                <fieldset class="form">
                    <f:field bean="country" property="name" label="Название"/>
                    <f:field bean="country" property="capital" label="Столица"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Добавить" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
