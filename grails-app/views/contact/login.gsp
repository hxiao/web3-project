<%@ page import="web3.project.Contact" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <h1>Login</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:form action="authenticate" method="post" >
      <div class="dialog">
        <table>
          <tbody>            
            <tr class="prop">
              <td class="name">
                <label for="email">Email:</label>
              </td>
              <td>
                <input type="text" id="email" name="email"/>
              </td>
            </tr> 

            <tr class="prop">
              <td class="name">
                <label for="password">Password:</label>
              </td>
              <td>
                <input type="password" id="password" name="password"/>
              </td>
            </tr> 
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button">
          <input class="save" type="submit" value="Login" />
        </span>
      </div>
    </g:form>
  </body>
</html>
