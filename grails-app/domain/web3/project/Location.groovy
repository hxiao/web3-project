package web3.project

class Location {
  String street
  String city
  String zipCode
  Contact contact

  static mapping = {
    table "Location"
    id column: "Location_ID"
    street column: "Street"
    city column: "City"
    zipCode column: "Zip_code"
    contact column: "Contact"
    version false
  }

  static constraints = {
    street blank: false
    city blank: false
    zipCode blank: false
  }
}
