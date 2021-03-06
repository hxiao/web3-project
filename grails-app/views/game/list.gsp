
<%@ page import="web3.project.Game" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-game" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="homeTeam" title="${message(code: 'game.homeTeam.label', default: 'Home Team')}" />
					
						<g:sortableColumn property="awayTeam" title="${message(code: 'game.awayTeam.label', default: 'Away Team')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'game.date.label', default: 'Date')}" />
						
						<g:sortableColumn property="time" title="${message(code: 'game.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'game.location.label', default: 'Location')}" />
						
						<th><g:message code="game.score.label" default="Score" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gameInstanceList}" status="i" var="gameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" controller="team" id="${gameInstance.homeTeam.id}">${fieldValue(bean: gameInstance, field: "homeTeam")}</g:link></td>
					
						<td><g:link action="show" controller="team" id="${gameInstance.awayTeam.id}">${fieldValue(bean: gameInstance, field: "awayTeam")}</g:link></td>

						<td><g:formatDate format="MM/dd/yyyy" date="${gameInstance.date}" /></td>
						
						<td><g:formatDate format="hh:mm a" date="${gameInstance.time}" /></td>
					
						<td><g:link action="show" controller="location" id="${gameInstance.location.id}">${fieldValue(bean: gameInstance, field: "location")}</g:link></td>
						
						<g:if test="${gameInstance.homeScore == null || gameInstance.awayScore == null}">
							<td><g:link action="show" id="${gameInstance.id}">n/a</g:link></td>
						</g:if>	
						<g:else>
							<td><g:link action="show" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "homeScore")} - ${fieldValue(bean: gameInstance, field: "awayScore")}</g:link></td>
						</g:else>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gameInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
