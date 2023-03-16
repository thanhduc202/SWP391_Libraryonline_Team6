<%-- 
    Document   : editprofile
    Created on : Mar 9, 2023, 2:01:44 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="LoadProfile" method="post">
                    <table>
                        <div class="formbold-mb-5">
                            <label  class="formbold-form-label"> Username </label>
                            <input value="${lista.name}" type="text" name="username"class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Password </label>
                            <input value="${lista.password}" type="text" name="password" class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Fullname </label>
                            <input value="${lista.fullname}"  type="text" name="fullname" class="formbold-form-input" />
                        </div>
                        <div class="flex flex-wrap formbold--mx-3">
                            <div class="w-full sm:w-half formbold-px-3">
                                <div class="formbold-mb-5 w-full">
                                    <label for="date" class="formbold-form-label"> Gender </label>
                                    <input type="radio" name="gender" value="0" ${lista.gender==true?"checked":""}> Male
                                    <input type="radio" name="gender" value="1" ${ac.gender==false?"checked":""}> Female

                                </div>
                            </div>

                        </div>
                         <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Phone </label>
                            <input value="${lista.phonenumber}"  type="text" name="phonenumber" class="formbold-form-input" />
                        </div>
                         <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Status </label>
                            <input value="${lista.status}"  type="text" name="status" class="formbold-form-input" />
                        </div>
                         <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Accesslevel </label>
                            <input value="${lista.accesslevel}"  type="text" name="accesslevel" class="formbold-form-input" />
                        </div>


                        <div>
                            <button type="submit" class="formbold-btn" value="Edit">Edit</button>
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
