<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <script src="https://kit.fontawesome.com/b35dc4065e.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title></title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="stylesheet"  href="bcss/headerStyle.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="header" style="z-index: 2;">
            <nav class="navbar navbar-expand-lg navbar-light bg">

                <div class="navbar-collapse" id="navbarNavAltMarkup">
                    <div class="home-logo"><a href="loadhome"><img src="logo/library.png" alt="alt"/></a></div>
                    <div class="navbar-nav items">
                        <a class="nav-link active" href="loadhome">Home</a>
                        <a class="nav-link active" href="loadannouncement">Announcement</a>
                        <a class="nav-link active"s href="bookpage">Book</a>
                        <c:if test="${sessionScope.account.accessLevel==1}">
                        <a class="nav-item nav-link active" href="BorrowList.jsp">My Wait List <${sessionScope.bookWait.size()}></a>
                        <a class="nav-link active" href="viewOrderHistory">History</a>  
                        <a class="nav-item nav-link active" href="#">About us </a>  
                        </c:if>
                        <c:if test="${sessionScope.account.accessLevel==2}">
                            <a class="nav-item nav-link active" href="announcement">Librarian</a>  
                        </c:if>
                    </div>

                </div>
                <form class="search-form" action="search" method="get" style="display: block;">
                    <div class="input-area">
                        <input name="searchKey" id="tags" oninput="ajax(this.value)" placeholder="Search">
                        <div class="result">
                        </div>


                    </div>
                    <button class="search-button btn btn-success" type="submit"><i class="fas fa-search"></i></button>
                </form>


                <div class="user-area">
                    <a role="button" onclick="userInfo()">
                        <i class="fa-solid fa-user"></i>
                        <c:if test="${sessionScope.account==null}">
                            <a href="login.jsp">Login</a>>
                        </c:if>
                        ${sessionScope.account.accountName}
                    </a>
                        <c:if test="${sessionScope.account!=null}">
                    <di class="user-dropdown">
                        <a role="button" class="user-item" onclick="showUserInfo()">
                            <i class="fa-solid fa-id-card"></i>&nbspView Profile <br>
                        </a>

                        <a href="logout" class="user-item">

                            <i class="fa-solid fa-right-from-bracket"></i>&nbspLogout
                        </a>


                    </di>
                    </c:if>
                </div>
            </nav>
        </div>
                    <div class="model" onclick="showUserInfo()">
                        <div class="user-profile">
                        <div class="profile-name">
                            <i class="fa-regular fa-circle-user"></i>
                            <h3>${sessionScope.account.fullName}</h3>
                        </div>
                        <div class="profile-info">
                            <strong>
                                Infomation
                            </strong>
                            <hr>
                            <div class="info-top">
                                <div class="info-left">
                                    <strong>Email:</strong>&nbsp;${sessionScope.account.accountName}
                                     <br>
                                    <br>
                                     <strong>Gender:</strong>&nbsp;${sessionScope.account.gender==true?"Male":"Female"}
                                </div>
                                <br>
                                <div class="info-right">
                                    <strong>Phone:</strong>&nbsp;${sessionScope.account.phoneNumber}
                                    <br>
                                    <br>
                                    <strong>Status:</strong>&nbsp;<p class="status-info text-success">${sessionScope.account.status==1?"Good":"suspended"}</p>
                                </div>
                               
                                
                            </div>
                        </div>
                        
                        
                        
                    </div>
                    </div>
                    





        <!-- <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form> -->




        <script>
            $( document ).ready(function() {
    $('.user-profile').click(function(event){
    event.stopPropagation();
});
});
            function showUserInfo(){
                console.log("aaa");
                if($(".model").css("display")=="none"){
                    $(".model").css("display","block");
                }else{
                    $(".model").css("display","none");
                }
            }
            
            function userInfo(){
                if($(".user-dropdown").css("display")=="none"){
                    console.log("Is none");
                    $(".user-dropdown").fadeIn("fast");
                }else
                $(".user-dropdown").fadeOut("fast");
                
            }
        
            $(".result").click(function (e) {
                e.stopPropagation();
            })
            $(".input-area").click(function (e) {
                e.stopPropagation();
            })
            $(document).click(function () {
                $(".result").html("");
            });

            function ajax(text) {
                text = text.trim();
                if (text == "") {
                    console.log("text is null");
                    return;
                }
                $.ajax({
                    url: "/2_SWPonlineLibrary/test",
                    method: "POST",
                    data: {id: text},
                    //  dataType: "html"

                })

                        .done(function (msg) {
                            //$( "#log" ).html( msg );

                            $(".result").html(msg);
                            $(".result-item").click(function () {
                                var i = this.children[0].value;
                                //console.log(i);
                                window.location.href = "bookinfo?id=" + i + "";
                            })
                        });

//request.fail(function( jqXHR, textStatus ) {
//  alert( "Request failed: " + textStatus );
//});
            }
        </script>
        <script src="js/bootstrap.js">

        </script>
        <script src="js/bootstrap.min.js">

        </script>

    </body>
</html>
