<%-- 
    Document   : OrderForm
    Created on : Mar 8, 2023, 4:06:45 AM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<! DOCTYPE html>  
<html>  
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta charset="UTF-8">    
    <title> Book FeedBack Form  </title>     

    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700');
        body {

            font-family: 'Roboto Condensed', sans-serif;
            color: #262626;
            margin: 5% 0;
        }
        .container {
            width: 100%;
            margin-top: 200px;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
        @media (min-width: 1200px)
        {
            .container {
                max-width: 1140px;
            }
        }
        .d-flex {
            display: flex;
            flex-direction: row;
            background: #f6f6f6;
            border-radius: 0 0 5px 5px;
            padding: 25px;
        }
        form {
            flex: 4;
        }
        .Yorder {
            flex: 2;
        }
        .title {
            background: -webkit-gradient(linear, left top, right bottom, color-stop(0, #5195A8), color-stop(100, #70EAFF));
            background: -moz-linear-gradient(top left, #5195A8 0%, #70EAFF 100%);
            background: -ms-linear-gradient(top left, #5195A8 0%, #70EAFF 100%);
            background: -o-linear-gradient(top left, #5195A8 0%, #70EAFF 100%);
            background: linear-gradient(to bottom right, #5195A8 0%, #70EAFF 100%);
            border-radius: 5px 5px 0 0 ;
            padding: 20px;
            color: #f6f6f6;
        }
        h2 {
            margin: 0;
            padding-left: 15px;
        }
        .required {
            color: red;
        }
        label {
            display: block;
            margin: 15px;
        }
        table {
            display: block;
            margin: 15px;
        }
        label>span {
            float: left;
            width: 25%;
            margin-top: 12px;
            padding-right: 10px;
        }
        input[type="email"]
        {
            width: 70%;
            height: 30px;
            padding: 5px 10px;
            margin-bottom: 10px;
            border: 1px solid #dadada;
            color: #888;
        }
        select
        {
            width: 70%;
            height: 30px;
            padding: 5px 10px;
            margin-bottom: 10px;
            border: 1px solid #dadada;
            color: #888;
        }
        input[type="text"] {
            width: 70%;
            height: 30px;
            padding: 5px 10px;
            margin-bottom: 10px;
            border: 1px solid #dadada;
            color: #888;
        }
        input[type="tel"]
        {
            width: 70%;
            height: 30px;
            padding: 5px 10px;
            margin-bottom: 10px;
            border: 1px solid #dadada;
            color: #888;
        }
        select {
            width: 72%;
            height: 45px;
            padding: 5px 10px;
            margin-bottom: 10px;
        }
        .Yorder {
            margin-top: 15px;
            height: 600px;
            padding: 20px;
            border: 1px solid #dadada;
        }
        table {
            margin: 0;
            padding: 0;
        }
        th {
            border-bottom: 1px solid #dadada;
            padding: 10px 0;
        }
        tr>td:nth-child(1) {
            text-align: left;
            color: #2d2d2a;
        }
        tr>td:nth-child(2) {
            text-align: right;
            color: #52ad9c;
        }
        td {
            border-bottom: 1px solid #dadada;
            padding: 25px 25px 25px 0;
        }
        p {
            display: block;
            color: #888;
            margin: 0;
            padding-left: 25px;
        }
        .Yorder>div {
            padding: 15px 0;
        }
        button {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            border: none;
            border-radius: 30px;
            background: #52ad9c;
            color: #fff;
            font-size: 15px;
            font-weight: bold;
        }
        button:hover {
            cursor: pointer;
            background: #428a7d;
        }
    </style>  
    <%--<%@include file="header.jsp" %>--%>
    <body>  
        <div class="container">  
            <div class="title">  
                <h2> Book FeedBack Form  </h2>  
            </div>  
            <div class="table-responsive mb-4">
                <table class="table text-nowrap">
                    <thead class="bg-light">
                        <tr>
                            <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Book</strong></th>   
                            <!--<th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Status</strong></th>-->
                        </tr>
                    </thead>
                    <tbody class="border-0">
                        
                        <tr>
                            <th class="ps-0 py-3 border-light" scope="row">
                                <div class="d-flex align-items-center"><a class="reset-anchor d-block animsition-link" href="#"><img src="${b.image}" alt="..." width="70"/></a>

                                </div>
                            </th>
                            <th class="ps-0 py-3 border-light" scope="row">
                                <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" >${b.bookName}</a></strong></div>

                            </th>
                            <td class="p-3 align-middle border-light"><a class="reset-anchor" href="#!"><i class="fas fa-trash-alt small text-muted"></i></a></td>

                        </tr>
                        

                        <!--                                        <tr>
                                                                    <th class="ps-0 py-3 border-0" scope="row">
                                                                        <div class="d-flex align-items-center"><a class="reset-anchor d-block animsition-link" href="detail.html"><img src="img" alt="..." width="70"/></a>
                                                                            <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" href="detail.html">#</a></strong></div>
                                                                        </div>
                                                                    </th>
                        
                        
                                                                    <td class="p-3 align-middle border-0"><a class="reset-anchor" href="#!"><i class="fas fa-trash-alt small text-muted"></i></a></td>
                                                                </tr>-->
                    </tbody>

                </table>
            </div>
            <div class="d-flex"> 
                <form action="getFeedBack2" method="post">
                    <label for="name">Account Name</label>
                    <input readonly="true" type="text" id="txtname" name="name" value="${sessionScope.account.accountName}">
                    <br/>
                    <label> Date  </label> 
                    <input type="date" readonly="true" name="date" id="txtdate" value="${requestScope.odate}" min="2000-01-01" />>
                    <br/>
                    <br/>
                    <label> Star  </label> 
                    <input type="text"  name="star" id="txtstar" />
                    <label for="comment">Comment</label>
                    <textarea id="txtcomment" name="comment" placeholder="Write something.." style="width: 1000px; height: 200px"></textarea>

                     <div class="">  
                            <button type="submit"> Post </button>  
                     </div>  
                    <input name="id" type="hidden" value="${b.bookId}">
                </form>
            </div>  
        </div>

    </body>  
</html>  
