<%-- 
    Document   : navbar
    Created on : Jan 14, 2021, 9:02:05 PM
    Author     : manch
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    .navbar .navbar-brand {
        padding-top: 0px;
    }
    .navbar .navbar-brand img {
        height: 50px;
    }
    .nav-item dropdown {
        float: left;
        overflow: hidden;
    }

</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="products">NadePan Shop
            <img src="assets/images/products/logo.jpg">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="product-last">NEWEST</a>
                </li>

                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="load-account">Manage Account</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Manage Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            HELLO ${sessionScope.acc.username}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="account-detail">Account information</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </li>                  
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">REGISTER</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">LOGIN</a>
                    </li>
                </c:if>

            </ul>
            <form class="d-flex" action="search" method="get">
                <input class="form-control me-2" type="search" placeholder="Type here to search" aria-label="Search" name="input-text">
                <button class="btn btn-outline-success" type="submit" style="margin-right:10px">Search</button>
            </form>
            <form action="cart.jsp" method="post" style="margin-left: 20px"> 
                <button type="submit" class="btn btn-primary">

                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"></path>
                    </svg>
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light"> ${sessionScope.totalProduct}</span>                
                </button>
            </form>
        </div>
    </div>
</nav>
