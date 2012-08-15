
<%@ page import="web3.project.League" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title>Dashboard</title>
	</head>
	<body>
		<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:if test="${leagueInstanceList != null}">
		<div id="list-league" class="content scaffold-list" role="main">
			<h1>My Leagues</h1>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="league.name.label" default="Name" /></th>
					
						<th><g:message code="league.year.label" default="Year" /></th>
					
						<th><g:message code="league.season.label" default="Season" /></th>
					
						<th><g:message code="league.admin.label" default="Admin" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${leagueInstanceList}" status="i" var="leagueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${leagueInstance.id}">${fieldValue(bean: leagueInstance, field: "name")}</g:link></td>
					
						<td>${leagueInstance.year}</td>
					
						<td>${fieldValue(bean: leagueInstance, field: "season")}</td>
					
						<td>${fieldValue(bean: leagueInstance, field: "admin")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
				<g:if test="${session.user?.role?.type.equals("League Admin")}">
					<g:link controller="league" action="create">Create League</g:link>
				</g:if>
		</div>
		</g:if>
		
		<g:render template="teams"/>
		
		<g:render template="games"/>
		
	</body>
</html>
