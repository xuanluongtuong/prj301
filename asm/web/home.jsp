<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <!--comment-->
    <head>
        <title>Kien Truc HAPPY HOME</title>        
        <meta charset="utf-8"> 
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome-free-6.4.0/fontawesome-free-6.4.0-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <%  
            String username = null;
            Cookie[] cookies = request.getCookies();
            if(cookies!=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("admin")){
                        username = cookie.getValue();                                
                    }
                }
            }
            if(username==null){
                response.sendRedirect("login.jsp");
            }
        %>

<!-- <<h1>hello user<%=username%></h1> -->

        <!--start header-->
        <div class="myheader">

            <div class="mylogo">
                <img src="https://mshgroup.vn/wp-content/uploads/2022/06/logo-happy-home-7.png" alt="">
            </div>

            <div class="myslogan">
                <h2 class="myshadow">Together we build a beautiful world</h2>
            </div>

        </div>
        <div class="mylogout">           

            <form action="out" method="post">
                <input type="submit" value="Log out"/>
            </form>

        </div>
        <!--end header-->



        <nav>
            <div class="myhome">
                <img src="img/home1.png" alt="">
                <a href="home.jsp">Home</a>
            </div>
            <ul>              
                <li><a href="#">Danh m?c 1</a></li>
                <li><a href="#">Danh m?c 2</a></li>
                <li><a href="#">Danh m?c 3</a></li>
            </ul>
        </nav>





        <!-- menu -->
        <div class="mymenu">


            <ul class="mymenu_ul">

                <li class="mysub_menu">
                    <div class="mysub_menu_title">Employee</div>
                    <div class="mysub_menu_logo">
                        <img src="img/nhansu.png" alt="">
                    </div>
                    <ul class="mynavbar ">
                        <li><a href="#">Search<li>
                        <li><a href="nhanvien">Employee List</a></li>                                                                                                        
                    </ul>
                </li> 
                <li class="mysub_menu">
                    <div class="mysub_menu_title">Project</div>
                    <div class="mysub_menu_logo">
                        <img src="img/duan.png" alt="">
                    </div>
                    <ul class="mynavbar ">
                        <li><a href="#">Nh� ? d�n d?ng</a></li>
                        <li><a href="#">V?n ph�ng-c?n h?</a></li>
                        <li><a href="#">Nh� cao t?ng</a></li>
                        <li><a href="#">C�ng tr�nh c�ng c?ng</a></li>
                    </ul>
                </li>

                <li class="mysub_menu">
                    <div class="mysub_menu_title">T�i ch�nh</div>
                    <div class="mysub_menu_logo">
                        <img src="img/taichinh.png" alt="">
                    </div>
                    <ul class="mynavbar ">
                        <li><a href="#">Ng�n qu?</a></li>
                        <li><a href="#">C�c kho?n thu</a></li>
                        <li><a href="#">C�c kho?n chi</a></li>
                        <li><a href="#">Qu?n l� n?</a></li>
                    </ul>
                </li> 

                <li class="mysub_menu sub_menu_tn">
                    <div class="mysub_menu_title">T�i nguy�n</div>
                    <div class="mysub_menu_logo">
                        <img src="img/tainguyen1.png" alt="">
                    </div>
                    <ul class="mynavbar">                                    
                        <li><a href="#">B?n v? ki?n tr�c</a></li>
                        <li><a href="#">B?n thi?t k?</a></li>
                        <li><a href="#">Nguy�n v?t li?u</a></li>
                        <li><a href="#">?? n?i th?t</a></li>
                    </ul>
                </li> 

                <li class="mysub_menu">
                    <div class="mysub_menu_title">Kh�ch h�ng</div>
                    <div class="mysub_menu_logo">
                        <img src="img/khachhang2.png" alt="">
                    </div>
                    <ul class="mynavbar ">                                    
                        <li><a href="#">Th�ng tin</a></li>
                    </ul>
                </li>
            </ul>

        </div>
        <!-- menu -->

        <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted">
            <!-- Section: Social media -->
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom" style="background-color: rgb(203, 203, 203);color: black;">
                <!-- Left -->
                <div class="d-flex me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>

                </div>
                <!-- Left -->

                <!-- Right -->
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>                
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
                <!-- Right -->
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="">
                <div class=" container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                <i class="fas fa-gem me-3"></i>Company name
                            </h6>
                            <p>
                                Here you can use rows and columns to organize your footer content. Lorem ipsum
                                dolor sit amet, consectetur adipisicing elit.
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Products
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Angular</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">React</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Vue</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Laravel</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Useful links
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Pricing</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Settings</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Orders</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Help</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                info@example.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                            <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="background-color: rgb(0, 0, 0);">
                � 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
        <script src="js/mycode.js"></script>        
    </body>
</html>
