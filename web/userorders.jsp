<%-- 
    Document   : cart
    Created on : Mar 2, 2021, 8:20:11 PM
    Author     : manch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    <h3 class="mt-5 mb-3">Menu Order(s)</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Note</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listOrder}" var="i">
                                <tr>
                                    <td>
                                        ${i.id}
                                    </td>
                                    <td>
                                        ${i.name}
                                    </td>
                                    <td>
                            <fmt:formatNumber type="currency" currencySymbol="đ" value="${i.total}" /> 
                            </td>
                            <td>
                                ${i.note == null ? "##" : i.note}
                            </td>
                            <td>
                                <a href="show-detail?id=${i.id}" style="text-decoration: none">Detail</a>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>  
        </div>
    </body>
</html>
