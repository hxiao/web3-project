package web3.project

class ContactController {
  def scaffold = Contact

    def login = {}

  def authenticate = {
    def user = Contact.findByEmailAndPassword(params.email, params.password)
      if(user){
        session.user = user
        flash.message = "Hello ${user.firstName}!"
        redirect(controller:"league", action:"list")      
      }else{
        flash.message = "Sorry, that username/password is not recognized. Please try again."
        redirect(action:"login")
      }
  }

  def logout = {
    flash.message = "Goodbye ${session.user.firstName}."
    session.user = null
    redirect(controller:"league", action:"list")      
  }
}
