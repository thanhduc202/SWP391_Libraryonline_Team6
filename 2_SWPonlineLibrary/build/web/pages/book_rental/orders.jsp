<%-- 
    Document   : orders
    Created on : Feb 22, 2023, 11:30:49 PM
    Author     : tient
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html lang="en">

    <head>
        <style>
            .badge-warning {
                background-color: yellow;
            }
        </style>
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <%@include file="../gui/header.jsp" %>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">

                <%@include file="../gui/sidebar.jsp" %>
                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">

                            <!-- ============================================================== -->
                            <!-- basic table  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Orders</h5>
                                    <div class="card-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-5 mr-2 ml-2 p-0">
                                                    <h6 style="opacity: 0.6;">Method</h6>
                                                </div>
                                                <div class="col-md-5 ml-2 p-0">
                                                    <h6 style="opacity: 0.6;">Status</h6>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 mr-2 ml-2 p-0" style="border: 2px solid rgb(88, 88, 92);">
                                                    <c:forEach items="${listMethod}" var="listm">
                                                        <div class="d-flex">
                                                            <li style="display: block;">${listm.methodName}</li>
                                                            <li class="ml-auto" style="display: block;"><span class="badge badge-secondary ">${listm.count}</span>
                                                            </li>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <style>
                                                    .a {
                                                        height: 110px;
                                                        overflow: scroll;
                                                    }
                                                </style>
                                                <div class="col-md-5 ml-2 p-0" style="border: 2px solid rgb(88, 88, 92);">

                                                    <div class="a">
                                                        <c:forEach items="${listStatus}" var="lists">
                                                            <div class="d-flex">
                                                                <li style="display: block;">${lists.statusName}</li>
                                                                <li class="ml-auto" style="display: block;"><span
                                                                        class="badge badge-secondary ">${lists.count}</span>
                                                                </li>
                                                            </div>
                                                        </c:forEach>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <br>                    
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered first">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>METHOD</th>
                                                        <th>ORDERED ON</th>
                                                        <th>BORROWER</th>
                                                        <th>SCHEDULED TIME</th>
                                                        <th>STATUS</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listOrder}" var="listo">
                                                        <tr>
                                                            <td>${listo.orderID}</td>
                                                            <td>${listo.method.methodName}</td>
                                                            <td>${listo.orderDate}</td>
                                                            <td>${listo.student.account.fullName}</td>
                                                            <td>${listo.scheduledTime}</td>
                                                            <td class="font-weight-medium">
                                                                <div class=" text-white badge ${listo.status.statusName == 'Pending'?'badge-warning':''}${listo.status.statusName == 'Approved' || listo.status.statusName == 'Received' || listo.status.statusName == 'Overdue'?'badge-success':''}${listo.status.statusName == 'Closed'?'badge-danger':''}">
                                                                    ${listo.status.statusId == 4 || listo.status.statusId == 5?'Approved':listo.status.statusName}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button type="button" class="icon-grid menu-icon mdi mdi mdi-eye" data-toggle="modal" data-target="#exampleModal${listo.orderID}">               
                                                                </button>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>METHOD</th>
                                                        <th>ORDERED ON</th>
                                                        <th>BORROWER</th>
                                                        <th>SCHEDULED TIME</th>
                                                        <th>STATUS</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end basic table  -->
                                <!-- ============================================================== -->
                                <!-- Modal -->
                                <c:forEach items="${listOrder}" var="listo">
                                    <div class="modal fade" id="exampleModal${listo.orderID}">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Order Details</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Order ID</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.orderID}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label">Order Date</label>
                                                                <div class="col-sm-9">
                                                                    <input class="form-control" disabled="" value="${listo.orderDate}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Member ID</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.student.sid}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label">Member Name</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.student.account.fullName}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Staff ID</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.librarian.librarianID}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label">Staff Name</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.librarian.account.fullName}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group row">
                                                                <label class="col-sm-1 col-form-label">Scheduled</label>
                                                                <div class="col-sm-11">
                                                                    <input type="text" class="form-control" disabled="" value="${listo.scheduledTime}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Order Status</label>
                                                                <div class="col-sm-9">
                                                                    <form action="book_rental" method="post">
                                                                        <input type="text" name="action" hidden="" value="order">
                                                                        <input type="text" name="oid" hidden="" value="${listo.orderID}">
                                                                        <select class="form-control" name="sid" onchange="this.form.submit()" style="color: white; background-color: ${listo.status.statusName == 'Pending'?'#FFC100':''}${listo.status.statusName == 'Approved' || listo.status.statusName == 'Received' || listo.status.statusName == 'Overdue'?'green':''}${listo.status.statusName == 'Closed'?'red':''}">
                                                                            <option style="color: white; background-color: #FFC100" value="1" ${listo.status.statusId == 1?'selected':''}>Pending</option>
                                                                            <option style="color: white; background-color: green" value="2" ${listo.status.statusId == 2?'selected':''}>Approved</option>
                                                                            <option style="color: white; background-color: red" value="3" ${listo.status.statusId == 3 || listo.status.statusId == 4 || listo.status.statusId == 5?'selected':''}>Closed</option>
                                                                        </select>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Item ID</th>
                                                                    <th>Book Title</th>           
                                                                    <th>Status</th>
                                                                    <th>Deadline</th>
                                                                    <th>Received on</th>
                                                                    <th>Return on</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <c:forEach items="${listo.listOrderDetail}" var="listod">
                                                                    <tr>
                                                                        <td>${listod.book.bookID}</td>
                                                                        <td>${listod.book.bname}</td>
                                                                        <td><label class="badge badge ${
                                                                                    listo.status.statusName == 'Pending'?'badge-warning':''
                                                                                }${listo.status.statusName == 'Approved' || listo.status.statusName == 'Received' || listo.status.statusName == 'Overdue'?'badge-success':''}${listo.status.statusName == 'Closed'?'badge-danger':''}">
                                                                                ${listo.status.statusName}</label></td>
                                                                        <td>${listo.scheduledTime}</td>
                                                                        <td>${listod.receivedOn}</td>
                                                                        <td>${listod.returnOn}</td>
                                                                    </tr>

                                                                </c:forEach>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">     
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>


                        <!-- ============================================================== -->
                        <!-- content-wrapper ends -->
                        <!-- partial:partials/_footer.html -->
                        <%@include file="../gui/footer.jsp" %>
                        <!-- partial -->
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>

    </body>

</html>

