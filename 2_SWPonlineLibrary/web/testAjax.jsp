<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

  <script>
//  $( function() {
//    var availableTags = [
//      "ActionScript",
//      "AppleScript",
//      "Asp",
//      "BASIC",
//      "C",
//      "C++",
//      "Clojure",
//      "COBOL",
//      "ColdFusion",
//      "Erlang",
//      "Fortran",
//      "Groovy",
//      "Haskell",
//      "Java",
//      "JavaScript",
//      "Lisp",
//      "Perl",
//      "PHP",
//      "Python",
//      "Ruby",
//      "Scala",
//      "Scheme"
//    ];
//    $( "#tags" ).autocomplete({
//      source: availableTags
//    });
//  } );
  </script>
  <style>
      *{
                   margin: 0;
          padding:0;
          box-sizing: border-box;
      }
      .input-area{
          width: 600px;
          height: 36px;
          border:1px solid red;
          margin-left: 30%;
         
      }
      
      .input-area input{
          width: 100%;
 
      }
      
      .result{
          float:left;
          width: 100%;
          min-height: 30px;
          background-color: blue;
          
      }
      .item{
          display: flex;
          width: 100%;
          height: 44px;
      }
      .below{
          width: 100%;
          height: 200px;
          background: black;
      }
      .image{
          width: 30%;
          height: 100%;
      }
      .image img{
          max-width: auto;
  max-height: 100%;
      }
      
      .title{
          width: 70%;
          height: 100%;
      }
      
      
      
  </style>
</head>
<body>
 
<!--<div class="ui-widget">-->
<!--  <label for="tags">Tags: </label>-->
  <div class="input-area">
      <input id="tags" oninput="ajax(this.value)">
      <div class="result">
           </div>
      </div>
      


<div class="below"></div>

 
<!--</div>-->
 
 
<script>
    
//    out.println("<div class=\"result-item\">");
//            out.println("<div class=\"result-image\"> <img src=\""+b.getImage()+"\" alt=\"alt\"/></div>");
//            out.println(" <div class=\"result-title\">"+b.getBookName()+"</div>");
//            out.println(" </div>");
    var menuId = $( "ul.nav" ).first().attr( "id" );
function ajax(text){
    text = text.trim();
    if(text==""){
        console.log("text is null");
        return ;
    }
    $.ajax({
  url: "/2_SWPonlineLibrary/test",
  method: "POST",
  data: { id : text },
  //  dataType: "html"

})
 
.done(function( msg ) {
  //$( "#log" ).html( msg );

  $(".result").html(msg);
});
 
//request.fail(function( jqXHR, textStatus ) {
//  alert( "Request failed: " + textStatus );
//});
    }
</script>
</body>
</html>