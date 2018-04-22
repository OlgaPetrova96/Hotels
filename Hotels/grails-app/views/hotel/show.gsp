<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title>Отель ${this.hotel.name}</title>
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
        <a href="#show-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index">Список отелей</g:link></li>
                <li><g:link class="create" action="create">Добавить отель</g:link></li>
            </ul>
        </div>
        <div id="show-hotel" class="content scaffold-show" role="main">
            <h1>Отель</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table style="width: 10%; border: none; margin-left: 20%;">
                <tr>
                    <td><b>Название</b></td>
                    <td>${this.hotel.name}</td>
                </tr>
                <tr>
                    <td><b>Звездность</b></td>
                    <td>${this.hotel.stars}</td>
                </tr>
                <tr>
                    <td><b>Страна</b></td>
                    <td>${this.hotel.country}</td>
                </tr>
                <g:if test="${hotel.url}">
                      <tr>
                          <td><b>Сайт</b></td>
                          <td><a href="${hotel.url}" target="_blank">${this.hotel.url}</a></td>
                      </tr>
                 </g:if>
            </table>
            <g:form resource="${this.hotel}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.hotel}">Изменить</g:link>
                    <input class="delete" type="submit" value="Удалить" onclick="return confirm('Вы уверены, что хотите удалить отель?');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
