<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="bcss/bookPageStyle.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script>$(function () {
                // $("header").load("header.jsp");
                $(".foo").load("footer.html");
                // $("#footer").load("footer.html"); 
            });</script>
    </head>

    <body>
        <%@include file="header.jsp" %>
<!--            <header>
        
            </header>-->


        <section id="container">

            <div class="sidebar-menu">
                <div class="wrap-category" ><a href="#0" class="category" ><i class="fa-solid fa-filter" color>&emsp;</i>Filter</a></div>            
                <div class="ivi">
                    <a role="button">Sort A-Z</a>
                    <a role="button">Sort Z-A</a>
                    <a role="button">Newest</a>
                    <a role="button">Most popular</a>

                </div>
                <div class="wrap-category" ><a href="#0" class="category" ><i class="fa-solid fa-book">&emsp;</i>Book category</a></div>            
                <div class="ivi">
                    <a role="button">Science</a>
                    <a role="button">Foreign language</a>
                    <a role="button">Psychology</a>
                    <a role="button">Cook-book</a>
                    <a role="button">Life style</a>
                    <a role="button">History</a>
                    <a role="button">Mystery</a>
                    <a role="button">Programming</a>
                    <a role="button">Storybook</a>
                </div>
                <div class="wrap-category" ><a href="#0" class="category" ><i class="fa-solid fa-landmark">&emsp;</i>Specialized books</a></div>            
                <div class="ivi">
                    <a role="button">Specialized books</a>
                    
                </div>
                <div class="wrap-category" ><a href="#0" class="category" ><i class="fa-solid fa-list">&emsp;</i>Other books</a></div>            
                <div class="ivi">
                    <a role="button">Other books</a>
                </div>



            </div>



        </div>

        <div class="book-container">
            <div class="bookshelves">
                <c:forEach var="book" items="${requestScope.bookFound}">
                    
                <a class="book"  href="bookinfo?id=${book.bookId}">
                <div class="book-img">
                    <img src="${book.image}" alt="">
                </div>

                <div class="title">${book.bookName}</div>
                <div class="author">${book.author}</div>
                <div class="star-rate">
                    <span class="fa fa-star ${book.rate>=1?"checked":""}"></span>
                    <span class="fa fa-star ${book.rate>=2?"checked":""}"></span>
                    <span class="fa fa-star ${book.rate>=3?"checked":""}"></span>
                    <span class="fa fa-star ${book.rate>=4?"checked":""}"></span>
                    <span class="fa fa-star ${book.rate>=5?"checked":""}"></span>

                </div>
            </a>
            
                </c:forEach>
            </div>





            <div class="pagination-field">
                <nav class="pa" aria-label="..." clas>
                    <ul class="pagination">
                        <li id="prevBtn" class="page-item disabled">
                            <span class="page-link">Previous</span>
                        </li>
                        <c:forEach begin="1" end="${requestScope.paginationSize}" step="1" var="i">

                            <li class="page-item ${(i==1)? "active" :""} page-num"><a class="page-link  " role="button" tab-index="0">${i}</a></li>


                        </c:forEach>
                        <li id="nextBtn" class="page-item">
                            <span class="page-link">Next</span>
                        </li>
                    </ul>
                </nav>
            </div>


        </div>





    </section>

    <div class="foo"></div>

    <script>
        var curr = 0;
        var maxCurr = $(".page-num").length - 1;

//        function checkIndex(t){
//            console.log()
//            Array.prototype.indexOf.call(t.parentElement.children, t);
//        }

        // function pullDown(a){
        //    console.log(a.nextSibling)
        //    var b = a.nextSibling;
        //    b.slideToggle( "slow");
        //    if(a.text()=="Expand Author Details"){
        //     a.text()="Hide Author Details";
        //    }
        //    else
        //     a.text()="Expand Author Details";


        // }


        jQuery(document).ready(function ($)
        {
            var type = "";
            $(".ivi a").click(function () {
                type += Array.prototype.indexOf.call($(".ivi"), this.parentElement).toString();
                type += "-";
                type += Array.prototype.indexOf.call(this.parentElement.children, this).toString();
                //o=Array.prototype.indexOf.call(this.parentElement.parentElement.children, this.parentElement)
                console.log(type);
                $.post("/2_SWPonlineLibrary/filter", {type: type}, function (data) {
                var books = "";
                var obj = JSON.parse(data);

                for (var i = 0; i < obj.length; i++) {


                    books += "<a class=\"book\"  href=\"bookinfo?id=" + obj[i].bookId + "\">\n" +
                            "                <div class=\"book-img\">\n" +
                            "                    <img src=\"" + obj[i].image + "\" alt=\"\">\n" +
                            "                </div>\n" +
                            "\n" +
                            "                <div class=\"title\">" + obj[i].bookName + "</div>\n" +
                            "                <div class=\"author\">" + obj[i].author + "</div>\n" +
                            "                <div class=\"star-rate\">\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 1 ? "checked" : "0") + " \"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 2 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 3 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 4 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 5 ? "checked" : "0") + "\"></span>\n" +
                            "\n" +
                            "                </div>\n" +
                            "            </a>";
                }
//    console.log(books);

                $(".bookshelves").html(books);
                $("html, body").animate({scrollTop: 0}, "slow");
            })

                type = ""
            })

            //showBookPagination(curr);
            //var arr= Array.from($(".author_bio_wrap_toggle"))

            $(".category").click(function () {

                var height = this.parentNode.nextElementSibling.children[0].clientHeight;
                console.log(height);
                var size = this.parentNode.nextElementSibling.children.length;
                if (this.parentNode.nextElementSibling.clientHeight == 0) {
                    this.style.color = "white";

                    this.parentNode.style.backgroundColor = "#685cfe";
                    this.parentNode.nextElementSibling.style.height = "" + (size * height + 4) + "px"

                } else {
                    this.style.color = "black";
                    this.parentNode.style.backgroundColor = "#ffffff";
                    this.parentNode.nextElementSibling.style.height = "0"
                }

            });


            $(".page-num").click(function () {
                $($(".page-num")[curr]).removeClass("active");
                curr = this.textContent - 1;
                $($(".page-num")[curr]).addClass("active");

                showBookPagination(curr);

            });

            $("#prevBtn").click(function () {

                $($(".page-num")[curr]).removeClass("active");
                curr = curr - 1;
                $($(".page-num")[curr]).addClass("active");

                showBookPagination(curr);

            });
            $("#nextBtn").click(function () {

                $($(".page-num")[curr]).removeClass("active");
                curr = curr + 1;
                $($(".page-num")[curr]).addClass("active");

                showBookPagination(curr);
            });


//  function pagination(id){
//     
//  }





            // $('author_bio_wrap_toggle').click(function(){
            //     $(".ivi").slideDown();
            // })
//  arr.forEach(element=>{

//console.log(element);
// element.addEventListener('click',function(){
//    console.log(element.parentNode.nextElementSibling.style.display)

//     if(element.parentNode.nextElementSibling.clientHeight==0){
//         element.parentNode.nextElementSibling.classList.add("ivi1");

//     }


            // if(element.parentNode.nextElementSibling.style.display!="none"){
            //     $(".ivi").slideUp();
            // }else{
            //     $(".ivi").slideDown();
            // }
            // console.log(element.parentNode.nextElementSibling);

// })
// })




//   $("#author_bio_wrap_toggle").click(function()
//   {

//     $("#author_bio_wrap").slideToggle( "slow");

// 	  if ($("#author_bio_wrap_toggle").text() == "Expand Author Details")
//       {			
//         $("#author_bio_wrap_toggle").html("Hide Author Details")
//       }
// 	  else 
//       {		
//         $("#author_bio_wrap_toggle").text("Expand Author Details")
//       }

//   });  

        });
        function showBookPagination(id) {
            if (curr == 0) {
                console.log("if")
                $("#nextBtn").removeClass("disabled");
                $("#nextBtn").css("pointer-events", "auto");
                $("#prevBtn").addClass("disabled");
                $("#prevBtn").css("pointer-events", "none");

            } else if (curr == maxCurr) {
                console.log("else if")
                $("#prevBtn").removeClass("disabled");
                $("#prevBtn").css("pointer-events", "auto");
                $("#nextBtn").addClass("disabled");
                $("#nextBtn").css("pointer-events", "none");
            } else {
                console.log("else")
                $("#prevBtn").removeClass("disabled");
                $("#prevBtn").css("pointer-events", "auto");
                $("#nextBtn").removeClass("disabled");
                $("#nextBtn").css("pointer-events", "auto");

            }

            $.post("/2_SWPonlineLibrary/bookpagination", {id: id}, function (data) {
                var books = "";
                var obj = JSON.parse(data);

                for (var i = 0; i < obj.length; i++) {


                    books += "<a class=\"book\"  href=\"bookinfo?id=" + obj[i].bookId + "\">\n" +
                            "                <div class=\"book-img\">\n" +
                            "                    <img src=\"" + obj[i].image + "\" alt=\"\">\n" +
                            "                </div>\n" +
                            "\n" +
                            "                <div class=\"title\">" + obj[i].bookName + "</div>\n" +
                            "                <div class=\"author\">" + obj[i].author + "</div>\n" +
                            "                <div class=\"star-rate\">\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 1 ? "checked" : "0") + " \"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 2 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 3 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 4 ? "checked" : "0") + "\"></span>\n" +
                            "                    <span class=\"fa fa-star " + (obj[i].rate >= 5 ? "checked" : "0") + "\"></span>\n" +
                            "\n" +
                            "                </div>\n" +
                            "            </a>";
                }
//    console.log(books);

                $(".bookshelves").html(books);
                $("html, body").animate({scrollTop: 0}, "slow");
            })
        }

    </script>



    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://kit.fontawesome.com/b35dc4065e.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>

</html>