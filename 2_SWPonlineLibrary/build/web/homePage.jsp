<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
        <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous">

        </script>
        <script>$(function () {
                //$("header").load("header.jsp");
                 $(".foo").load("footer.html"); 
            });</script>
        <script src="https://kit.fontawesome.com/b35dc4065e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="bcss/homePageStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="js/bootstrap.js"></script>
        <script src="bjs/homePageScript.js"></script>
    </head>
    <body>
<!--        <header>
            
        </header>-->

         <%@include file="header.jsp" %>
        <div class="container-fluid">

            <div class="head-content">
                <h1>"Nothing is pleasanter than exploring a library."</h1>
            </div>
            <div class="content">
                <h1>New books</h1>
                <div class="new-release">
                    <!-- onmouseover="moveOut(this)" onmouseleave="moveIn(this) -->
                    <c:forEach var="book" items="${requestScope.topBook}">
                        <a href="bookinfo?id=${book.bookId}" class="new-book" onmouseover="moveIn(this.children[1])" onmouseleave="moveOut(this.children[1])" >
                        <div class="book-picture">
                            <img src="${book.image}" class="img-thumbnail"alt="">
                            ${book.bookName}
                        </div>
                        <div class="book-info">
                            <ul>
                                <li>Author: ${book.author}</li>
                                <li>Pages: ${book.pages}</li>
                              
                                <li>release date: ${book.publishYear}</li>
                            </ul>

                        </div>

                    </a>
                    </c:forEach>
                    
                    




                </div>

                
                    






            </div>
            <div class="subject">
                <div class="subject-title">
                    <h3>Subjects you may like</h3>
                    
                </div>
                <div class="subject-items">
                        <div class="subject-item">
                     <a  href="filter?id=1"><i class="fa-solid fa-flask"></i></i> </a>
                     <h4>Science</h4>
                    </div>
                    <div class="subject-item">
                     <a  href="filter?id=2"><i class="fa-solid fa-language"></i> </a>
                     <h4>Language</h4>
                    </div>
                     <div class="subject-item">
                     <a  href="filter?id=8"><i class="fa-solid fa-code"></i> </a>
                     <h4>Programming</h4>
                    </div>
                     <div class="subject-item">
                     <a  href="filter?id=6"><i class="fa-solid fa-landmark-dome"></i> </a>
                     <h4>History</h4>
                    </div>
                </div>
                </div>

        </div>
        <div class="suggest-book">
            <h2>Discover your next book</h2>
            <div class="suggest-items"> 
                <c:forEach var="book" items="${requestScope.bookRandom}">
                     <a href="bookinfo?id=${book.bookId}" class="suggest-item">
                         
                    
                    <img src="${book.image}" "alt="">
                    <p><strong>${book.bookName}</strong><br>${book.description}</p>
                </a>
                </c:forEach>
               
                
                   
                </div>
                </div>
            </div>
            
        </div>
        
        
        <div class="foo"></div>
       
        <script src="WEB-INF/js/homePageScript.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>