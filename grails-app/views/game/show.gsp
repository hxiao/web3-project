
<%@ page import="web3.project.Game" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-game" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list game">
			
				<g:if test="${gameInstance?.homeTeam}">
				<li class="fieldcontain">
					<span id="homeTeam-label" class="property-label"><g:message code="game.homeTeam.label" default="Home Team" /></span>
					
						<span class="property-value" aria-labelledby="homeTeam-label"><g:link controller="team" action="show" id="${gameInstance?.homeTeam?.id}">${gameInstance?.homeTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.awayTeam}">
				<li class="fieldcontain">
					<span id="awayTeam-label" class="property-label"><g:message code="game.awayTeam.label" default="Away Team" /></span>
					
						<span class="property-value" aria-labelledby="awayTeam-label"><g:link controller="team" action="show" id="${gameInstance?.awayTeam?.id}">${gameInstance?.awayTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.homeScore}">
				<li class="fieldcontain">
					<span id="homeScore-label" class="property-label"><g:message code="game.homeScore.label" default="Home Score" /></span>
					
						<span class="property-value" aria-labelledby="homeScore-label"><g:fieldValue bean="${gameInstance}" field="homeScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.awayScore}">
				<li class="fieldcontain">
					<span id="awayScore-label" class="property-label"><g:message code="game.awayScore.label" default="Away Score" /></span>
					
						<span class="property-value" aria-labelledby="awayScore-label"><g:fieldValue bean="${gameInstance}" field="awayScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="game.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${gameInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="game.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${gameInstance?.location?.id}">${gameInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="game.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${gameInstance?.time}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gameInstance?.id}" />
					<g:link class="edit" action="edit" id="${gameInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
