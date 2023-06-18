<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <!--comment-->
    <head>
        <title>HAPPY HOME</title>        
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/styleDepartment.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
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
                <li><a href="depart">Employee</a></li>
                <li><a href="project">Project</a></li>
                <li><a href="finance">Finance</a></li>
                <li><a href="resource">Resource</a></li>
                <li><a href="customer">Customer</a></li>
            </ul>
        </nav>





        <!-- menu -->
        <div class="mymenu">
            
<!--            <div class="mycreate_action" style="display: flex;justify-content: right;">
                <a href="departmentadd" style="text-decoration: none;margin: 5px 40px -5px 0;font-size: 20px;color: rgb(133, 0, 159);">
                    <i class="fa-solid fa-square-plus" style="margin-right: 5px;"></i>
                    Create Department
                </a>
            </div>-->

            <%ArrayList<Department> departments = (ArrayList<Department>)request.getAttribute("data");
            %>

            <ul class="mymenu_ul">

                <% for (Department dp : departments) {
                %>
                <li>
                    <form action="employ" >                   
                    <input type="hidden" name="maPB" value="<%= dp.getMaPB() %>"> 
                    <input type="hidden" name="tenPB" value="<%= dp.getTenPB() %>"> 
                    <input type="hidden" name="maQL" value="<%= dp.getMaQL() %>">
                    <button class="mysub_menu">                        
                        <div class="mysub_menu_logo">
                            <img src="img/nhansu.png" alt="">
                        </div> 

                        <div class="mysub_menu_title"><%=dp.getTenPB()%></div>               
                    </button> 
                    </form>
                </li>
                <%}%>
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
                ï¿½ 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
        <script src="js/mycode.js"></script>        
    </body>
</html>