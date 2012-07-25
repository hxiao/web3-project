package web3.project

import java.sql.Date
import java.sql.Time

class Game {
  Date date
  Time time
  Team homeTeam
  Team awayTeam
  Location location
  Integer homeScore
  Integer awayScore

  static mapping = {
    table "Game"
    id column: "Game_ID"
    date column: "Date"
    time column: "Time"
    homeTeam column: "Home_team"
    awayTeam column: "Away_team"
    location column: "Location"
    homeScore column: "Home_score"
    awayScore column: "Away_score"
    version false
  }

  static constraints = {
    homeScore nullable: false
    awayScore nullable: false
  }
}
