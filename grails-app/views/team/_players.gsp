
<%@ page import="web3.project.Player" %>

		<div id="list-player" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="['Player']" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="age" title="${message(code: 'player.age.label', default: 'Age')}" />
					
						<th><g:message code="player.contact.name.label" default="Name" /></th>
						
						<g:sortableColumn property="position" title="${message(code: 'player.position.label', default: 'Position')}" />
					
						<th><g:message code="player.team.label" default="Team" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playerInstanceList}" status="i" var="playerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: playerInstance, field: "age")}</td>
						
						<g:if test="${session.user != null && session.user.canViewPlayer(playerInstance)}">
							<td><g:link action="show" controller="contact" id="${playerInstance.contact.id}">${fieldValue(bean: playerInstance.contact, field: "lastName")}, ${fieldValue(bean: playerInstance.contact, field: "firstName")}</g:link></td>
						</g:if>
						<g:else>
							<td>${fieldValue(bean: playerInstance.contact, field: "lastName")}, ${fieldValue(bean: playerInstance.contact, field: "firstName")}</td>
						</g:else>
											
						<td>${fieldValue(bean: playerInstance, field: "position")}</td>
					
						<td><g:link action="show" controller="team" id="${playerInstance.team?.id}">${fieldValue(bean: playerInstance, field: "team")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>

