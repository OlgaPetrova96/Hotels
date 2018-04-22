<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
        <title>Список стран</title>
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
                <th>Название</th>
                <th>Столица</th>
              </tr>
            </thead>
            <tbody>
                <g:each var="country" in="${countryList}">
                    <tr>
                        <td><a href="show/${country.id}">${country.name}</a></td>
                        <td>${country.capital}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create">Добавить страну</g:link></li>
            </ul>
        </div>
    </body>
</html>