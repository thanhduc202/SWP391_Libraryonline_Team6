<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Addbook
    Created on : Mar 8, 2023, 3:42:41 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ADD BOOK</title>
    </head>
    <body>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="addbook" method="post">
                    <table>
                        <div class="formbold-mb-5">
                            <label  class="formbold-form-label"> BookName </label>
                            <input type="text" name="bookname"class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Author </label>
                            <input type="text" name="author" class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Image </label>
                            <input type="text" name="image" class="formbold-form-input" />
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Category </label>
                            <select name="cate" class="formbold-form-input">
                                <c:forEach var="o" items="${listc}">   
                                    <option value="${o.cid}">${o.cname}</option>
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
                                        <input type="text" name="language" placeholder="Language" class="formbold-form-input" />
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input type="text" name="description" placeholder="Description" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <select name="status" class="formbold-form-input">
                                            <option value="1">Open</option>
                                            <option value="0">Close</option>
                                        </select>
<!--                                        <input type="text" name="status" placeholder="Status" class="formbold-form-input"/>-->
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input type="text" name="quantity" placeholder="quantity" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input type="text" name="publisher" placeholder="publisher" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input type="text" name="publishyear" placeholder="publishyear" class="formbold-form-input"/>
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input type="text" name="page" placeholder="pages" class="formbold-form-input"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <button type="submit" class="formbold-btn" value="Add">ADD</button>
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