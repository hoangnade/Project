<%-- 
    Document   : index
    Created on : Jan 11, 2021, 8:40:17 PM
    Author     : manch
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <style>
            a{
                display: block;
                text-decoration: none;
                color:#000;
                text-transform: uppercase;
                font-weight: 500;
            }
            .card {
                text-align: center;
                height: 320px;
            }
            .card img{
                max-width: 100%;
                max-height: 100%;
                object-fit: contain;
            }
            a:hover{
                color: red !important;
            }
        </style> 
    </head>  
    <body>
        <%@include  file="component/navbar.jsp"%>
        <div class= "container mt-5">
            <div class="row">
                <div class="col-md-2">
                    <h5>Brand</h5>
                    <c:forEach items="${requestScope.brandData}" var="brand">
                        <a class="mt-3"href="filter?id=${brand.id}&type=1">${brand.name}</a>
                    </c:forEach>

                    <h5 class="mt-5">Category</h5>
                    <c:forEach items="${requestScope.categoryData}" var="category">
                        <a class="mt-3" href="filter?id=${category.id}&type=2">${category.name}</a>
                    </c:forEach>

                    <h5 class="mt-5">Price</h5>
                    <c:forEach items="${requestScope.priceData}" var="price">
                        <a class="mt-3" href="filter?id=${price.id}&type=3">${price.name}</a>
                    </c:forEach>

                </div>
                <div class="col-md-10">
                    <div class="row">

                        <div class="col-md-3 mt-4">
                            <div class="card">
                                <img src="assets/images/products/${lastData.imgName}" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="product-detail?id=${lastData.id}" style=" text-decoration: none; color: #000;">
                                            ${lastData.name}
                                        </a>
                                    </h5>
                                    <h5><fmt:formatNumber type="currency" value="${lastData.price}"/></h5>
                                    <a href="#" class="btn btn-primary">Add to cart</a>
                                </div>
                            </div>
                        </div>

                    </div>    
                </div>
            </div>
        </div>    
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>


    </body>
</html>
