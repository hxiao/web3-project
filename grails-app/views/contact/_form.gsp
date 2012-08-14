<%@ page import="web3.project.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="contact.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${contactInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="contact.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${contactInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="contact.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${contactInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="contact.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${contactInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="contact.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${contactInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'leagues', 'error')} ">
	<label for="leagues">
		<g:message code="contact.leagues.label" default="Leagues" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contactInstance?.leagues?}" var="l">
    <li><g:link controller="league" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="league" action="create" params="['contact.id': contactInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'league.label', default: 'League')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="contact.locations.label" default="Locations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contactInstance?.locations?}" var="l">
    <li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="location" action="create" params="['contact.id': contactInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="contact.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${web3.project.Role.list()}" optionKey="id" required="" value="${contactInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="contact.teams.label" default="Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contactInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="team" action="create" params="['contact.id': contactInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>
</li>
</ul>

</div>

