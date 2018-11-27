<%-- 
    Document   : index
    Created on : Nov 27, 2018, 9:28:06 PM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
            body{
                background: #00b4da;
            }
        </style>
       <jsp:include page="Header.jsp"/>
    </head>
    <body>
      
        <div class="jumbotron fontLob">
            <center><h1>Welcome to Bluetech!</h1></center>     
  </div>
<div class="container">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
<!--     Indicators 
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>-->

    
    <div class="carousel-inner">
      <div class="item active">
        <img src="Pic/1001.jpg" alt="" style="width:100%;">
      </div>

      <div class="item">
        <img src="Pic/1002.jpg" alt="" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="Pic/1003.jpg" alt="" style="width:100%;">
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
       <jsp:include page="Footer.jsp"/>


</body>
    
</html>
