<%-- 
    Document   : cart
    Created on : Mar 2, 2021, 8:20:11 PM
    Author     : manch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <h4 class="mt-5 mb-3">DETAIL ACCOUNT</h4>   
                </div>
            </div>

            <!-- modal-->

            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="edit" method="post"> 
                        <div class="modal-body">

                            <div class="mb-3">
                                <label>ID</label>
                                <input type="text" class="form-control" name="id" value="${accDetail.id}" readonly>
                            </div>

                            <div class="mb-3">
                                <label>FullName</label>
                                <input type="text" class="form-control" name="name" value="${accDetail.name}" readonly>
                            </div>
                            <div class="mb-3">
                                <label>PhoneNumber</label>
                                <input type="text" class="form-control" name="phonenumber" value="${accDetail.phonenumber}" readonly> 
                            </div>
                            <div class="mb-3">
                                <label>Address</label>
                                <textarea class="form-control" name="description" readonly>${accDetail.address}</textarea>
                            </div>
                        </div>                                 
                </div>
            </div>
        </div>
        <div class="row" style="margin-left:510px">
            <div  class="col-md-5">
                <a class="btn btn-info" href="load-account">Previous</a>
            </div>
        </div>

    </body>
</html>
