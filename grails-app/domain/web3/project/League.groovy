package web3.project

import java.sql.Date

class League {
  String name
  Short year
  String season
  Contact admin
  static hasMany = [teams: Team]

  static mapping = {
    table "League"
    id column: "League_ID"
    name column: "Name"
    year column: "Year"
    season column: "Season"
    admin column: "Admin"
    version false
  }

  static constraints = {
    name blank: false
    year blank: false
    season blank: false
  }

	String toString() {
		"${name} (${season} ${year})"
	}
	
	def games() {
		if(this.teams.empty) {
			return []
		}
		else {
			return Game.findAll(sort: "date") { homeTeam in teams || awayTeam in teams }
		}
	}
}
