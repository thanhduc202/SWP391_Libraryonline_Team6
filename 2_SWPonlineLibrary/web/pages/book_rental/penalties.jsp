<%-- 
    Document   : penalties
    Created on : Feb 22, 2023, 11:31:08 PM
    Author     : tient
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="../gui/header.jsp" %>
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:../../partials/_navbar.html -->
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <%@include file="../gui/sidebar.jsp" %>

                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- basic table  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Penalties</h5>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered first">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>ORDER ID</th>                                            
                                                        <th>BORROWER</th>
                                                        <th>STATUS</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listPen}" var="listp">
                                                        <tr>
                                                            <td>${listp.penaltyID}</td>
                                                            <td>${listp.student.account.fullName}</td>

                                                            <td>${listp.penaltyID}</td>

                                                            <td class="font-weight-medium">
                                                                <div class="badge badge-success" style="${listp.status.statusId == 7?'background-color: red; color: white':'background-color: green; color: white'}">
                                                                ${listp.status.statusId == 7?'Unpaid':'Paid'}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button class="mdi mdi mdi-eye" data-toggle="modal" data-target="#exampleModal${listp.penaltyID}">               
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>BOOK</th>                                            
                                                        <th>BORROWER</th>
                                                        <th>STATUS</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end basic table  -->
                            <!-- ============================================================== -->
                            <!-- Modal -->

                            <c:forEach items="${listPen}" var="listp">
                                <div class="modal fade" id="exampleModal${listp.penaltyID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog " role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Penalties</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Order ID</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" disabled="" value="${listp.order.orderID}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Member ID</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" value="${listp.student.sid}" disabled=""/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Member Name</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" value="${listp.student.account.fullName}" disabled=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Return Deadline</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" value="${listp.order.scheduledTime}" disabled=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Penalty Amount</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" disabled="" value="${listp.getTotalAmount()}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4 col-form-label">Penalty Status</label>
                                                            <div class="col-sm-11">
                                                                <form action="book_rental" method="post">
                                                                    <input type="text" name="action" hidden="" value="penalty">
                                                                    <input type="text" name="pid" hidden="" value="${listp.penaltyID}">
                                                                    <select style="${listp.status.statusId == 7?'background-color: red; color: white':'background-color: green; color: white'}" class=" form-control" name="sid" onchange="this.form.submit()">
                                                                        <option style="background-color: red" value="7" ${listp.status.statusId == 7?'selected':''}>Unpaid</option>
                                                                        <option style="background-color: green"value="6" ${listp.status.statusId == 6?'selected':''}>Paid</option>
                                                                    </select>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                </tbody>

                                            </div>
                                            <div class="modal-footer">     

                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div> 
                </div> 


            <!-- ============================================================== -->
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <%@include file="../gui/footer.jsp" %>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>

</body>

</html>

