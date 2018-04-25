<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
        <title>Страна ${this.country.name}</title>
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
        <a href="#show-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index">Список стран</g:link></li>
                <li><g:link class="create" action="create">Добавить страну</g:link></li>
            </ul>
        </div>
        <div id="show-country" class="content scaffold-show" role="main">
            <h1>Страна</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table style="width: 20%; border: none; margin-left: 20%;">
                <tr>
                    <td><b>Название</b></td>
                    <td>${this.country.name}</td>
                </tr>
                <tr>
                    <td><b>Столица</b></td>
                    <td>${this.country.capital}</td>
                </tr>
            </table>
            <g:form resource="${this.country}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.country}">Изменить</g:link>
                    <input class="delete" type="submit" value="Удалить" onclick="return confirm('Вы уверены, что хотите удалить страну?');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
