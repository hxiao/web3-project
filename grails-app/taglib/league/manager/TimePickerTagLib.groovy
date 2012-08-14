package league.manager

class TimePickerTagLib {
	/**
	    * A simple time picker that renders a time as selects
	    * eg. <g:timePicker name="myTime" value="${new Date()}" />
	    */
	    def timePicker = {attrs ->
	        def xdefault = attrs['default']
	        if (xdefault == null) {
	            xdefault = new Date()
	        } else if (xdefault.toString() != 'none') {
	            if (xdefault instanceof String) {
	                xdefault = DateFormat.getInstance().parse(xdefault)
	            }else if(!(xdefault instanceof Date)){
	                throwTagError("Tag [timePicker] requires the default date to be a parseable String or a Date")
	            }
	        } else {
	            xdefault = null
	        }

	        def value = attrs['value']
	        if (value.toString() == 'none') {
	            value = null
	        } else if (!value) {
	            value = xdefault
	        }
	        def name = attrs['name']
	        def id = attrs['id'] ? attrs['id'] : name

	        def noSelection = attrs['noSelection']
	        if (noSelection != null)
	        {
	            noSelection = noSelection.entrySet().iterator().next()
	        }

	        def years = attrs['years']

	        final PRECISION_RANKINGS = ["year": 0, "month": 10, "day": 20, "hour": 30, "minute": 40]
	        def precision = (attrs['precision'] ? PRECISION_RANKINGS[attrs['precision']] :
				(grailsApplication.config.grails.tags.datePicker.default.precision ?
					PRECISION_RANKINGS["${grailsApplication.config.grails.tags.datePicker.default.precision}"] :
					PRECISION_RANKINGS["minute"]))

	        def day
	        def month
	        def year
	        def hour
	        def minute

	        def c = null
	        if (value instanceof Calendar) {
	            c = value
	        }
	        else if (value != null) {
	            c = new GregorianCalendar();
	            c.setTime(value)
	        }

	        if (c != null) {
	            day = c.get(GregorianCalendar.DAY_OF_MONTH)
	            month = c.get(GregorianCalendar.MONTH)
	            year = c.get(GregorianCalendar.YEAR)
	            hour = c.get(GregorianCalendar.HOUR_OF_DAY)
	            minute = c.get(GregorianCalendar.MINUTE)
	        }

	        if (years == null) {
	            def tempyear
	            if (year == null) {
	                // If no year, we need to get current year to setup a default range... ugly
	                def tempc = new GregorianCalendar()
	                tempc.setTime(new Date())
	                tempyear = tempc.get(GregorianCalendar.YEAR)
	            } else {
	                tempyear = year
	            }
	            years = (tempyear - 100)..(tempyear + 100)
	        }

	        out << "<input type=\"hidden\" name=\"${name}\" value=\"struct\" />"

	        // create day select
	        if (precision >= PRECISION_RANKINGS["day"]) {
	            out.println "<input type=\"hidden\" name=\"${name}_day\" id=\"${id}_day\" value=\"${day}\" />"
	        }

	        // create month select
	        if (precision >= PRECISION_RANKINGS["month"]) {
	            out.println "<input type=\"hidden\" name=\"${name}_month\" id=\"${id}_month\" value=\"${month}\" />"
	        }

	        // create year select
	        if (precision >= PRECISION_RANKINGS["year"]) {
	            out.println "<input type=\"hidden\" name=\"${name}_year\" id=\"${id}_year\" value=\"${year}\" />"
	        }

	        // do hour select
	        if (precision >= PRECISION_RANKINGS["hour"]) {
	            out.println "<select name=\"${name}_hour\" id=\"${id}_hour\">"

	            if (noSelection) {
	                renderNoSelectionOption(noSelection.key, noSelection.value, '')
	                out.println()
	            }

	            for (i in 0..23) {
	                def h = '' + i
	                if (i < 10) h = '0' + h
	                out << "<option value=\"${h}\" "
	                if (hour == h.toInteger()) out << "selected=\"selected\""
	                out << '>' << h << '</option>'
	                out.println()
	            }
	            out.println '</select> :'

	            // If we're rendering the hour, but not the minutes, then display the minutes as 00 in read-only format
	            if (precision < PRECISION_RANKINGS["minute"]) {
	                out.println '00'
	            }
	        }

	        // do minute select
	        if (precision >= PRECISION_RANKINGS["minute"]) {
	            out.println "<select name=\"${name}_minute\" id=\"${id}_minute\">"

	            if (noSelection) {
	                renderNoSelectionOption(noSelection.key, noSelection.value, '')
	                out.println()
	            }

	            for (i in 0..59) {
	                def m = '' + i
	                if (i < 10) m = '0' + m
	                out << "<option value=\"${m}\" "
	                if (minute == m.toInteger()) out << "selected=\"selected\""
	                out << '>' << m << '</option>'
	                out.println()
	            }
	            out.println '</select>'
	        }
	    }
}
