<%-- 
    Document   : ProductList
    Created on : Aug 8, 2018, 3:23:40 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/productList.css"/>
        <title>JSP Page</title>





    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <table class="table">
            <tr>
                <td>
                    <c:if test="${cart != null}">
                        <a href="ShowCart.jsp">Your Cart: (${cart.totalQuantity})</a>
                    </c:if>
                </td>
            </tr>
        </table>
        <form action="Search">
                <input type = search name="search" id="search">
                <input type="submit" value="search">
            </form>
        <c:forEach items="${product}" var="p" varStatus="vs">            
            <div id="container">	

                <!-- Start	Product details -->
                <div class="product-details">

                    <!-- 	Product Name -->
                    <h1>${p.productname}</h1>
                    <!-- 		<span class="hint new">New</span> -->
                    <!-- 		<span class="hint free-shipping">Free Shipping</span> -->
                    <!-- 		the Product rating -->
                    <span class="hint-star star">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                        <i class="fa fa-star-o" aria-hidden="true"></i>
                    </span>


                    <!-- The most important information about the product -->
                    <p class="information">
                        มาแรง!<br>
                        ขายดี!<br>
                        ส่งฟรี!<br>

                    </p>



                    <!-- 		Control -->
                    <div class="control">

                        <!-- Start Button buying -->
                        <button class="btn">
                            <!-- 		the Price -->
                            <span class="price">${p.productprice}</span>
                            <!-- 		shopping cart icon-->
                            <span class="shopping-cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                            <!-- 		Buy Now / ADD to Cart-->
                            <span class="buy"><a href="AddToCart?productCode=${p.productid}">Add To Cart</a></span>
                        </button>
                        <!-- End Button buying -->

                    </div>

                </div>

                <!-- 	End	Product details   -->
                <!-- 	Start product image & Information -->

                <div class="product-image">

                    <img src="Pic/${p.productid}.jpg" alt="Omar Dsoky">

                    <!-- 	product Information-->
                    <div class="info">
                        <h2>The Description</h2>
                        ${p.productdetail}
                    </div>
                </div>
                <!--  End product image  -->


            </div>
                    
        </c:forEach>



        <jsp:include page="Footer.jsp"/>
    </body>
</html>
