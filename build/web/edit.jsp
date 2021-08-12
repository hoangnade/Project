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
        <title>Edit Products</title>
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
                    <h2 class="mt-5 mb-3">EDIT PRODUCTS</h2>   
                </div>
            </div>

            <!-- modal-->

            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="edit" method="post"> 
                        <div class="modal-body">

                            <div class="mb-3">
                                <label>ID</label>
                                <input type="text" class="form-control" name="id" value="${detail.id}" readonly>
                            </div>

                            <div class="mb-3">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name" value="${detail.name}">
                            </div>
                            <div class="mb-3">
                                <label>Price</label>
                                <input type="text" class="form-control" name="price" value="${detail.price}">
                            </div>
                            <div class="mb-3">
                                <label>Quantity</label>
                                <input type="text" class="form-control" name="quantity" value="${detail.quantity}">
                            </div>
                            <div class="mb-3">
                                <label>Image</label>
                                <input type="text" class="form-control" name="image" value="${detail.imgName}">
                            </div>
                            <div class="mb-3">
                                <label>Description</label>
                                <textarea class="form-control" name="description">${detail.description}</textarea>
                            </div>
                            <div class="mb-3">
                                <label>Note</label>
                                <textarea class="form-control" name="note" >${detail.note}</textarea>
                            </div>
                            <div class="mb-3">
                                <label>Status</label>
                                <input type="text" class="form-control" name="status" value="${detail.status}">
                            </div>
                            <div class="mb-3">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categoryData}" var="cate">
                                        <c:if test="${cate.id == detail.categoryId}">
                                            <option value="${cate.id}" selected>${cate.name}</option>
                                        </c:if>
                                        <c:if test="${cate.id != detail.categoryId}">
                                            <option value="${cate.id}">${cate.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label>Brand</label>
                                <select name="brand" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${brandData}" var="bra">
                                        <c:if test="${bra.id == detail.brandId}">                
                                            <option value="${bra.id}" selected>${bra.name}</option>
                                        </c:if>
                                        <c:if test="${bra.id != detail.brandId}">                
                                            <option value="${bra.id}">${bra.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>                                 
                            <div class="mb-3">
                                <label>Price Group</label>
                                <select name="priceGroup" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${priceData}" var="pdata">
                                        <c:if test="${pdata.id == detail.priceId}">
                                            <option value="${pdata.id}" selected>${pdata.name}</option>
                                        </c:if>
                                        <c:if test="${pdata.id != detail.priceId}">
                                            <option value="${pdata.id}">${pdata.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>                                 

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row" style="margin-left:500px">
                <div  class="col-md-6 text-end">
                    <a class="btn btn-info" href="products">Back to home</a>
                </div>
            </div>
    </body>

</html>


