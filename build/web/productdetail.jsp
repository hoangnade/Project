<%-- 
    Document   : index
    Created on : Jan 11, 2021, 8:40:17 PM
    Author     : manch
--%>


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
        <title>Product detail</title>
        <style>
             a{
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 400;
            }
            a:hover {
                color: red !important;
            }

            body {
                font-family: Arial;
                margin: 0;
            }

            * {
                box-sizing: border-box;
            }

            img {
                vertical-align: middle;
            }

            /* Position the image container (needed to position the left and right arrows) */
            .container-img {
                position: relative;
            }

            /* Hide the images by default */
            .mySlides {
                display: none;
            }

            /* Add a pointer when hovering over the thumbnail images */
            .cursor {
                cursor: pointer;
            }

            /* Next & previous buttons */
            .prev,
            .next {
                cursor: pointer;
                position: absolute;
                top: 40%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: #ccc;
                font-weight: bold;
                font-size: 30px;
                border-radius: 8px;
                user-select: none;
                -webkit-user-select: none;
                text-decoration: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 8px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.2);
            }
            /* Number text (1/3 etc) */
            .numbertext {
                color: #000;
                font-size: 16px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Six columns side by side */
            .column {
                float: left;
                width: 16.66%;
            }

            /* Add a transparency effect for thumnbail images */
            .demo {
                opacity: 0.6;
            }

            .active,
            .demo:hover {
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <%@ include file="component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="container-img">
                        <div class="mySlides">
                            <div class="numbertext">1 / ${requestScope.lsImage.size() + 1}</div> 
                            <img src="assets/images/products/${product.imgName}" style="width:100%">
                        </div>
                        <c:forEach items="${requestScope.lsImage}" var="image" varStatus="status">
                            <div class="mySlides">
                                <div class="numbertext">${status.count + 1} / ${requestScope.lsImage.size() + 1}</div>
                                <img src="assets/images/products/${image.imgName}" style="width:100%">
                            </div>
                        </c:forEach>

                        <a class="prev" onclick="plusSlides(-1)">❮</a>
                        <a class="next" onclick="plusSlides(1)">❯</a>

                        <div class="row">
                            <div class="column">
                                <img class="demo cursor" src="assets/images/products/${product.imgName}" style="width:100%" onclick="currentSlide(1)">
                            </div>
                            <c:forEach items="${requestScope.lsImage}" var="image" varStatus="status">
                                <div class="column">
                                    <img class="demo cursor" src="assets/images/products/${image.imgName}" style="width:100%" onclick="currentSlide(${status.count + 1})">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <h1 class="mt-5">${requestScope.product.name}</h1>
                    <h3> <fmt:formatNumber type="currency" value="${requestScope.product.price}"/></h3>
                    <p>Số lượng: ${requestScope.product.quantity}</p>

                    <a href="cart?pid=${product.id}" class="btn btn-danger mb-5">Add to cart</a>
                    <p>${requestScope.product.description}</p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script>
                                        var slideIndex = 1;
                                        showSlides(slideIndex);

                                        function plusSlides(n) {
                                            showSlides(slideIndex += n);
                                        }

                                        function currentSlide(n) {
                                            showSlides(slideIndex = n);
                                        }

                                        function showSlides(n) {
                                            var i;
                                            var slides = document.getElementsByClassName("mySlides");
                                            var dots = document.getElementsByClassName("demo");
                                            if (n > slides.length) {
                                                slideIndex = 1;
                                            }
                                            if (n < 1) {
                                                slideIndex = slides.length;
                                            }
                                            for (i = 0; i < slides.length; i++) {
                                                slides[i].style.display = "none";
                                            }
                                            for (i = 0; i < dots.length; i++) {
                                                dots[i].className = dots[i].className.replace(" active", "");
                                            }
                                            slides[slideIndex - 1].style.display = "block";
                                            dots[slideIndex - 1].className += " active";
                                        }
        </script>
    </body>
</html>
