package web3.project

class Role {
  String type
  static hasMany = [contacts: Contact]

  static mapping = {
    table "Role"
    id column: "Role_ID"
    type column: "Type"
    version false
  }

  static constraints = {
    type blank: false
  }

	String toString() {
		type
	}
}
