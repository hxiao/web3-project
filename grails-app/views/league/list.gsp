
<%@ page import="web3.project.League" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-league" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'league.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'league.year.label', default: 'Year')}" />
					
						<g:sortableColumn property="season" title="${message(code: 'league.season.label', default: 'Season')}" />
					
						<th><g:message code="league.admin.label" default="Admin" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${leagueInstanceList}" status="i" var="leagueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${leagueInstance.id}">${fieldValue(bean: leagueInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: leagueInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: leagueInstance, field: "season")}</td>
					
						<td>${fieldValue(bean: leagueInstance, field: "admin")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${leagueInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
