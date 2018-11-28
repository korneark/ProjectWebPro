<%-- 
    Document   : Payment
    Created on : Nov 27, 2018, 8:40:29 PM
    Author     : Narathip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/payment.css"/>
        <title>JSP Page</title>
        <style>
       
        </style>
    </head>
    <body>
        
        <jsp:include page="Header.jsp"/>
         <!-- heading starts here -->
<hgroup class="heading">
<h1 class="major">Checkout Form </h1>
</hgroup> 
<!-- end heading -->

<!-- main content --> 

<form class="checkout">
    <div class="checkout-header">
      <h1 class="checkout-title">
        Checkout
        
      </h1>
    </div>
    <p>
      <input type="text" class="checkout-input checkout-name" placeholder="Your name" autofocus>
      <input type="text" class="checkout-input checkout-exp" placeholder="MM">
      <input type="text" class="checkout-input checkout-exp" placeholder="YY">
    </p>
    <p>
      <input type="text" class="checkout-input checkout-card" placeholder="4111 1111 1111 1111">
      <input type="text" class="checkout-input checkout-cvc" placeholder="CVC">
    </p>
    <p>
      <input type="submit" value="Purchase" class="checkout-btn">
    </p>
  </form>

<!-- end of main cotnent -->
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
