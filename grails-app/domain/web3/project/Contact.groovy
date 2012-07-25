package web3.project

class Contact {
  String lastName
  String firstName
  String email
  String phone
  String password
  Role role

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
    password blank: false
  }
}
