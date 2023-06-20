<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Employee"%>
<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

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
        <%
            List<Employee> list = new ArrayList<>();
                if(session.getAttribute("list") != null){
                    list = (ArrayList<Employee>) session.getAttribute("list");
                    
                }
                                      
        %>
        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    window.location = "deleteem?id=" + id;
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

            <a href="logout" style="display:flex; align-items: center; text-decoration: none;color: white;">
                <div style="padding-bottom: 5px;margin-right: 5px;">Log out</div><i class="fa-solid fa-arrow-right-from-bracket" style="margin-right: 10px;"></i>                
            </a>

        </nav>


        <!-- menu -->
        <div class="mymenu">
            <div style="width: 100%; display: flex;justify-content: right;margin-top: 10px;">                
                
                <div style="display: flex;justify-content: right;">
                    <%if(s!=null){
                    if(s.equals("admin")){%>
                    <a href="addem" style="text-decoration: none;margin: 0px 45px 0px 0;font-size: 20px;color: rgb(133, 0, 159);">
                        <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>
                        Create Employee
                    </a>
                    <%}}%>
                </div>
                
            </div>
            <div class="mylist">  

                <div class="myhead_title_table" style="margin-bottom: 25px;">
                    <div style="color: rgb(0, 148, 156);"><h3 style="margin-left: 30px;">Department:</h3>
                        <div style="margin-left: 70px;">
                            <% Department depart = (Department)session.getAttribute("department"); %>
                            Department Name: <%=session.getAttribute("tenPb")%></br>                            
                            Address: <%=depart.getDiaDiem()%></br>
                        </div>
                    </div>                    
                </div>

                <div class="mycontent">
                    <%
                    Employee e = new Employee();
                    if(session.getAttribute("emql") != null){
                        e = (Employee)session.getAttribute("emql");  
                    }
                    %>

                    <% if(list.size() >= 1){ %>
                    <%if(e!=null){%>
                    <h5 style="color: rgb(0, 148, 156);margin-left: 20px;">Manager Employee: </h5>
                    <div class="relative overflow-x-auto shadow-md sm:rounded-lg" style="margin: 20px 10px 50px 10px;">



                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400" >

                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Full name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Gender
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Date of birth
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Address
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Phone Number
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Email
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Position
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Manager ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Salary<br>
                                        (milions Dong)
                                    </th>
                                    <%if(s!=null){
                                        if(s.equals("admin")){
                                        if(list.size() == 1){%>
                                    <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                        Action
                                    </th>
                                    <%}}}%>
                                </tr>
                            </thead>

                            <tbody>

                                <tr class="border-b border-gray-50 dark:border-gray-800">

                                <tr class="border-b border-gray-50 dark:border-gray-800">
                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                        <%=e.getMaNV()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=e.getHoVaTen()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=e.getTen()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%if(e.getGt()==1){
                                        %>
                                        Nam
                                        <%}else{%>Nữ
                                        <%}%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=e.getNgaySinh()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=e.getDiaChi()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=e.getSDT()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=e.getEmail()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=e.getViTri()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=e.getMaQL()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=e.getLuong()%>
                                    </td> 
                                    <%if(s!=null){
                                        if(s.equals("admin")){
                                        if(list.size() == 1){%>
                                    <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                        <a href="editem?id=<%=e.getMaNV()%>" class="myedit" style="display: flex;align-items: center;">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            Edit</a>

                                        <a href="#" onclick="doDelete('<%=e.getMaNV()%>')" class="mydelete" style="display: flex;align-items: center;">
                                            <i class="fa-solid fa-trash"></i>
                                            Delete</a>
                                    </td>
                                    <%}}}%>
                                </tr> 
                            </tbody>

                        </table>
                    </div>
                    <%}%>
                    <% if(list.size() >1){%>
                    <h5 style="color: rgb(0, 148, 156);margin-left: 20px;">Employee: </h5>
                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">


                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Full name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Gender
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Date of birth
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Address
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Phone Number
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Email
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Position
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Manager ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Salary<br>
                                        (milions Dong)
                                    </th>
                                    <%if(s!=null){
                                        if(s.equals("admin")){%>
                                    <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                        Action
                                    </th>
                                    <%}}%>
                                </tr>
                            </thead>
                            <% for (Employee nv : list) {
                                if(nv.getMaNV() != e.getMaNV()){
                            %>
                            <tr class="border-b border-gray-50 dark:border-gray-800">
                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%=nv.getMaNV()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getHoVaTen()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getTen()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%if(nv.getGt()==1){
                                    %>
                                    Nam
                                    <%}else{%>Nữ
                                    <%}%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getNgaySinh()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getDiaChi()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getSDT()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getEmail()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getViTri()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getMaQL()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getLuong()%>
                                </td>
                                <%if(s!=null){
                                    if(s.equals("admin")){%>
                                <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                    <a href="editem?id=<%=nv.getMaNV()%>" class="myedit" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                        Edit</a>

                                    <a href="#" onclick="doDelete('<%=nv.getMaNV()%>')" class="mydelete" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-trash"></i>
                                        Delete</a>

                                </td>
                                <%}}%>
                            </tr>  
                            <%} }%>                          
                            </tbody>
                        </table>
                        
                    </div> 
                    <%}%>
                    <% }else{ %>
                    <input type="hidden" name="TENPB" value="<%=session.getAttribute("tenPb")%>">

                    <div style="display: flex;align-items: center;justify-content: space-between;">
                        <div>
                            <h4 style="color: red; padding: 20px;">This department does not have any Employee.</h4>
                        </div>

                        <div style="padding-right: 40px;">
                            <button type="submit" style="width: 160px; height: 40px; border-radius: 10px; border: rgb(0, 135, 202) 3px solid; background: linear-gradient(135deg, #30CFD0 0%, #330867 100%);">
                                <a href="addem?id=<%=session.getAttribute("mapb")%>" style="text-align: center;color: white;text-decoration: none;">Add Manager</a>
                            </button>
                        </div>
                    </div>
                    <%}%>
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
