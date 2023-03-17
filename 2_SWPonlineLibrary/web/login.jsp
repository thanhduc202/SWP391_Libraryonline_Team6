<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="bcss/loginStyle.css">
</head>
<div class="logo">
    <img src="logo/library.png" alt="alt"/>
</div>
<body>
    
    <div class="container" style="margin-top: 200px; height: 100vh;">
        <div class="row">
            <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
                <div class="panel border bg-white">
                    <div class="panel-heading">
                        <h3 class="pt-3 font-weight-bold">Login</h3>
                    </div>
                    <div class="panel-body p-3">
                        <form action="loginbasic" method="POST"  onsubmit="return validateForm(event)">
                            <div class="form-group py-2">
                                <div class="input-field"> <span class="far fa-user p-2"></span> <input id="aName" name="accountname" type="text" placeholder="Username or Email" required> </div>
                            </div>
                            <div class="form-group py-1 pb-2">
                                <div class="input-field"> <span class="fas fa-lock px-2"></span> <input id="aPassword" name="password" type="password" placeholder="Enter your Password" required> <button type="submit" class="btn bg-white text-muted"> <span class="far fa-eye-slash"></span> </button> </div>
                            </div>
                            <div class="form-inline"> <input type="checkbox" name="remember" id="remember"> <label for="remember" class="text-muted">Remember me</label> <label style="color: red;">${requestScope.failedMessage}</label> <!-- <a href="#" id="forgot" class="font-weight-bold">Forgot password?</a>  --></div>
                            <input type="submit" value = "Login" class="btn btn-primary btn-block mt-3">
                            
                        </form>
                    </div>
                    <div class="mx-3 my-2 py-2 bordert d-flex justify-content-center">
                        <div class="text-center py-3 "> 
                            <div class="row">
                                <div class="col-md-3">
                                  <a class="btn btn-outline-dark" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/2_SWPonlineLibrary/login&response_type=code
		   &client_id=1051044406552-3bcjp6hs28bkl9m7cspjvdpfuitb3fcn.apps.googleusercontent.com&approval_prompt=force" role="button" ">
                                    <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                                    Login with Google
                                  </a>
                                </div>
                              </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
                            <script>
                                function validateForm(event){
                                    var name=$("#aName").val();
                                    console.log(name);
                                    //event.preventDefault()
                                    if(!name.includes("@fpt.edu.vn")){
                                         alert("Your account is not FPT account");
                                        return false;
                                    }
                                 //   this.submit();
//                                    return false;
                                   
                                   
                                }
                                
                                
                                
                            </script>
                                
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
