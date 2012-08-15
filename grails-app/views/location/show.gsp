
<%@ page import="web3.project.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:if test="${locationInstance?.contact.id == session.user?.id || session.user?.role.type.equals("League Admin")}">
				<p><g:link class="edit" action="edit" controller="location" id="${locationInstance?.id}">Edit Location</g:link></p>
			</g:if>
			
			<ul class="property-list location">
			
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
					
						<span class="property-value" aria-labelledby="contact-label">${locationInstance?.contact?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ul>
		</div>
	</body>
</html>
