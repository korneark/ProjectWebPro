<%-- 
    Document   : Login
    Created on : Nov 14, 2018, 2:25:12 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/login.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="login">
  <div class="heading">
    <h2>Sign in</h2>
    <form action="Login">

      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" class="form-control" placeholder="Username or email" name="username">
          </div>

        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" class="form-control" placeholder="Password" name="password">
        </div>

        <button type="submit" class="float">Login</button>
       </form>
 		</div>
 </div>
    </body>
</html>
