<%@ page import="web3.project.League" %>
<%@ page import="web3.project.Role" %>
<%@ page import="web3.project.Contact" %>


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
	<g:select id="admin" name="admin.id" from="${Contact.findAllByRole(Role.findByType("League Admin"))}" optionKey="id" required="" value="${leagueInstance?.admin?.id}" class="many-to-one"/>
</div>
