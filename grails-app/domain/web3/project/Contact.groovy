package web3.project

import java.util.ArrayList

class Contact {
  String lastName
  String firstName
  String email
  String phone
  String password
  Role role
  static hasMany = [leagues: League, teams: Team, locations: Location, players: Player]

  static mapping = {
    table "Contact"
    id column: "Contact_ID"
    lastName column: "Last_name"
    firstName column: "First_name"
    email column: "Email"
    phone column: "Phone"
    password column: "Password"
    role column: "Role"
    version false
  }

  static constraints = {
    lastName blank: false
    firstName blank: false
    email blank: false, email: true, unique: true
    phone nullable: true
    password blank: false, password: true
  }

  String toString() {
  	"${lastName}, ${firstName} (${email})"
  }

	def leagues() {
		if(role.type.equals("Player")) {
			return players.collect{ it.team.league }
		}
		else if(role.type.equals("Coach")) {
			return teams.collect{ it.league }
		}
		else if(role.type.equals("League Admin")) {
			return leagues
		}
	}
	
	def games() {
		if(role.type.equals("Player")) {
			def list = new ArrayList()
			players.each{ list.addAll(it.team.games()) }
			return list
		}
		else if(role.type.equals("Coach")) {
			def list = new ArrayList()
			teams.each{ list.addAll(it.games()) }
			return list
		}
		else if(role.type.equals("League Admin")) {
			def list = new ArrayList()
			leagues.each{ list.addAll(it.games()) }
			return list
		}
	}
	
	def teams() {
		if(role.type.equals("Player")) {
			return players.collect{ it.team }
		}
		else if(role.type.equals("Coach")) {
			return teams
		}
		else if(role.type.equals("League Admin")) {
			return leagues.collect{ it.teams }
		}
	}

	boolean canViewPlayer(player) {
		if(role.type.equals("Coach")) {
		 	return teams.collect{ it.id }.contains(player.team.id)
		}
		else if(role.type.equals("Player")) {
			return players.collect{ it.team.id }.contains(player.team.id)
		}
		else {
			return false
		}
	}
	
	boolean canViewCoach(contact) {
		def adminIds = contact.leagues.collect{ it.admin.id }
		return adminIds.contains(id)
	}
}
