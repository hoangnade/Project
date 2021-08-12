<%-- 
    Document   : cart
    Created on : Mar 2, 2021, 8:22:26 PM
    Author     : manch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Bootstrap CSS -->

<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Cart</title>
        <style>
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="component/user-nav.jsp"%>

        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-3" style="margin-top: 20px">
                    <div class="left-side">
                        <div class="row title">
                            <div class="col-md-12">
                                <h6>Menu</h6>
                            </div>
                        </div>
                        <%@include file="component/user-sidebar.jsp"%>
                    </div>
                </div>


                <div class="col-md-8">
                    <h3 class="mt-5 mb-3">Detail(s)</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listOrderDetail}" var="order">
                                <tr>
                                    <td>
                                        ${order.productId}
                                    </td>
                                    <td>
                                        ${order.productName}
                                    </td>
                                    <td>
                                        ${order.quantity}
                                    </td>
                                    <td>
                                        <fmt:formatNumber type="currency" currencySymbol="đ" value="${order.productPrice}" />
                                    </td>                           
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!--                    <div class="row">
                                <div  class="col-md-6">
                                    <a class="btn btn-info" href="products">Continue shopping</a>
                                </div>-->


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
