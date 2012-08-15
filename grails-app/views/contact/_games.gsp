
<%@ page import="web3.project.Game" %>

	<g:if test="${gameInstanceList != null}">
		<div id="list-game" class="content scaffold-list" role="main">
			<h1>Games</h1>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="game.homeTeam.label" default="Home Team" /></th>
					
						<th><g:message code="game.awayTeam.label" default="Away Team" /></th>
					
						<th><g:message code="game.date.label" default="Date" /></th>
						
						<th><g:message code="game.time.label" default="Time" /></th>
					
						<th><g:message code="game.location.label" default="Location" /></th>
						
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
							<td><g:link action="show" controller="game" id="${gameInstance.id}">n/a</g:link></td>
						</g:if>	
						<g:else>
							<td><g:link action="show" controller="game" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "homeScore")} - ${fieldValue(bean: gameInstance, field: "awayScore")}</g:link></td>
						</g:else>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</g:if>
