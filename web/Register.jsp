<%-- 
    Document   : Register
    Created on : Nov 15, 2018, 3:29:28 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/login.css"/>
        <title>JSP Page</title>
        <style>
            button {
      margin-top: 20px;
      background: $button-background-color;
      border: none;
      font-size: 1.6em;
      font-weight: 300;
      padding: 5px 0;
      width: 100%;
      border-radius: 3px;
      color: lighten($button-background-color, 40%);
      border-bottom: 4px solid darken($button-background-color, 10%);

      &:hover {
        background: tint($button-background-color, 4%);
        -webkit-animation: hop 1s;
        animation: hop 1s;
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="login">
  <div class="heading">
    <h2>Register</h2>
    <form action="Register">

      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" class="form-control" placeholder="Username or email" name="username">
          </div>
        <br>
        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" class="form-control" placeholder="Password" name="password">
        </div>
        <br>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa "></i></span>
        <input type="text" class="form-control" placeholder="fname" name="fName">
          </div>
        <br>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class=""></i></span>
        <input type="text" class="form-control" placeholder="lname" name="lName">
          </div>
        <br>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class=""></i></span>
        <input type="email" class="form-control" placeholder="Email" name="email">
          </div>
        <br>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class=""></i></span>
        <input type="text" class="form-control" placeholder="Address" name="address">
          </div>
        <br>
                <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class=""></i></span>
        <input type="number" class="form-control" placeholder="TelNo" name="telNo">
          </div>
        <br>
                <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class=""></i></span>
        <input type="number" class="form-control" placeholder="Payment No" name="creditCard">
          </div>
        <br>
        <button type="submit" class="float">Register</button>
       </form>
 		</div>
 </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
