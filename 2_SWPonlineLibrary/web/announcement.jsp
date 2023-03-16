<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bcss/announcementStyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
    
</script>
<script>$(function(){
    //$("header").load("header.jsp");
    $("footer").load("footer.html") ;
    // $("#footer").load("footer.html"); 
  });</script>
    <title>Document</title>
</head>
<body>
    <%@include file="header.jsp" %>
<!--    <header>

    </header>-->
    <div class="content ">
        
        <div class="ann-list">
            <input type="hidden" />
            <div class="ann-head">
            <h5 class="text-primary" style=" display: inline-block; padding-top: 18px;"><i class="fa-solid fa-bell"></i>&nbspAnnouncement </h5> &nbsp
<!--            <div style="display: inline-block; font-size: 15px;">
                Red: important <br>
            Yellow: warning <br>
            Blue: notification
            </div>-->

            </div>
            
            <div class="ann-items">
                <c:forEach var="ann" items="${requestScope.ls}" >
                    <a href="#" class="ann-item">
                    <input type="hidden" value="${ann.announcementID}"/>
                    <div class="tag bg-warning"></div>
                    <div class="item-info">
                        <div class="head-item">
                            By<div class="lib-name">:&nbsp${ann.librarionID}</div>|
                            <div class="date">${ann.getPublisDate()}</div>
                            
                        </div>
    
                    <div class="title">${ann.title}</div>
                    </div>
                    
                </a>
                </c:forEach>
                
                
                
            </div>
          
        </div>
      
        <div class="ann-info ">
            <div class="head-info">

                <h5 style="line-height: 60px; margin-left: 6px; display: inline-block;">From:</h5>&nbsp <p class="ann-info-name" style="display: inline-block;">text</p> &nbsp &nbsp &nbsp |&nbsp <p class="ann-info-date" style="display: inline-block;">text</p>
            </div>
            <div class="ann-info-content">
                
            </div>
        </div>
        <footer>
       
    </footer>
    </div>

    
    <script>
    $(document).ready(function () {
        
        var ann = document.getElementsByClassName("ann-item");
        var newest = -1;
        for(let i=0;i<ann.length;i++){
             if(ann[i].children[0].value>newest)
                    newest=ann[i].children[0].value;
            ann[i].addEventListener("click",function () {
              
     
        $.post("/2_SWPonlineLibrary/loadannouncement",{id:ann[i].children[0].value}, function (data) {
             var obj = JSON.parse(data);
        $(".ann-info-content").html(obj.content);
        $(".ann-info-name").html(obj.librarionID);
        $(".ann-info-date").html(obj.publishDate);
        
        //let substrings = data.split('\r\n');
     //   $(function () {
//            var availableTags = substrings;
//            $("#search-input").autocomplete({
//                source: availableTags
//            });
        //});
    });
});


        }
//        console.log(newest);
$.post("/2_SWPonlineLibrary/loadannouncement",{id:newest}, function (data) {
    var obj = JSON.parse(data);
        $(".ann-info-content").html(obj.content);
        $(".ann-info-name").html(obj.librarionID);
        $(".ann-info-date").html(obj.publishDate);
        });
//    console.log(data);
//    $.post("/2_SWPonlineLibrary/loadannouncement",{text:"hahahaha"}, function (data) {
//        console.log(data);
//        let substrings = data.split('\r\n');
//        $(function () {
////            var availableTags = substrings;
////            $("#search-input").autocomplete({
////                source: availableTags
////            });
//        });
//    });

});
    
    </script>
</body>

</html>