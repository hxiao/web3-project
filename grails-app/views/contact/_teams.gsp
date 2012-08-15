
<%@ page import="web3.project.Team" %>

	<g:if test="${teamInstanceList != null}">
		<div id="list-team" class="content scaffold-list" role="main">
			<h1>My Teams</h1>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="team.name.label" default="Name" /></th>
					
						<th><g:message code="team.coach.label" default="Coach" /></th>
						
						<th><g:message code="team.wins.label" default="Wins" /></th>
						
						<th><g:message code="team.losses.label" default="Losses" /></th>
						
						<th><g:message code="team.draws.label" default="Draws" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamInstanceList}" status="i" var="teamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" controller="team" id="${teamInstance.id}">${fieldValue(bean: teamInstance, field: "name")}</g:link></td>
					
						<g:if test="${session.user != null && teamInstance.league.admin.id.equals(session.user.id)}">
							<td><g:link action="show" controller="contact" id="${teamInstance.coach.id}">${fieldValue(bean: teamInstance, field: "coach")}</g:link></td>
						</g:if>
						<g:else>
							<td>${fieldValue(bean: teamInstance, field: "coach")}</td>
						</g:else>
						
						<td>${teamInstance.wins()}</td>
						
						<td>${teamInstance.losses()}</td>
						
						<td>${teamInstance.draws()}</td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</g:if>