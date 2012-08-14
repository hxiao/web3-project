
<%@ page import="web3.project.League" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-league" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-league" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list league">
			
				<g:if test="${leagueInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="league.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${leagueInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="league.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${leagueInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.season}">
				<li class="fieldcontain">
					<span id="season-label" class="property-label"><g:message code="league.season.label" default="Season" /></span>
					
						<span class="property-value" aria-labelledby="season-label"><g:fieldValue bean="${leagueInstance}" field="season"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="league.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="contact" action="show" id="${leagueInstance?.admin?.id}">${leagueInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.teams}">
				<li class="fieldcontain">
					<span id="teams-label" class="property-label"><g:message code="league.teams.label" default="Teams" /></span>
					
						<g:each in="${leagueInstance.teams}" var="t">
						<span class="property-value" aria-labelledby="teams-label"><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${leagueInstance?.id}" />
					<g:link class="edit" action="edit" id="${leagueInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
