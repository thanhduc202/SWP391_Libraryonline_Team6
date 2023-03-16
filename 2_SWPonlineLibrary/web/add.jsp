<%-- 
    Document   : add
    Created on : Feb 23, 2023, 3:50:56 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD User</title>
            <script>
                //validate email
            function validateEmail(email) {
                var re = /\S+@\S+\.\S+/;
                return re.test(email);
            } 
            ;
            //validate fullname
            function isValidFullname(fullname)
            {
                var re = /^[a-zA-Z ]+$/;
                return re.test(fullname);
            }
            ;
            //validate phone
            function validatePhone(phone)
            {
                var phoneRe = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
                var digits = phone.replace(/\D/g, "");
                return phoneRe.test(digits);
            }
            ;

            function validate() {
                var txtemail = document.getElementById("txtemail");
                var txtName = document.getElementById("txtName");
                var txtphone = document.getElementById("txtphone");
                if (!validateEmail(txtemail.value))
                {                  
                    alert('ACCOUNTNAME/EMAIL INVALID');
                }
                if (!isValidFullname(txtName.value))
                {                  
                    alert('FULLNAME INVALID');
                }
                if (!validatePhone(txtphone.value))
                {                  
                    alert('PHONENUMBER INVALID');
                }

                if(chainValid()){
                    document.getElementById("frmadd").submit();
                }
            }    
            function chainValid() {
                var txtemail = document.getElementById("txtemail");
                var txtName = document.getElementById("txtName");
                var txtphone = document.getElementById("txtphone");
                if (!validateEmail(txtemail.value))
                {
                    return false;
                }
                if (!isValidFullname(txtName.value))
                {
                    return false;
                }
                if (!validatePhone(txtphone.value))
                {                  
                    return false;
                }

                return true;
            }
 
            </script>
    </head>
    <body>

        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form id="frmadd" action="add" method="post">
                    <table>
                        <div class="formbold-mb-5">
                            <label  class="formbold-form-label"> AccountName </label>
                            <input id="txtemail" type="text" name="name" class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> Password </label>
                            <input type="text" name="password" class="formbold-form-input"/>
                        </div>
                        <div class="formbold-mb-5">
                            <label class="formbold-form-label"> FullName </label>
                            <input id="txtName" type="text" name="fullname" class="formbold-form-input" />
                        </div>
                        <div class="flex flex-wrap formbold--mx-3">
                            <div class="w-full sm:w-half formbold-px-3">
                                <div class="formbold-mb-5 w-full">
                                    <label for="date" class="formbold-form-label"> Gender </label>
                                    <input type="radio" name="gender" value="1"> Male
                                    <input type="radio" name="gender" value="0"> Female

                                </div>
                            </div>

                        </div>

                        <div class="formbold-mb-5 formbold-pt-3">
                            <label class="formbold-form-label formbold-form-label-2">
                                More Information
                            </label>
                            <div class="flex flex-wrap formbold--mx-3">
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <input id="txtphone" type="text" name="PhoneNumber" placeholder="Phone Number" class="formbold-form-input" />
                                    </div>
                                </div>
                                <div class="w-full sm:w-half formbold-px-3">
                                    <div class="formbold-mb-5">
                                        <select name="status" class="formbold-form-input">
                                            <option value="1">Approve</option>
                                            <option value="0">Block</option>
                                        </select>
                                        <!--<input type="text" name="status" placeholder="Status" class="formbold-form-input"/>-->
                                    </div>
                                </div>
                                <div class="flex flex-wrap formbold--mx-3">
                                    <div class="w-full sm:w-half formbold-px-3">
                                        <div class="formbold-mb-5 w-full">
                                            <label for="date" class="formbold-form-label"> AccessLevel </label>
                                            <input type="radio" name="accesslevel" value="1"> Admin
                                            <br>
                                            <input type="radio" name="accesslevel" value="2"> Librarian
                                            <br>
                                            <input type="radio" name="accesslevel" value="3"> User
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <button type="button" class="formbold-btn" value="Add" onclick="validate();">ADD</button>
<!--                            <input type="submit" class="formbold-btn" value="ADD">-->
                        </div>
                        <br>
                        <div>
                            <a href="ManageUser">Cancel</a>
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
