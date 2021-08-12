<%-- 
    Document   : managerProducts.jsp
    Created on : Mar 14, 2021, 1:30:07 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        <title>Manage Accounts</title>
        <style>
            a{
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 500;
            }

        </style>
    </head>
    <body>
        <%@include  file="component/navbar.jsp"%>

        <div class="container" style="margin-bottom: 50px">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="mt-5 mb-3">MANAGE ACCOUNT(S)</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Staus</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${accounts}" var="acc">
                                <tr>
                                    <td>
                                        ${acc.userID}
                                    </td>
                                    <td>
                                        ${acc.username}
                                    </td>
                                    <td>
                                        ${acc.password}
                                    </td>
                                    <td>
                                        ${acc.isAdmin == 1 ? "Admin" : "Customer"}
                                    </td>
                                    <td>
                                        <c:if test="${acc.status== 1}">
                                            <span class="active" style="color: green">Active</span>
                                        </c:if>
                                        <c:if test="${acc.status!= 1}">
                                            <span class="deactive" style="color: red">Inactive</span>
                                        </c:if>
                                    </td>

                                    <td>
                                        <a href="delete-account?aid=${acc.userID}">Delete</a>
                                        <a style="margin-left: 10px" href="load-detail?did=${acc.accontdetailID}">View</a>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div  class="col-md-6">
                    <a class="btn btn-info" href="products">Back to home</a>
                </div>
            </div>
        </div>
    </body>
</html>



