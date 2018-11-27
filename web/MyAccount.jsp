<%-- 
    Document   : MyAccount
    Created on : Nov 14, 2018, 10:53:31 PM
    Author     : Windows 10
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
    <center><h1>MyAccount!</h1></center> 
        ${ac.fname}
        ${ac.lname}   <br>
        ${ac.email}
        <a href="Payment">Payment</a><br>
        <a href="Logout">Logout</a>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
