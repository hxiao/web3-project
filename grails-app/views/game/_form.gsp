<%@ page import="web3.project.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'homeTeam', 'error')} required">
	<label for="homeTeam">
		<g:message code="game.homeTeam.label" default="Home Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="homeTeam" name="homeTeam.id" from="${web3.project.Team.list()}" optionKey="id" required="" value="${gameInstance?.homeTeam?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'awayTeam', 'error')} required">
	<label for="awayTeam">
		<g:message code="game.awayTeam.label" default="Away Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="awayTeam" name="awayTeam.id" from="${web3.project.Team.list()}" optionKey="id" required="" value="${gameInstance?.awayTeam?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'homeScore', 'error')} ">
	<label for="homeScore">
		<g:message code="game.homeScore.label" default="Home Score" />
		
	</label>
	<g:field name="homeScore" type="number" value="${gameInstance.homeScore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'awayScore', 'error')} ">
	<label for="awayScore">
		<g:message code="game.awayScore.label" default="Away Score" />
		
	</label>
	<g:field name="awayScore" type="number" value="${gameInstance.awayScore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="game.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${gameInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="game.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${web3.project.Location.list()}" optionKey="id" required="" value="${gameInstance?.location?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="game.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="time" precision="minute"  value="${gameInstance?.time}"  />
</div>

