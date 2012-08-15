
<%@ page import="web3.project.Team" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${teamInstance}" field="name"/></h1>

			<h4>
				<span class="property-value" aria-labelledby="admin-label">League: <g:link action="show" controller="league" id="${teamInstance?.league.id}"><g:fieldValue bean="${teamInstance}" field="league"/></g:link></span><br/>
				<span id="admin-label" class="property-label"><g:message code="league.admin.label" default="Coach: " /></span>
				
					<g:if test="${teamInstance?.coach.id == session.user?.id || teamInstance?.league.admin.id == session.user?.id}">
						<span class="property-value" aria-labelledby="admin-label"><g:link action="show" controller="contact" id="${teamInstance?.coach.id}">${teamInstance?.coach?.encodeAsHTML()}</g:link></span>
					</g:if>
					<g:else>
						<span class="property-value" aria-labelledby="admin-label">${teamInstance?.coach?.encodeAsHTML()}</span>
					</g:else>
				
			</h4>
			<g:if test="${teamInstance?.coach.id == session.user?.id || teamInstance?.league.admin.id == session.user?.id}">
				<g:link class="edit" action="edit" id="${teamInstance?.id}">[Edit Team]</g:link>
			</g:if>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:render template="players"/>

			<g:render template="games"/>
		</div>
	</body>
</html>
