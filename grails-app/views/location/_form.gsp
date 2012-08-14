<%@ page import="web3.project.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="location.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${locationInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="location.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${locationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="location.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipCode" required="" value="${locationInstance?.zipCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="location.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contact" name="contact.id" from="${web3.project.Contact.list()}" optionKey="id" required="" value="${locationInstance?.contact?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'games', 'error')} ">
	<label for="games">
		<g:message code="location.games.label" default="Games" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${locationInstance?.games?}" var="g">
    <li><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="game" action="create" params="['location.id': locationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'game.label', default: 'Game')])}</g:link>
</li>
</ul>

</div>

