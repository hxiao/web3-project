package league.manager

class LoginTagLib {
  def loginControl = {
    if(session.user) {
      out << "Logged In As: ${session.user.email}<br/>"
      out << "Role: ${session.user.role.type} | ${link(action:"logout", controller:"contact"){"Logout"}}"
    } else {
      out << "Not Logged In<br/>"
      out << """${link(action:"login", controller:"contact"){"Login"}}"""      
    }
  }
}
