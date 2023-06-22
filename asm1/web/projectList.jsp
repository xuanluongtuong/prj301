<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"  rel="stylesheet" />
        <link rel="stylesheet" href="css/stylelist.css?v=51">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>HAPPY HOME</title>        

        <style>
            
            .pagination {
                justify-content: center;
            }

            .page-link {
                color: blue; /* Màu mặc định cho các trang chưa được chọn */
            }

            .page-link.active {
                color: white; /* Màu cho trang đang được chọn */
                background: rgb(39, 122, 255);
            }
        </style>
    </style>
    <script>
        function doDelete(id) {
            if (confirm("Are you sure to delete this Project?")) {
                window.location = "projectdelete?id=" + id;
            }
        }
    </script>

</head>
<body>
    <%String s=(String)session.getAttribute("role");
        if(s!=null){
            if(!s.equals("admin") && !s.equals("user")){
                response.sendRedirect("login.jsp");
            }
        }else{
            response.sendRedirect("login.jsp");
        }
    %>
    <!--start header-->
    <div class="myheader" style="height: 12rem">

        <div class="mylogo">
            <img src="https://mshgroup.vn/wp-content/uploads/2022/06/logo-happy-home-7.png" alt="">
        </div>

        <div class="myslogan">
            <h2 class="myshadow">Together we build a beautiful world</h2>
        </div>

    </div>

    <!--end header-->



    <nav style="display: flex;justify-content: space-between;align-items: center;">
        <div style="display: flex;align-items: center;">
            <div class="myhome">
                <img src="img/home1.png" alt="">
                <a href="home.jsp">Home</a>
            </div>
            <ul>              
                <li><a href="depart">Employee</a></li>
                <li><a href="project">Project</a></li>                    
                <li><a href="resource">Resource</a></li>
                <li><a href="customer">Customer</a></li>
            </ul>
        </div>

        <div style="display: flex;justify-content: right;align-items: center;padding-bottom: 5px;">
            <i class="fa-solid fa-user" style="margin-right: 5px;color: white;">
            </i>
            <div style="color: white;"><%=session.getAttribute("name")%></div>
            <a href="logout" style="display:flex; align-items: center; text-decoration: none;color: white;">
                <div style="margin-right: 5px;">&nbsp;| Log out
                </div>
                <i class="fa-solid fa-arrow-right-from-bracket" style="margin: 5px 10px 0px 0;"></i>                
            </a>
        </div>

    </nav>


    <!-- menu -->
    <div class="mymenu" style=" background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div class="myhead_title_table" style="margin: 0px 0 0 10px;">
                <h4 style="width: 500px;color: #4e00d5;font-size: 30px;"> Project List </h4><br/>
            </div>
            <div style="display: flex;justify-content: right;margin-top: 10px;">
                <%if(s!=null){
                    if(s.equals("admin")){%>
                <a href="projectadd" style="display:flex;align-items: center; text-decoration: none;color: rgb(129, 0, 185);margin: 0 35px 0px 0;font-size: 20px;">
                    <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Project</a>
                    <%}}%>
            </div>
        </div>

        <div class="mylist">

            <div class="mycontent">                    


                <div style="display: flex; justify-content: center;margin: 10px 0;">
                    <ul style="display: flex;flex-wrap: wrap;list-style: none;margin: 0;padding: 0;justify-content: space-evenly;">
                        <%  List<Project> list = (ArrayList<Project>)request.getAttribute("prolist");
                            for (Project p : list) {                                
                        %>
                        <li style="width: 320px;margin: 20px 0; box-shadow: 2px 2px 2px 0.5px #66696b;border-radius: 4px;overflow: hidden;">
                            <img src="<%=p.getUrlImg()%>" alt="Project does not have image" style="width: 100%;height: 200px;">
                            <a href="projectinfo?mada=<%=p.getMaDA()%>" style="color: black; text-decoration: none;font-size: 17px;"><div style="height: 50px;padding: 0px 5px;"><%=p.getTenDA()%></div></a>
                        </li>
                        <%}%>
                    </ul>
                </div>
                <div style="margin-bottom:20px">
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="justify-content: center;">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a id="page-${i}" class="page-link" href="project?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
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
                    <i class="fab fa-linkedin"></i>
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
            <a class="text-reset fw-bold" href="#">Create by Tuong Xuan Luong</a>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->

</body>
<script>
    function showdropdown() {
        var a = document.getElementById('dropdown');
        if (a.style.display !== 'block') {
            a.style.display = 'block';

        } else {
            a.style.display = 'none';
        }
    }
    function menudown(id) {
        var b = document.getElementById(id);
        if (b.style.display !== 'block') {
            b.style.display = 'block';
        } else {
            b.style.display = 'none';
        }
    }
    document.addEventListener("DOMContentLoaded", function () {
        var currentPage = "${requestScope.page}";
        var pageLinks = document.getElementsByClassName("page-link");

        for (var i = 0; i < pageLinks.length; i++) {
            var pageLink = pageLinks[i];
            var pageNumber = pageLink.innerHTML;

            if (pageNumber === currentPage) {
                pageLink.classList.add("active");
            }
        }
    });
</script>
</html>
