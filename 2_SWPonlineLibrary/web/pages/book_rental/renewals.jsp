<%-- 
    Document   : renewals
    Created on : Feb 22, 2023, 11:31:39 PM
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
                                    <h5 class="card-header">Renewals</h5>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered first">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>BORROWER</th>
                                                        <th>ORDER DATE</th>
                                                        <th>STATUS</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listRenewal}" var="listr">
                                                        <tr>
                                                            <td>${listr.renewalID}</td>
                                                            <td>${listr.order.student.account.fullName}</td>

                                                            <td>${listr.order.orderDate}</td>

                                                            <td class="font-weight-medium">
                                                                <div class=" text-white badge ${listr.status.statusName == 'Pending'?'badge-warning':''}${listr.status.statusName == 'Approved'?'badge-success':''}${listr.status.statusName == 'Closed'?'badge-danger':''}">
                                                                    ${listr.status.statusName}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button class="mdi mdi-eye" data-toggle="modal" data-target="#exampleModal${listr.renewalID}">               
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
                            <!-- ============================================================== -->
                            <!-- end basic table  -->
                            <!-- ============================================================== -->
                            <!-- Modal -->
                            <c:forEach items="${listRenewal}" var="listr">
                                <div class="modal fade" id="exampleModal${listr.renewalID}">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Renewal Request Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Member ID</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" disabled="" value="${listr.order.student.sid}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Member Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" disabled="" value="${listr.order.student.account.fullName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Staff ID</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" disabled="" value="${listr.librarian.librarianID}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Staff Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" disabled="" value="${listr.librarian.account.fullName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Scheduled</label>
                                                            <div class="col-sm-9">
                                                                <input type="date" class="form-control" disabled="" value="${listr.order.scheduledTime}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Extend Date</label>
                                                            <div class="col-sm-9">
                                                                <input type="date" class="form-control" disabled="" value="${listr.extendDate}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-1 col-form-label">Reason</label>
                                                            <div class="col-sm-11">
                                                                <input type="text" class="form-control" disabled="" value="${listr.reason}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <form action="book_rental" method="post">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Renewal Status</label>
                                                                <div class="col-sm-9">
                                                                    <form action="book_rental" method="post">
                                                                        <input type="text" name="action" hidden="" value="renewal">
                                                                        <input type="text" name="rid" hidden="" value="${listr.renewalID}">
                                                                        <select class="form-control" name="sid" onchange="this.form.submit()" style="color: white; background-color: ${listr.status.statusName == 'Pending'?'#FFC100':''}${listr.status.statusName == 'Approved'?'green':''}${listr.status.statusName == 'Closed'?'red':''}">
                                                                            <option style="color: white; background-color: #FFC100" value="1" ${listr.status.statusId == 1?'selected':''}>Pending</option>
                                                                            <option style="color: white; background-color: green" value="2" ${listr.status.statusId == 2?'selected':''}>Approved</option>
                                                                            <option style="color: white; background-color: red" value="3" ${listr.status.statusId == 3?'selected':''}>Closed</option>
                                                                        </select>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="modal-footer">     
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ============================================================== -->
                                </div>

                            </c:forEach>
                        </div>
                    </div> 


                    <!-- ============================================================== -->
                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <%@include file="../gui/footer.jsp" %>

        <!-- endinject -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->
    </body>

</html>

