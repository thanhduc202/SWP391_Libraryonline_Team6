<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>

    <body>
        <div class="page-holder">
            <!-- navbar-->

            <!--  Modal -->

            <div class="container">
                <!-- HERO SECTION-->
                <section class="py-5 bg-light">
                    <div class="container">

                    </div>
                </section>
                <section class="py-5">

                    <h2 class="h5 text-uppercase mb-4">List Book</h2>
                    <div class="row">
                        <div class="col-lg-8 mb-4 mb-lg-0">
                            <!-- CART TABLE-->
                            <div class="table-responsive mb-4">
                                <table class="table text-nowrap">
                                    <thead class="bg-light">
                                        <tr>
                                            <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Book</strong></th>   
                                            <!--<th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Status</strong></th>-->
                                            
                                    </tr>
                                    </thead>
                                    <tbody class="border-0">
                                        <c:if test="${sessionScope.bookWait.size() == 0}">
                                            <h2 class="h5 text-uppercase mb-4" style="color: red">Bookless</h2>
                                        </c:if>
                                        <c:forEach items="${sessionScope.bookWait}" var="b">
                                            <tr>
                                                <th class="ps-0 py-3 border-light" scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <a class="reset-anchor d-block animsition-link" href="detail.html"><img src="${b.image}" alt="..." width="70"/></a>
                                                    </div>
                                                </th>
                                                <th class="ps-0 py-3 border-light" scope="row">
                                                    <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" >${b.bookName}</a></strong></div>
                                                </th>
                                                <td class="p-3 align-middle border-light"><a class="reset-anchor" href="deleteWaitList?bookPurchase=${b.bookId}"><i class="fas fa-trash-alt small text-muted"></i></a></td>
                                                <td class="p-3 align-middle border-light"><a class="btn btn-outline-dark btn-sm" href="getOrder?id=${b.bookId}">Procceed to borrowing</a></td>
                                            </tr>
                                        </c:forEach> 
                                    </tbody>

                                </table>
                            </div>
                            <!-- CART NAV-->

                            <div class="row align-items-center ">
                                <div class="col-md-6 mb-3 mb-md-0 text-md-start"><a class="btn btn-link p-0 text-dark btn-sm" href="bookpage">View more book</a></div>                
                            </div>
                        </div>

                    </div>

                </section>

            </div>
        </div>
        <footer class="bg-dark text-white">
            <div class="container py-4">
                <div class="row py-5">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <h6 class="text-uppercase mb-3">Customer services</h6>
                        <ul class="list-unstyled mb-0">
                            <li><a class="footer-link" href="#!">Help &amp; Contact Us</a></li>
                            <li><a class="footer-link" href="#!">Returns &amp; Refunds</a></li>
                            <li><a class="footer-link" href="#!">Online Stores</a></li>
                            <li><a class="footer-link" href="#!">Terms &amp; Conditions</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <h6 class="text-uppercase mb-3">Company</h6>
                        <ul class="list-unstyled mb-0">
                            <li><a class="footer-link" href="#!">What We Do</a></li>
                            <li><a class="footer-link" href="#!">Available Services</a></li>
                            <li><a class="footer-link" href="#!">Latest Posts</a></li>
                            <li><a class="footer-link" href="#!">FAQs</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-uppercase mb-3">Social media</h6>
                        <ul class="list-unstyled mb-0">
                            <li><a class="footer-link" href="#!">Twitter</a></li>
                            <li><a class="footer-link" href="#!">Instagram</a></li>
                            <li><a class="footer-link" href="#!">Tumblr</a></li>
                            <li><a class="footer-link" href="#!">Pinterest</a></li>
                        </ul>
                    </div>
                </div>
                <div class="border-top pt-4" style="border-color: #1d1d1d !important">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start">
                            <p class="small text-muted mb-0">&copy; 2021 All rights reserved.</p>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <p class="small text-muted mb-0">Template designed by <a class="text-white reset-anchor" href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template">Bootstrapious</a></p>
                            <!-- If you want to remove the backlink, please purchase the Attribution-Free License. See details in readme.txt or license.txt. Thanks!-->
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- JavaScript files-->
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/glightbox/js/glightbox.min.js"></script>
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script src="vendor/swiper/swiper-bundle.min.js"></script>
        <script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
        <script src="js/front.js"></script>
        <script>
            // ------------------------------------------------------- //
            //   Inject SVG Sprite - 
            //   see more here 
            //   https://css-tricks.com/ajaxing-svg-sprite/
            // ------------------------------------------------------ //
            function injectSvgSprite(path) {

                var ajax = new XMLHttpRequest();
                ajax.open("GET", path, true);
                ajax.send();
                ajax.onload = function (e) {
                    var div = document.createElement("div");
                    div.className = 'd-none';
                    div.innerHTML = ajax.responseText;
                    document.body.insertBefore(div, document.body.childNodes[0]);
                }
            }
            // this is set to BootstrapTemple website as you cannot 
            // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
            // while using file:// protocol
            // pls don't forget to change to your domain :)
            injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

        </script>
        <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </div>
</body>
</html>