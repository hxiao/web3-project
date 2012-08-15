
<%@ page import="web3.project.Contact" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-contact" class="content scaffold-show" role="main">
			<h1>${contactInstance.lastName}, ${contactInstance.firstName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:if test="${session.user?.id == contactInstance.id}">
				<p><g:link class="edit" action="edit" controller="contact" id="${contactInstance?.id}">Edit Contact</g:link></p>
			</g:if>
			
			<ul class="property-list contact">
			
				<g:if test="${contactInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="contact.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${contactInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="contact.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${contactInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="contact.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${contactInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
			</ul>
			
		</div>
	</body>
</html>
