package web3.project

class Team {
  String name
  League league
  Contact coach
  static hasMany = [players: Player]

  static mapping = {
    table "Team"
    id column: "Team_ID"
    name column: "Name"
    league column: "League"
    coach column: "Coach"
    version false
  }

  static constraints = {
    name blank: false
  }

	String toString() {
		name
	}
}
