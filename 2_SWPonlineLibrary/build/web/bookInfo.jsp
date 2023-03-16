<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bcss/bookInfoStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
    <title>Document</title>
</head>

<body>
    <%@include file="header.jsp" %>
<!--    <header>

    </header>-->
    <section class="container disabled">
        <div class="book-photo">
            <img src="${book.image}" alt="">
            <c:if test="${book.quantity==0}">
                <h3>This book is no longer in the library </h3>
            </c:if>
            <c:if test="${book.quantity>=1}">
                <a class="btn btn-primary ${sessionScope.account.accessLevel!=1?"disabled":""}" href="viewBorrowList?id=${book.bookId}">Add to your list order</a>
            </c:if>
            
        </div>
        <div class="book-info">
            <div class="book-name">
                <h2>${book.bookName}</h2>
                By<p style="color: red; display: inline;"> ${book.author}</p>

                <h5 class="total-rate">   </h5>
                <span class="fa fa-star "></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star "></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <hr style="border: 1px solid rgb(160, 160, 160);">
                <div class="overview">
                    <div class="publish-date"> Publish date: <br>${book.publishYear} </div>
                    <div class="publisher">Publisher:<br>${book.publisher}</div>
                    <div class="language">Language:<br>${book.language}</div>
                    <div class="pages">Pages:<br>${book.pages}</div>
                </div>
            </div>
            <div class="book-description">
                <h5>Previews</h5>
                <p>${book.description}</p>
            </div>
            <div class="feedback">
                <div class="head-feedback">
                    <h3 style="display: inline-block;">FeedBack</h3>
                    <br>
                    <h5 class="total-rate-feedback" style="display: inline-block;"></h5>
                    <span class="fa fa-star "></span>
                    <span class="fa fa-star "></span>
                    <span class="fa fa-star "></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div>
                <div class="content-feedback">
                    <c:if test="${requestScope.listFeedBack.size()==0}">
                        <h4>There are no comments here!</h4>
                    </c:if>
                    <c:forEach var="feedback" items="${requestScope.listFeedBack}">
                    <div class="feedback-item">

                        <div class="name">
                            <div class="icon-user border border-secondary rounded-circle"><i
                                    class="fa-regular fa-user"></i></div></i>
                            <div class="user-name" style="display: inline-block;">${feedback.accountName}<br>
                                <input class="indiv-star" type="hidden" value="${feedback.star}"/>
                                
                                <span class="fa fa-star ${feedback.star>=1?"checked":""}"></span>
                                <span class="fa fa-star ${feedback.star>=2?"checked":""}"></span>
                                <span class="fa fa-star ${feedback.star>=3?"checked":""}"></span>
                                <span class="fa fa-star ${feedback.star>=4?"checked":""}"></span>
                                <span class="fa fa-star ${feedback.star>=5?"checked":""}"></span>
                            </div>
                             <div class="feedback-date">${feedback.date}</div>
                        </div>
                        <div class="content">
                            ${feedback.content}
                        </div>
                    </div>
                    <hr>
                    </c:forEach>


                    
                </div>
            </div>
        </div>
       <footer>

    </footer>
    </section>
    


            <script>
                
                jQuery(document).ready(function ()
        {
            var istar= $(".indiv-star");
            var avg=0;
            for(var i=0;i<istar.length;i++){
                //avg+=$(".indiv-star").get(i).values;
                avg+=parseFloat($(".indiv-star").eq(i).val());
               
            }
            avg/=(istar.length);   
            $(".total-rate").html("Star rating: "+avg);
            $(".total-rate-feedback").html("Star "+avg+" per 5");
            var stars =$(".book-name .fa");
            var  fstars=$(".head-feedback .fa");
            for(var i=0;i<stars.length;i++){
                if(avg>=i+1){
                    stars.eq(i).addClass("checked");
                    fstars.eq(i).addClass("checked");
                }
            }
            
            
        
    
    
    })
            </script>
            
            
        <script>$(function () {
            
           // $("header").load("header.jsp");
            $("footer").load("footer.html") ;
            // $("#footer").load("footer.html"); 
        });</script>
    <script src="https://kit.fontawesome.com/b35dc4065e.js" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>