<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"  rel="stylesheet" />
        <link rel="stylesheet" href="css/styleadd.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>HAPPY HOME</title>  
        <style>
            .form-group {
                display: grid;
            }
             .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 10px;
            }



            @media (min-width: 900px) {
                .form-container {
                    flex-direction: row;
                }
                .form-left,
                .form-right {
                    align-items: flex-start;
                }
            }
        </style>
    </head>
    <body>
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

            <form action="out" method="post" style="background: white;">
                <input type="submit" value="Log out"/>
            </form>

        </div>
        <!--end header-->



        <nav>
            <div class="myhome">
                <img src="img/home1.png" alt="">
                <a href="home.jsp">Trang chủ</a>
            </div>
            <ul>              
                <li><a href="depart">Nhân viên</a></li>
                <li><a href="project">Dự án</a></li>
                <li><a href="finance">Tài chính</a></li>
                <li><a href="resource">Tài nguyên</a></li>
                <li><a href="customer">Khách hàng</a></li>
            </ul>
        </nav>


        <!-- menu -->
        <div class="mymenu">
            <div class="mylist">
                <% Employee em = (Employee)request.getAttribute("employee");
                %>
                <form action="editem" method="post">
                    <div class="form-container">
                        <div class="form-left">
                            <div class="form-group">
                                <label class="form-label" for="HO_VA_TEN">Full name</label>
                                <input type="hidden" name="MANV" value="<%=em.getMaNV()%>" required />
                                <input class="form-input" type="text" id="HOVATEN" name="HOVATEN" value="<%=em.getHoVaTen()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="TEN">Name</label>
                                <input class="form-input" type="text" id="TEN" name="TEN" value="<%=em.getTen()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label">Gender</label>
                                <div class="radio-group">
                                    
                                    <label>
                                        <input type="radio" name="PHAI" value="1" required <%if(em.getGt()==1){%>checked<%}%>/>                                        
                                        Nam
                                    </label>
                                    <label>
                                        <input type="radio" name="PHAI" value="0" required <%if(em.getGt()==0){%>checked<%}%>/>                                        
                                        Nữ
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYSINH">Date of birth</label>
                                <input class="form-input" type="date" id="NGAYSINH" name="NGAYSINH" value="<%=em.getNgaySinh()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="DIACHI">Address</label>
                                <input class="form-input" type="text" id="DIACHI" name="DIACHI" value="<%=em.getDiaChi()%>" required />
                            </div>
                        </div>
                        <div class="form-right">
                            <div class="form-group">
                                <label class="form-label" for="SDT">Phone number</label>
                                <input class="form-input" type="text" id="SDT" name="SDT" value="<%=em.getSDT()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="EMAIL">Email</label>
                                <input class="form-input" type="email" id="EMAIL" name="EMAIL" value="<%=em.getEmail()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="VITRI">Position</label>
                                <input class="form-input" type="text" id="VITRI" name="VITRI" value="<%=em.getViTri()%>" required />
                            </div>
                            <input  type="hidden"  name="MAQL"  value="<%=session.getAttribute("maql")%>"/>
                            <input  type="hidden"  name="PHONGBAN"  value="<%=session.getAttribute("tenPb")%>"/>
                            <input  type="hidden"  name="MAPB"  value="<%=session.getAttribute("mapb")%>"/>
                            <div class="form-group">
                                <label class="form-label" for="LUONG">Salary</label>
                                <input class="form-input" type="number" id="LUONG" name="LUONG" value="<%=em.getLuong()%>" required />
                            </div>
                            <div class="form-button">
                                <button class="btn-submit" type="submit">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
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
                © 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->

    </body>
</html>
