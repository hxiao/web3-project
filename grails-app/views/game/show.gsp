
<%@ page import="web3.project.Game" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-game" class="content scaffold-show" role="main">
			<h1>Game: ${gameInstance.awayTeam.name} at ${gameInstance.homeTeam.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:if test="${gameInstance?.homeTeam.league.admin.id == session.user?.id}">
				<p><g:link class="edit" action="edit" controller="game" id="${gameInstance?.id}">Edit Game</g:link></p>
			</g:if>
			
			<ul class="property-list game">
			
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
			
				<g:if test="${gameInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="game.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate format="MM/dd/yyyy" date="${gameInstance?.date}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${gameInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="game.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate format="hh:mm a" date="${gameInstance?.time}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${gameInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="game.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${gameInstance?.location?.id}">${gameInstance?.location?.encodeAsHTML()}</g:link></span>
					
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
			
			</ul>
			
		</div>
	</body>
</html>
