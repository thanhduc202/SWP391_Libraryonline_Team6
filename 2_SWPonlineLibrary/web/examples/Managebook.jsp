<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Managebook
    Created on : Mar 8, 2023, 10:28:25 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>
            Library - Manage Book
        </title>
        <!-- Favicon -->
        <link href="assets/img/brand/favicon.png" rel="icon" type="image/png">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <!-- Icons -->
        <link href="assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
        <link href="assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link href="assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
    </head>
    <body class="">
        <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
            <div class="container-fluid">
                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Brand -->
                <a class="navbar-brand pt-0" href="dashboard">
                    <img src="assets/img/brand/Logo_Đại_học_FPT.png" class="navbar-brand-img" alt="...">
                </a>
                <!-- User -->
                <ul class="nav align-items-center d-md-none">
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ni ni-bell-55"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="media align-items-center">
                                <span class="avatar avatar-sm rounded-circle">
                                    <img alt="Image placeholder" src="assets/img/theme/team-1-800x800.jpg
                                         ">
                                </span>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                            <div class=" dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome!</h6>
                            </div>
                            <a href="profile" class="dropdown-item">
                                <i class="ni ni-single-02"></i>
                                <span>My profile</span>
                            </a>
                            <a href="" class="dropdown-item">
                                <i class="ni ni-settings-gear-65"></i>
                                <span>Settings</span>
                            </a>
                            <a href="" class="dropdown-item">
                                <i class="ni ni-calendar-grid-58"></i>
                                <span>Activity</span>
                            </a>
                            <a href="" class="dropdown-item">
                                <i class="ni ni-support-16"></i>
                                <span>Support</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="logout" class="dropdown-item">
                                <i class="ni ni-user-run"></i>
                                <span>Logout</span>
                            </a>
                        </div>
                    </li>
                </ul>
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                    <!-- Collapse header -->
                    <div class="navbar-collapse-header d-md-none">
                        <div class="row">
                            <div class="col-6 collapse-brand">
                                <a href="index.html">
                                    <img src="assets/img/brand/blue.png">
                                </a>
                            </div>
                            <div class="col-6 collapse-close">
                                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                                    <span></span>
                                    <span></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- Form -->
                    <form class="mt-4 mb-3 d-md-none">
                        <div class="input-group input-group-rounded input-group-merge">
                            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span class="fa fa-search"></span>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- Navigation -->
                    <ul class="navbar-nav">
                        <li class="nav-item  active ">
                            <a class="nav-link  active " href="dashboard">
                                <i class="ni ni-tv-2 text-primary"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="historyborrowbook">
                                <i class="ni ni-planet text-blue"></i> View history borrow book
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="feedback">
                                <i class="ni ni-pin-3 text-orange"></i> View Feedback
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="profile">
                                <i class="ni ni-single-02 text-yellow"></i> User profile
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="ManageUser">
                                <i class="ni ni-bullet-list-67 text-red"></i> Manage User
                            </a>
                        </li>
                        <c:if test="${sessionScope.account != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Adminlogout">
                                    <i class="ni ni-key-25 text-info"></i> Logout
                                </a>
                            </li>
                        </c:if>

                        <li class="nav-item">
                            <a class="nav-link" href="Managebook">
                                <i class="ni ni-circle-08 text-pink"></i> Manage Book
                            </a>
                        </li>
                    </ul>
                    <!-- Divider -->
                    <hr class="my-3">

                </div>
            </div>
        </nav>
        <div class="main-content">
            <!-- Navbar -->
            <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
                <div class="container-fluid">
                    <!-- Brand -->
                    <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="ManageUser">MANAGE BOOK</a>
                    <!-- Form -->

                    <!-- User -->
                    <ul class="navbar-nav align-items-center d-none d-md-flex">
                        <li class="nav-item dropdown">
                            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="media align-items-center">
                                    <span class="avatar avatar-sm rounded-circle">
                                        <img alt="Image placeholder" src="assets/img/theme/team-4-800x800.jpg">
                                    </span>
                                    <div class="media-body ml-2 d-none d-lg-block">
                                        <span class="mb-0 text-sm  font-weight-bold">${sessionScope.account.fullname}</span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                                <div class=" dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">Welcome!</h6>
                                </div>
                                <a href="profile" class="dropdown-item">
                                    <i class="ni ni-single-02"></i>
                                    <span>My profile</span>
                                </a>
                                <a href="" class="dropdown-item">
                                    <i class="ni ni-settings-gear-65"></i>
                                    <span>Settings</span>
                                </a>
                                <a href="" class="dropdown-item">
                                    <i class="ni ni-calendar-grid-58"></i>
                                    <span>Activity</span>
                                </a>
                                <a href="" class="dropdown-item">
                                    <i class="ni ni-support-16"></i>
                                    <span>Support</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="Adminlogout" class="dropdown-item">
                                    <i class="ni ni-user-run"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- End Navbar -->
            <!-- Header -->
            <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
                <div class="container-fluid">
                    <div class="header-body">
                        <!-- Card stats -->
                        <div class="row">
                            <c:forEach var="s" items="${ListS}">
                            
                            <div class="col-xl-3 col-lg-6">
                                <div class="card card-stats mb-4 mb-xl-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">QUANTITY STUDENT</h5>
                                                <span class="h2 font-weight-bold mb-0">${s.quantity} STUDENT</span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                                                    <i class="fas fa-chart-bar"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
</c:forEach>

                            <c:forEach var="n" items="${ListB}">
                            
                            <div class="col-xl-3 col-lg-6">
                                <div class="card card-stats mb-4 mb-xl-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">QUANTITY BOOK</h5>
                                                <span class="h2 font-weight-bold mb-0">${n.quantity} BOOK</span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                                                    <i class="ni ni-books"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
</c:forEach>

                            <c:forEach var="o" items="${ListO}">
                           
                            <div class="col-xl-3 col-lg-6">
                                <div class="card card-stats mb-4 mb-xl-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">QUANTITY ORDER BOOK</h5>
                                                <span class="h2 font-weight-bold mb-0">${o.quantity} User Order</span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                                                    <i class="ni ni-cart"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
 </c:forEach>

                            <c:forEach var="f" items="${ListF}">
                            
                            <div class="col-xl-3 col-lg-6">
                                <div class="card card-stats mb-4 mb-xl-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">QUANTITY FEEDBACK</h5>
                                                <span class="h2 font-weight-bold mb-0">${f.quantity} User Feedback</span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                                    <i class="ni ni-chat-round"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt--7">
                <!-- Table -->
                <div class="row">
                    <div class="col">
                        <div class="card shadow">
                            <div class="card-header border-0">
                                <h3 class="mb-0">INFORMATION ALL BOOK</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table align-items-center table-flush">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Book Name</th>
                                            <th scope="col">Author</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Edit</th>
                                            <th scope="col">Delete</th>
                                            <th scope="col">
                                                <div>
                                                    <a href="addbook"class="ni ni-fat-add">ADD</a>          
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="b" items="${ListB1}">

                                            <tr>
                                                <th scope="row">
                                                    <div class="media align-items-center">

                                                        <div class="media-body">
                                                            <span class="mb-0 text-sm">${b.bname}</span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td>
                                                    ${b.author}
                                                </td>
                                                <td>
                                                    <span class="badge badge-dot mr-4">
                                                        <c:if test="${b.status==0}">
                                                            <i class="bg-warning"></i>
                                                            Close
                                                        </c:if>
                                                        <c:if test="${b.status==1}">
                                                            <i class="bg-success"></i>
                                                            Open
                                                        </c:if>

                                                    </span>
                                                </td>
                                                <td>
                                                    <div class="avatar-group">
                                                        <button type="button" title="Copy to clipboard">

                                                            <div>
                                                                <a href="LoadBook?Bid=${b.bid}"><i class="ni ni-scissors"></i></a>
                                                            </div>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <span class="mr-2"></span>
                                                        <div>
                                                            <button type="button"  title="Copy to clipboard">
                                                                <div>
                                                                    <a href="deletebook?Bid=${b.bid}"><i class="ni ni-fat-remove"></i></a>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                </td>
                                            </tr>  
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>


            </div>
        </div>





        <!--   Core   -->
        <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
        <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <!--   Optional JS   -->
        <!--   Argon JS   -->
        <script src="assets/js/argon-dashboard.min.js?v=1.1.2"></script>
        <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
        <script>
            window.TrackJS &&
                    TrackJS.install({
                        token: "ee6fab19c5a04ac1a32a645abde4613a",
                        application: "argon-dashboard-free"
                    });
        </script>
    </body>
</html>