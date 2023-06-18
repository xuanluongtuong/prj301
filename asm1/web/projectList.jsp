<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"  rel="stylesheet" />
        <link rel="stylesheet" href="css/stylelist.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>HAPPY HOME</title>        

        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete this Project?")) {
                    window.location = "projectdelete?id=" + id;
                }
            }
        </script>

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
            <div class="mylist">
                <div class="mycontent">
                    <div class="myhead_title_table">
                        <h4> Project </h4><br/>
                        <a href="projectadd"><i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Project</a>
                    </div>


                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">


                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Customer Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Project ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Project Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Address
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Budget
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Start Date
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <%  List<Project> list = (ArrayList<Project>)request.getAttribute("pro");
                                for (Project p : list) {                                
                            %>
                            <tr class="border-b border-gray-50 dark:border-gray-800">
                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%=p.getTenKH()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=p.getMaDA()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=p.getTenDA()%>
                                </td>                                

                                <td class="px-6 py-4">
                                    <%=p.getDiaDiem()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=p.getNganSach()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=p.getNgayThiCong()%>
                                </td>                                

                                <td class="px-6 py-4">
                                    <%if(p.getTrangThai()==1){
                                    %>
                                    Hoàn thành
                                    <%}else if(p.getTrangThai()==0){%> Đã hủy
                                    <%} else{%> Đang thi công <%}%>
                                </td>
                                <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                    <a href="projectedit?id=<%=p.getMaDA()%>" class="myedit" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                        Edit</a>

                                    <a href="#" onclick="doDelete('<%=p.getMaDA()%>')" class="mydelete" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-trash"></i>
                                        Delete</a>

                                </td>                                
                            </tr>  
                            <%} %>                          
                            </tbody>
                        </table>

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
                © 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->

    </body>
</html>
