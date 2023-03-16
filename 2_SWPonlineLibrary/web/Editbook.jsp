<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Editbook
    Created on : Mar 8, 2023, 1:03:07 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT BOOK</title>
    </head>
    <body>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="LoadBook" method="post">
                    <table>
                        <div class="formbold-mb-5">
                            <label  class="formbold-form-label"> ID </label>
                            <input value="${lb.bid}" type="text" name="bid"class="formbold-form-input" readonly/>
                        </div>
                        <div class="formbold-mb-5">
                            <label  class="formbold-form-label"> BookName </label>
                            <input value="${lb.bname}" type="text" name="bookname"class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Author </label>
                            <input value="${lb.author}" type="text" name="author" class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Image </label>
                            <input value="${lb.img}"  type="text" name="image" class="formbold-form-input" />
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Category </label>
                            <select name="cate" class="formbold-form-input">
                                <c:forEach var="c" items="${listc}">                               
                                    <option ${c.cid==lb.cid?"selected":""} value="${c.cid}">${c.cname}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="formbold-mb-5 formbold-pt-3">
                            <label class="formbold-form-label formbold-form-label-2">
                                More Information
                            </label>
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Language </label>
                                        <input value="${lb.language}"  type="text" name="language" placeholder="Language" class="formbold-form-input" />
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Description </label>
                                        <input value="${lb.description}"  type="text" name="description" placeholder="Description" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Status </label>
                                         <select name="status" class="formbold-form-input">
                                            <option value="1" ${lb.status==1?"selected":""}>Open</option>
                                            <option value="0" ${lb.status==0?"selected":""}>Close</option>
                                        </select>
<!--                                        <input value="${lb.status}"  type="text" name="status" placeholder="Status" class="formbold-form-input"/>-->
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> quantity </label>
                                        <input value="${lb.quantt}"  type="text" name="quantity" placeholder="quantity" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Publisher </label>
                                        <input value="${lb.psher}" type="text" name="publisher" placeholder="publisher" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Publishyear </label>
                                        <input value="${lb.pyear}" type="text" name="publishyear" placeholder="publishyear" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <label class="formbold-form-label"> Pages </label>
                                        <input value="${lb.page}" type="text" name="page" placeholder="page" class="formbold-form-input"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <button type="submit" class="formbold-btn" value="Edit">Edit</button>
                        </div>
                                    <br>
                        <div>
                            <a href="Managebook">Cancel</a>
                        </div>
                    </table>
                </form>

            </div>


        </div>
    </body>
</html>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: "Inter", Arial, Helvetica, sans-serif;
    }
    .formbold-mb-5 {
        margin-bottom: 20px;
    }
    .formbold-pt-3 {
        padding-top: 12px;
    }
    .formbold-main-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 48px;
    }

    .formbold-form-wrapper {
        margin: 0 auto;
        max-width: 550px;
        width: 100%;
        background: white;
    }
    .formbold-form-label {
        display: block;
        font-weight: 500;
        font-size: 16px;
        color: #07074d;
        margin-bottom: 12px;
    }
    .formbold-form-label-2 {
        font-weight: 600;
        font-size: 20px;
        margin-bottom: 20px;
    }

    .formbold-form-input {
        width: 100%;
        padding: 12px 24px;
        border-radius: 6px;
        border: 1px solid #e0e0e0;
        background: white;
        font-weight: 500;
        font-size: 16px;
        color: #6b7280;
        outline: none;
        resize: none;
    }
    .formbold-form-input:focus {
        border-color: #6a64f1;
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
    }

    .formbold-btn {
        text-align: center;
        font-size: 16px;
        border-radius: 6px;
        padding: 14px 32px;
        border: none;
        font-weight: 600;
        background-color: #6a64f1;
        color: white;
        width: 100%;
        cursor: pointer;
    }
    .formbold-btn:hover {
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
    }

    .formbold--mx-3 {
        margin-left: -12px;
        margin-right: -12px;
    }
    .formbold-px-3 {
        padding-left: 12px;
        padding-right: 12px;
    }
    .flex {
        display: flex;
    }
    .flex-wrap {
        flex-wrap: wrap;
    }
    .w-full {
        width: 100%;
    }
    @media (min-width: 540px) {
        .sm\:w-half {
            width: 50%;
        }
    }
</style>
