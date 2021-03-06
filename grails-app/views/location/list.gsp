
<%@ page import="web3.project.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-location" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="location.street.label" default="Street Address" /></th>
					
						<th><g:message code="location.city.label" default="City" /></th>
					
						<th><g:message code="location.zipCode.label" default="Zip Code" /></th>
					
						<th><g:message code="location.contact.label" default="Contact" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "street")}</g:link></td>
					
						<td>${fieldValue(bean: locationInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "zipCode")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "contact")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationInstanceTotal}" />
			</div>
			<g:if test="${session.user?.role?.type.equals("League Admin")}">
			<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</g:if>
		</div>
	</body>
</html>
