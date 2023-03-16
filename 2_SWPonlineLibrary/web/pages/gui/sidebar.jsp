<%-- 
    Document   : sidebar
    Created on : Feb 22, 2023, 11:33:54 PM
    Author     : tient
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- partial:../../partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="loadhome">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Home</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">Book Rental</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="book_rental?action=order">Orders</a></li>
                    <li class="nav-item"> <a class="nav-link" href="book_rental?action=return">Returns</a></li>
                    <li class="nav-item"> <a class="nav-link" href="book_rental?action=renewal">Renewals</a></li>
                    <li class="nav-item"> <a class="nav-link" href="book_rental?action=penalty">Penalties</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="announcement">
                <i class="icon-paper menu-icon"></i>
                <span class="menu-title">Announcement</span>
            </a>
        </li>
    </ul>
</nav>


