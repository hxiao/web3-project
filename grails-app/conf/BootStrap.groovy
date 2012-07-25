import web3.project.Role

class BootStrap {

  def init = { servletContext ->
    if(!Role.count()) {
      new Role(type: "League Admin").save(failOnError: true)
      new Role(type: "Coach").save(failOnError: true)
      new Role(type: "Player").save(failOnError: true)
    }
  }
  def destroy = {
  }
}
