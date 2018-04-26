<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
    <title>Добавление страны</title>
    <style>
    tr td {
        text-align: right;
    }
    tr td + td
    {
        text-align: left;
    }
    </style>
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
                <li <g:if test="${error in org.springframework.validation.ValidationError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.country}" method="POST" class="navbar-form">
        <table style="width: 20%; border: none; margin-left: 20%;">
            <tr>
                <td><b>Название</b></td>
                <td><g:field class="form-control" type="text" name="name" required="true" /></td>
            </tr>
            <tr>
                <td><b>Столица</b></td>
                <td><g:field class="form-control" type="text" name="capital" required="true"/></td>
            </tr>
        </table>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Добавить" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
