<%-- 
    Document   : checkout
    Created on : Mar 9, 2021, 9:03:59 PM
    Author     : manch
--%>
<%-- 
    Document   : cart
    Created on : Mar 2, 2021, 8:20:11 PM
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
    </head>
    <style>
        a{
            display: block;
            text-decoration: none;
            text-transform: uppercase;
            font-weight: 500;
        }
    </style>
    <body>
        <%@include  file="component/navbar.jsp"%>
     
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h3 class="mt-5 mb-3">Product(s) Information</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Số tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.listCart}" var="cart">
                                <tr>
                                    <td>
                                        <img src="assets/images/products/${cart.imgName}" width="100px">
                                    </td>
                                    <td>
                                        ${cart.name}
                                    </td>
                                    <td>
                                        ${cart.price}
                                    </td>
                                    <td>
                                        ${cart.quantity}
                                    </td>
                                    <td>
                                        <fmt:formatNumber type="currency" currencySymbol="đ" value="${cart.price * cart.quantity}" /> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="text-end">
                        Total: <fmt:formatNumber type="currency" currencySymbol="đ" value="${sessionScope.totalMoney}" /> 
                    </div>
                    <div>
                        <a class="btn btn-danger w-100 mt-4 btn-lg" href="remove-cart?id=0">Cancel product(s)</a>
                    </div>
                </div>

                <div class="col-md-5 ps-5">
                    <h3 class="mt-5 mb-4">Buyer(s) Information</h3>
                    <form action="check-out" method="post">
                        <div class="mb-2">
                            <label for="name" class="form-label">Full name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${sessionScope.accountDetailInfo.name}">
                        </div>
                        <div class="mb-2">
                            <label for="mobile" class="form-label">Phone number</label>
                            <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${sessionScope.accountDetailInfo.phonenumber}">
                        </div>
                        <div class="mb-2">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="2">${sessionScope.accountDetailInfo.address}</textarea>
                        </div>
                        <div class="mb-2">
                            <label for="note" class="form-label">Note</label>
                            <textarea class="form-control" id="note" name="note" rows="2"></textarea>
                        </div>
                        <button type="submit" class="btn btn-success w-100 mt-2 btn-lg">CONFIRM</button>
                    </form>
                </div>

            </div>
        </div>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
