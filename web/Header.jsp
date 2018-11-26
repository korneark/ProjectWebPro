<%-- 
    Document   : Header
    Created on : Nov 26, 2018, 4:14:30 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <style>
         body,html {
  margin: 0;
  font: bold 18px sans-serif;
  background: #B7C11E;
}
a {
  color: #EFF1C2; 
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 0.15em;
}
ul { 
  margin: 100px auto 0; 
  padding: 0; 
  list-style: none; 
  display: table;
}
/*** 1 ***/
section.stretch{
  background-color:#2E313D;
  padding:20px auto;
  margin:20px auto;
}
section.stretch ul {
  margin: 100px auto 0; 
  padding: 0; 
  list-style: none; 
  display: table;
  padding: 0; 
  list-style: none; 
  display: table;
  width: 500px;
  text-align: center;
}
section.stretch li { 
  display: table-cell; 
  position: relative; 
  padding: 15px 0;
}
section.stretch a {
  display: inline-block;
  padding: 15px 20px;
  position: relative;
}
section.stretch a:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 2px;
  left: 50%;
  position: absolute;
  background: #fff;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
section.stretch a:hover:after { 
  width: 100%; 
  left: 0; 
}   
        </style>
    </head>
    <body>
        
        <section class="stretch">
<ul>
    <li><a href="Homepage.jsp">Home</a></li>
    <li><a href="ProductList.jsp">Product</a></li>
    <li><a href="MyAccount.jsp">Account</a></li>
    <li><a href="ShowCart.jsp">Cart</a></li>
</ul>
</section>
        <script>
            
        </script>
    </body>
</html>
