package web3.project

class Contact {
  String lastName
  String firstName
  String email
  String phone
  String password
  Role role
  static hasMany = [leagues: League, teams: Team, locations: Location]

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

	boolean canViewPlayer(player) {
		if(role.type.equals("Coach") || role.type.equals("Player")) {
		 	return teams.collect{ it.id }.contains(player.team.id)
		}
		else {
			return false
		}
	}
	
	boolean canViewCoach(contact) {
		def adminIds = contact.leagues.collect{ it.admin.id }
		return false
		//return adminIds.contains(id)
	}
}
