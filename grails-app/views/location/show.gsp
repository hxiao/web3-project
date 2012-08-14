
<%@ page import="web3.project.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="location.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${locationInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="location.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${locationInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="location.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${locationInstance}" field="zipCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="location.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:link controller="contact" action="show" id="${locationInstance?.contact?.id}">${locationInstance?.contact?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="location.games.label" default="Games" /></span>
					
						<g:each in="${locationInstance.games}" var="g">
						<span class="property-value" aria-labelledby="games-label"><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
