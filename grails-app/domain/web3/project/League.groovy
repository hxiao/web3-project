package web3.project

class League {
  String name
  String year
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
}
