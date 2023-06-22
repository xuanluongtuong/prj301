<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

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
        <title>LXT Manager</title>        

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
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
            <div style="width: 100%; display: flex;justify-content: space-between;margin:10px 30px;">
                <%if(s!=null){
                    if(s.equals("admin")){%>
                <div><h4>Project</h4></div>
                <a href="projectadd" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 40px;font-size: 20px;"><i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Project</a>
                <%}}%>
            </div>
            <div class="mylist">

                <div class="mycontent">                    



                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">

                        <%  Project p = (Project)request.getAttribute("project");
                            if(p==null){
                                p = (Project)session.getAttribute("projectinfo");
                            }
                        %>

                        <div class="project_img">
                            <img src="<%=p.getUrlImg()%>" alt="alt" />
                        </div>
                        <div class="project_content">
                            <div class="project_content_title">
                                <h3>
                                    Project Information(Thông tin dự án)
                                </h3>
                            </div>
                            <div>
                                Customer: <%=p.getTenKH()%>
                            </div>

                            <div>
                                Project ID: <%=p.getMaDA()%>
                            </div>

                            <div>
                                Project name: <%=p.getTenDA()%>
                            </div>

                            <div>
                                Address: <%=p.getDiaDiem()%>
                            </div>

                            <div>
                                Budget: <%=p.getNganSach()%>
                            </div>

                            <div>
                                Start Date: <%=p.getNgayThiCong()%>
                            </div>

                            <div>
                                Status: 
                                <%if(p.getTrangThai()==1){
                                %>Hoàn thành

                                <%}else if(p.getTrangThai()==0){%> Đã hủy
                                <%} else{%> Đang thi công <%}%>
                            </div>

                        <%if(s!=null){
                            if(s.equals("admin")){%>
                            <div class="edit_form">
                                <a href="projectedit?id=<%=p.getMaDA()%>" class="myedit" style="color: rgb(0, 131, 91); display: flex;align-items: center;">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    Edit</a>

                                <a href="#" onclick="doDelete('<%=p.getMaDA()%>')" class="mydelete" style="color: #ff0084;display: flex;align-items: center;">
                                    <i class="fa-solid fa-trash"></i>
                                    Delete</a>
                            </div>
                        <%}}%>

                        </div>



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
</html>
