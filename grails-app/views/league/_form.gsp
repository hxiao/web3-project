<%@ page import="web3.project.League" %>



<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="league.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${leagueInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="league.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${leagueInstance.year}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'season', 'error')} required">
	<label for="season">
		<g:message code="league.season.label" default="Season" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="season" required="" value="${leagueInstance?.season}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="league.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admin" name="admin.id" from="${web3.project.Contact.list()}" optionKey="id" required="" value="${leagueInstance?.admin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="league.teams.label" default="Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${leagueInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="team" action="create" params="['league.id': leagueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>
</li>
</ul>

</div>

