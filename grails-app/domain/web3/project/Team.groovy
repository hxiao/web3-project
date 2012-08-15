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
	
	def games() {
		Game.findAll(sort: "date") { homeTeam == this || awayTeam == this }
	}
	
	int homeWins() {
		def games = Game.findAllByHomeTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore > it.awayScore}.size()
	}
	
	int homeLosses() {
		def games = Game.findAllByHomeTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore < it.awayScore}.size()
	}
	
	int homeDraws() {
		def games = Game.findAllByHomeTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore == it.awayScore}.size()
	}
	
	int awayWins() {
		def games = Game.findAllByAwayTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore < it.awayScore}.size()
	}
	
	int awayLosses() {
		def games = Game.findAllByAwayTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore > it.awayScore}.size()
	}
	
	int awayDraws() {
		def games = Game.findAllByAwayTeam(this)
		return games.grep{it.homeScore != null && it.awayScore != null && it.homeScore == it.awayScore}.size()
	}
	
	int wins() {
		return homeWins() + awayWins()
	}
	
	int losses() {
		return homeLosses() + awayLosses()
	}
	
	int draws() {
		return homeDraws() + awayDraws()
	}
}
