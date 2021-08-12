<%-- 
    Document   : userprofile
    Created on : Mar 16, 2021, 1:09:27 AM
    Author     : manch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Personal profile</title>


        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    </head>
    <style>
        .table>thead>tr>th {
            vertical-align: bottom;
            border-bottom: 2px solid #d0d0d0;
            color: #555 !important;
            font-weight: 500;
        }

        .table>thead:first-child>tr:first-child>th {
            border-top: 0;
        }

        .table>tbody>tr>td,
        .table>tbody>tr>th,
        .table>tfoot>tr>td,
        .table>tfoot>tr>th,
        .table>thead>tr>th {
            padding: 9px 12px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #d0d0d0;
            color: #555;
        }

        .table>thead>tr>th:hover {
            cursor: pointer;
        }

        .table>thead>tr>th:focus {
            outline-color: #d0d0d0;
        }

        .table>thead>tr>th .size {
            font-size: 17px;
            padding-top: 2px;
        }


        /* Tables - Border */

        .table-bordered {
            border: 1px solid #d0d0d0;
        }

        .table-bordered>tbody>tr>td,
        .table-bordered>tbody>tr>th,
        .table-bordered>tfoot>tr>td,
        .table-bordered>tfoot>tr>th,
        .table-bordered>thead>tr>td,
        .table-bordered>thead>tr>th {
            border: 1px solid #d0d0d0;
        }

        .table-bordered>thead>tr>td,
        .table-bordered>thead>tr>th {
            border-bottom-width: 2px;
        }


        /* Customer - Datables */

        .dataTables_length {
            float: left;
        }

        #history_filter {
            float: right;
        }

        #orders_filter {
            float: right;
        }

        label {
            display: inline-block;
            max-width: 100%;
            margin-bottom: 15px;
            font-weight: 400;
            color: #555;
        }

        .dataTables_info {
            color: #555;
            float: left;
        }


        /* Customer - Select */

        label select {
            margin: 0 5px;
            border: 1px solid #d0d0d0;
            color: #555;
            background-color: transparent;
            padding: 4px;
        }

        label select:focus {
            outline-color: #d0d0d0;
        }

        label select option {
            background-color: #ffffff;
        }


        /* Customer - Search */

        label input {
            margin-left: 10px;
            border: 1px solid #d0d0d0;
            color: #555;
            background-color: transparent;
            padding: 4px 5px 4px 8px;
            font-weight: normal;
            width: 200px;
        }

        label input:focus {
            outline-color: #d0d0d0;
        }


        /* Customer - Pagination */

        .dataTables_paginate {
            float: right;
        }

        .paging_simple_numbers>a {
            color: #555;
            width: 80px;
            height: 32px;
            padding: 5px;
            border: 1px solid #d0d0d0;
            display: inline-block;
            text-align: center;
        }

        .paging_simple_numbers>a:first-child {
            border-right: none;
        }

        .paging_simple_numbers>span>a {
            color: #555;
            border: 1px solid #d0d0d0;
            width: 32px;
            height: 32px;
            padding: 5px;
            display: inline-block;
            text-align: center;
            border-right: none;
        }

        .paging_simple_numbers a:hover {
            text-decoration: none;
            cursor: pointer;
            color: #ed1d27;
        }

        .ellipsis {
            color: #fff;
            width: 32px;
            height: 32px;
            padding: 5px;
            display: inline-block;
            border: 1px solid #d0d0d0;
            text-align: center;
            border-right: none;
        }


        /* Customer - Responsivve */

        @media(max-width: 500px) {
            #example_filter {
                float: none;
            }
            label select {
                margin: 0 5px 0 20px;
            }
            .dataTables_paginate {
                float: left;
                margin-top: 10px;
            }
            .paging_simple_numbers>a {
                width: 65px;
            }
            .paging_simple_numbers>span>a {
                width: 28px;
            }
        }


        /* TABLE */

        .result-detail table {
            font-size: 14px;
        }

        .result-detail table h5 {
            margin: 0;
            font-size: 17px;
        }

        .result-detail .giai {
            color: #fff !important;
            background-color: #ed1d27;
            border: 1px solid #ed1d27;
            width: 25%;
        }

        .result-detail .g-color {
            color: #ed1d27 !important;
            background-color: #e6e6e6;
            border: none;
        }

        .result-detail table,
        .result-detail th,
        .result-detail td {
            border: 1px solid #e6e6e6;
            border-collapse: collapse;
        }

        .result-detail table th {
            padding: 8px 12px;
            text-align: center;
        }

        .result-detail table td {
            padding: 27px 12px;
            font-weight: bold;
        }

        .result-detail table td span {
            color: #ed1d27 !important;
        }

        /*======== Custom =========*/
        .m-info {
            border: 1px dashed #ccc;
            padding: 8px 15px 12px;
            border-radius: .25rem;
        }

        .m-info .table {
            margin-bottom: 0;
        }

        td {
            padding: 4px 10px 4px 0;
        }

        .active {
            color: #28a745;
        }

        .deactive {
            color: #dc3545;
        }

        .card {
            border: 1px dashed #ccc;
        }

        .card-body {
            padding: 1rem 0;
        }

        .g-color {
            color: #ed1d27;
        }

        .g-color:hover {
            color: #ed1d27;
        }

        .products-info {
            padding: 0 1rem;
            border: 1px dashed #ccc;
            border-radius: .25rem;
        }

        .address-info {
            padding: .55rem 1rem;
            border: 1px dashed #ccc;
            border-radius: .25rem;
        }

        .br {
            border-radius: 1rem;
        }

        .table .btn {
            padding: .4rem;
        }
    </style>
    <body>
        <%@include  file="component/user-nav.jsp"%>
        <div id="main-contain" class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-3">
                    <div class="left-side">
                        <div class="row title">
                            <div class="col-md-12">
                                <h6>List management</h6>
                            </div>
                        </div>
                        <%@include  file="component/user-sidebar.jsp"%>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="right-side">
                        <div class="row title">
                            <div class="col-md-12">
                                <h6>
                                    Account Information
                                </h6>
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-md-12">
                                <div class="m-info">
                                    <table>
                                        <tr>
                                            <td>Username:</td>
                                            <td><b>${sessionScope.acc.username}</b></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td>

                                                <a style="text-decoration: none" data-bs-toggle="collapse" href="#changePassword" role="button" aria-expanded="false" aria-controls="CollapseExample">
                                                    Change password
                                                </a>                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Role account:</td>
                                            <td>

                                                ${sessionScope.acc.isAdmin == 1 ? "Admin" : "Customer"}

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td>
                                                <c:if test="${sessionScope.acc.status == 1}">
                                                    <span class="active">Đang hoạt động</span>
                                                </c:if>
                                                <c:if test="${sessionScope.acc.status != 1}">
                                                    <span class="deactive">Ngừng hoạt động</span>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <p class="text-danger" >${mess}</p>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <div class="collapse mb-2" id="changePassword">
                                    <div class="card card-body">

                                        <form action="changepassword" method="post">
                                            <div class="form-group col-md-6" style="margin-bottom: 10px; margin-left: 10px">
                                                <input type="password" class="form-control" name="password" placeholder="Password">
                                            </div>
                                            <div class="form-group col-md-6" style="margin-bottom: 10px; margin-left: 10px">
                                                <input type="password" class="form-control" name="newpassword" placeholder="New Password">
                                            </div>
                                            <div class="form-group col-md-6" style="margin-bottom: 10px; margin-left: 10px">
                                                <input type="password" class="form-control" name="renewpassword" placeholder="Renew Password">
                                            </div>
                                            <input style="margin-bottom: 10px; margin-left: 10px" type="submit" class="btn btn-success btn-sm ml-3 mr-5" name="btnChangePassword" value="Change password">                                           
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row title">
                            <div class="col-md-12">
                                <h6>
                                    Private Information
                                </h6>
                            </div>
                        </div> 
                        <div class="row mt-1">
                            <div class="col-md-12">
                                <div class="m-info">
                                    <table>
                                        <tr>
                                            <td>Full name:</td>

                                            <td><b>${sessionScope.accountDetailInfo.name}</b></td>
                                        </tr>
                                        <tr>
                                            <td>Phone Number:</td>
                                            <td>${sessionScope.accountDetailInfo.phonenumber}</td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td>${sessionScope.accountDetailInfo.address}</td>
                                        </tr>
                                    </table>
                                    <br/>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Change Information</button>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Private Information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="change-infor" method="post">
                                        <div class="modal-body">

                                            <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label">Fullname</label>
                                                <input type="text" class="form-control" id="recipient-name" name="name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label">Phone number</label>
                                                <input type="text" class="form-control" id="recipient-name" name="phonenumber">
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Address</label>
                                                <textarea class="form-control" id="message-text" name="address"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <p class="text-danger">${mess}</p>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            </body>
                            </html>