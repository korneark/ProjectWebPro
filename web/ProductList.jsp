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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
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
        <div class="table">

            <table id="example" class="table">
                <thead>
                <th>Image</th>
                <th>No</th>
                <th>Product Id</th>
                <th>Product Name</th>  
                <th>Product Detail</th>
                <th>Add</th>
                </thead>
                <c:forEach items="${product}" var="p" varStatus="vs">
                    <tr>
                        <td><img src="Pic/${p.productid}.jpg" width="120"></td>
                        <td>${vs.count}</td>
                        <td><a href="GetProduct?productId=${p.productid}">${p.productid}</a></td>
                        <td>${p.productname}</td>                       
                        <td>${p.productdetail}</td>     
                        <td> <a href="AddToCart?productCode=${p.productid}">
                                <input type="button" value="Add to cart"/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
           <jsp:include page="Footer.jsp"/>
</body>
</html>
