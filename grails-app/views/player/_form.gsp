<%@ page import="web3.project.Player" %>
<%@ page import="web3.project.Role" %>


<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="player.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${playerInstance.age}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="player.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contact" name="contact.id" from="${web3.project.Contact.findAllByRole(Role.findByType("Player"))}" optionKey="id" required="" value="${newContactId == null? playerInstance?.contact?.id : newContactId}" class="many-to-one"/>
	<g:link controller="contact" action="create" params="['role.id': Role.findByType("Player")?.id, lastController: params.controller, lastAction: params.action]">${message(code: 'default.add.label', args: [message(code: 'player.label', default: 'Player')])}</g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="player.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${playerInstance?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="player.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="team" name="team.id" from="${web3.project.Team.list()}" optionKey="id" required="" value="${playerInstance?.team?.id}" class="many-to-one"/>
</div>

