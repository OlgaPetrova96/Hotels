<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title>Список отелей</title>
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
        <table class="table table-striped">
            <thead>
              <tr>
                <th>Звездность</th>
                <th>Название</th>
                <th>Страна</th>
                <th>Сайт</th>
              </tr>
            </thead>
            <tbody>
                <g:each var="hotel" in="${hotelList}">
                    <tr>
                        <td>${hotel.stars}</td>
                        <td><a href="show/${hotel.id}">${hotel.name}</a></td>
                        <td><g:link controller="country" action="show" id="${hotel.country.id}">${hotel.country}</g:link></td>
                        <g:if test="${hotel.url}">
                             <td><a href="${hotel.url}" target="_blank">Перейти на сайт</a></td>
                        </g:if>
                        <g:if test="${!hotel.url}">
                             <td></td>
                        </g:if>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create">Добавить отель</g:link></li>
            </ul>
        </div>
    </body>
</html>