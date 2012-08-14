
<%@ page import="web3.project.Team" %>

		<div id="list-team" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="['Team']" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'team.name.label', default: 'Name')}" />
					
						<th><g:message code="team.coach.label" default="Coach" /></th>
					
						<th><g:message code="team.league.label" default="League" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamInstanceList}" status="i" var="teamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teamInstance.id}">${fieldValue(bean: teamInstance, field: "name")}</g:link></td>
					
						<g:if test="${session.user != null && teamInstance.league.admin.id.equals(session.user.id)}">
							<td><g:link action="show" controller="contact" id="${teamInstance.coach.id}">${fieldValue(bean: teamInstance, field: "coach")}</g:link></td>
						</g:if>
						<g:else>
							<td>${fieldValue(bean: teamInstance, field: "coach")}</td>
						</g:else>
					
						<td>${fieldValue(bean: teamInstance, field: "league")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>