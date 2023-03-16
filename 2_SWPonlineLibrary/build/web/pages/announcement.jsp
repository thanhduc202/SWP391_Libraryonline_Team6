<%-- 
    Document   : announcement
    Created on : Feb 23, 2023, 2:23:39 AM
    Author     : tient
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="gui/header.jsp" %>
        <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
    </head>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper">
                <%@include file="gui/sidebar.jsp" %>
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- basic table  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Announcement</h5>
                                    <div class="card-body">           
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered first">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Title</th>
                                                        <th>Librarian</th>
                                                        <th>Create Date</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listAnn}" var="lista">
                                                        <tr>
                                                            <td>${lista.announcementID}</td>
                                                            <td>${lista.title}</td>
                                                            <td>${lista.librarian.librarianID}</td>
                                                            <td>${lista.publishDate}</td>
                                                            <td class="text-center d-flex justify-content-center">
                                                                <button type="button" class="btn btn-secondary mdi mdi-eye" data-toggle="modal" data-target="#exampleModal${lista.announcementID}">               
                                                                </button>
                                                                <form action="" method="post" onsubmit="if(!confirm('Do you really want to delete?')){return false;}">
                                                                    <input type="text" name="action" value="delete" hidden="">
                                                                    <input type="text"  name="aid" value="${lista.announcementID}" hidden="">
                                                                    <button type="submit" class="btn btn-secondary mdi mdi-delete-outline">
                                                                </form>
                                                                </button>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Title</th>
                                                        <th>Librarian</th>
                                                        <th>Create Date</th>
                                                        <th>ACTIONS</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <button class="btn btn-primary float-right mt-2" data-toggle="modal" data-target="#exampleModalCreate">ADD</button>   
                                        </div>
                                    </div>
                                    <div class="modal fade" id="exampleModalCreate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" style="max-width: 700px" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Announcement</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <form action="announcement" method="post">   
                                                        <div class="row">

                                                            <div class="card">
                                                                <div class="card-body">

                                                                    <input type="text" name="action" value="create" hidden="">

                                                                    <h2 class="card-title">Titel</h2>
                                                                    <input type="text" name="title" value="" required="" class="form-control"><br/>
                                                                    <h2 class="card-title">Notes</h2>

                                                                    <textarea id="editorck" name="note" required=""></textarea><br/>
                                                                    <script>
                                                                        CKEDITOR.replace('editorck');
                                                                    </script>
                                                                    <h2 class="card-title">Should you have any inquiry , please contact us via :</h2>
                                                                    <h5>
                                                                        Phone no:
                                                                        <small class="text-muted">
                                                                            00548658734
                                                                        </small>
                                                                    </h5>
                                                                    <h5>
                                                                        Email:
                                                                        <small class="text-muted">
                                                                            libraryonline@gmail.com
                                                                        </small>
                                                                    </h5>
                                                                    <h5>
                                                                        Fanpage:
                                                                        <small class="text-muted">
                                                                            https://www.facebook.com/libraryonline
                                                                        </small>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <button type="submit" class="btn btn btn-primary">Create</button>
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        </div>    
                                                    </form>

                                                </div>

                                            </div>
                                            <!-- ============================================================== -->
                                        </div>
                                    </div> 
                                    <!-- Modal -->
                                    <c:forEach items="${listAnn}" var="lista">
                                        <div class="modal fade" id="exampleModal${lista.announcementID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" style="max-width: 700px" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Announcement</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <form action="announcement" method="post"> 
                                                            <input type="text" name="aid" value="${lista.announcementID}" hidden="">
                                                            <div class="row">

                                                                <div class="card">
                                                                    <div class="card-body">

                                                                        <input type="text" name="action" value="update" hidden="">

                                                                        <h2 class="card-title">Titel</h2>
                                                                        <input type="text" name="title" value="${lista.title}" required="" class="form-control" ><br/>
                                                                        <h2 class="card-title">Notes</h2>

                                                                        <textarea id="editorck${lista.announcementID}" name="note" required="">${lista.note}</textarea><br/>
                                                                        <script>
                                                                            CKEDITOR.replace('editorck${lista.announcementID}');
                                                                        </script>
                                                                        <h2 class="card-title">Should you have any inquiry , please contact us via :</h2>
                                                                        <h5>
                                                                            Phone no:
                                                                            <small class="text-muted">
                                                                                00548658734
                                                                            </small>
                                                                        </h5>
                                                                        <h5>
                                                                            Email:
                                                                            <small class="text-muted">
                                                                                libraryonline@gmail.com
                                                                            </small>
                                                                        </h5>
                                                                        <h5>
                                                                            Fanpage:
                                                                            <small class="text-muted">
                                                                                https://www.facebook.com/libraryonline
                                                                            </small>
                                                                        </h5>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">

                                                                <button type="submit" class="btn btn btn-primary">Save Change</button>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- ============================================================== -->
                                            </div>
                                        </div>


                                    </c:forEach>


                                    <!-- ============================================================== -->
                                    <!-- content-wrapper ends -->
                                    <!-- partial:partials/_footer.html -->
                                    <!-- partial -->
                                </div>
                                <!-- main-panel ends -->
                            </div>
                        </div>
                        <!-- main-panel ends -->
                    </div>
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page
            <!-- page-body-wrapper ends -->
        </div>
        <%@include file="gui/footer.jsp" %>
    </body>

</html>

