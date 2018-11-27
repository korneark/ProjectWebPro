<%-- 
    Document   : ShowCart
    Created on : Nov 26, 2018, 6:22:13 PM
    Author     : Narathip
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
    <center>       
        <table id="example" class="table">
            <thead>
            <th>Image</th>
            <th>No</th>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total Price</th>
        </thead>

        <c:set var="items" value="${sessionScope.cart.lineItems}"/>
        <c:set var="bgColorX" value="lightgray" />
        <c:set var="bgColorY" value="white" />

        <c:forEach items="${cart.lineItems}" var="line" varStatus="vs">
            <tr style="background-color: ${vs.count%2==1 ? bgColorX:colrY}">
                <td><img src="Pic/${line.product.productid}.jpg" width="120"></td>
                <td>${vs.count}</td>
                <td>${line.product.productid}</td>
                <td>${line.product.productname}</td>
                <td><a href="RemoveProductInCart?productId=${line.product.productid}">
                        <input type="button" value="-"/>
                    </a>${line.quantity}<a href="AddItemInCart?productCode=${line.product.productid}">
                        <input type="button" value="+"/>
                    </a></td>
                <td>${line.product.productprice}</td>
                <td>${line.totalPrice}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4"></td>

            <td>${cart.totalQuantity}</td>
            <td></td>
            <td>${cart.totalPrice}</td>
        </tr>
    </table>
    <a href="Payment">Payment</a>
    </center>
    ${QuantityError}
    <script>
        function myfunction(){
            window.alert(${QuantityError});
        }
    </script>
    <br><br><br><br><br><br><br><br><br>
    <jsp:include page="Footer.jsp"/>
</body>
</html>

