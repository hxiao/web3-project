
<%@ page import="web3.project.League" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-league" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${leagueInstance}" field="name"/></h1>

			<h4>
				<span class="property-value" aria-labelledby="admin-label">Season: <g:fieldValue bean="${leagueInstance}" field="season"/> ${leagueInstance.year}</span><br/>
				<span id="admin-label" class="property-label"><g:message code="league.admin.label" default="Admin" /></span>
				
					<span class="property-value" aria-labelledby="admin-label"><g:link controller="contact" action="show" id="${leagueInstance?.admin?.id}">${leagueInstance?.admin?.encodeAsHTML()}</g:link></span>
				
			</h4>
			<g:if test="${leagueInstance?.admin.id == session.user?.id}">
				<g:link class="edit" action="edit" id="${leagueInstance?.id}">[Edit League]</g:link>
			</g:if>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>	
		</div>
		
		<g:render template="../team/list"/>
	</body>
</html>
