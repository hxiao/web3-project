package web3.project

class Player {
  Integer age
  String position
  Contact contact
  Team team

  static mapping = {
    table "Player"
    id column: "Player_ID"
    age column: "Age"
    position column: "Position"
    contact column: "Contact"
    team column: "Team"
    version false
  }

  static constraints = {
  }
}
