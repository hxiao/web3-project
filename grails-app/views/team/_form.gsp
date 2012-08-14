<%@ page import="web3.project.Team" %>
<%@ page import="web3.project.Role" %>
<%@ page import="web3.project.Contact" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${teamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'coach', 'error')} required">
	<label for="coach">
		<g:message code="team.coach.label" default="Coach" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="coach" name="coach.id" from="${Contact.findAllByRole(Role.findByType("Coach"))}" optionKey="id" required="" value="${newContactId == null ? teamInstance?.coach?.id : newContactId}" class="many-to-one"/>
	<g:link controller="contact" action="create" params="['role.id': Role.findByType("Coach")?.id, lastController: params.controller, lastAction: params.action]">${message(code: 'default.add.label', args: [message(code: 'player.label', default: 'Coach')])}</g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'league', 'error')} required">
	<label for="league">
		<g:message code="team.league.label" default="League" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="league" name="league.id" from="${web3.project.League.list()}" optionKey="id" required="" value="${teamInstance?.league?.id}" class="many-to-one"/>
</div>

<!--
<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="team.players.label" default="Players" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.players?}" var="p">
    <li><g:link controller="player" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="player" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'player.label', default: 'Player')])}</g:link>
</li>
</ul>

</div>
-->

