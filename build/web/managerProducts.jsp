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
        <title>Manage Products</title>
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
                    <h2 class="mt-5 mb-3">MANAGE PRODUCT(S)</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listSellId}" var="list">
                                <tr>
                                    <td>
                                        ${list.id}
                                    </td>
                                    <td>
                                        <img src="assets/images/products/${list.imgName}" width="100px">
                                    </td>
                                    <td>
                                        ${list.name}
                                    </td>
                                    <td>
                                        ${list.quantity}
                                    </td>
                                    <td>
                                        <fmt:formatNumber type="currency" currencySymbol="đ" value="${list.price}"/> 
                                    </td>
                                    <td>
                                        <a href="delete?pid=${list.id}">Delete</a>
                                        <a href="edit-product?pid=${list.id}" style="margin-left: 10px">Edit</a>                                      
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
                <div class="col-md-6 text-end">
                    <button type="button" class="btn btn-primary" style="background-color: green"data-bs-toggle="modal" data-bs-target="#exampleModal">ADD NEW PRODUCTS</button>
                </div>
            </div>
            <!-- modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add" method="post"> 
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                               
                                    <div class="mb-3">
                                        <label>Name</label>
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                    <div class="mb-3">
                                        <label>Price</label>
                                        <input type="text" class="form-control" name="price">
                                    </div>
                                    <div class="mb-3">
                                        <label>Quantity</label>
                                        <input type="text" class="form-control" name="quantity">
                                    </div>
                                    <div class="mb-3">
                                        <label>Image</label>
                                        <input type="text" class="form-control" name="image">
                                    </div>
                                    <div class="mb-3">
                                        <label>Description</label>
                                        <textarea class="form-control" name="description"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label>Note</label>
                                        <textarea class="form-control" name="note"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label>Status</label>
                                        <input type="text" class="form-control" name="status">
                                    </div>
                                    <div class="mb-3">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${categoryData}" var="cate">
                                                <option value="${cate.id}">${cate.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label>Brand</label>
                                        <select name="brand" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${brandData}" var="bra">
                                                <option value="${bra.id}">${bra.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                 
                                    <div class="mb-3">
                                        <label>Price Group</label>
                                        <select name="priceGroup" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${priceData}" var="pdata">
                                                <option value="${pdata.id}">${pdata.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                 
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>

</html>


