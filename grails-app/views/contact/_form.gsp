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

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="contact.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="role" name="role.id" from="${web3.project.Role.list()}" optionKey="id" required="" value="${contactInstance?.role?.id}" class="many-to-one"/>
	<g:message code="contact.role.value" default="${contactInstance?.role?.type}"/>
</div>

<g:if test="${lastController != null}">
	<g:hiddenField id="lastController" name="lastController" required="" value="${lastController}" />
</g:if>
<g:if test="${lastAction != null}">
	<g:hiddenField id="lastAction" name="lastAction" required="" value="${lastAction}" />
</g:if>
