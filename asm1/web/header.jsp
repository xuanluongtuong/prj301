<%-- 
    Document   : header
    Created on : Jun 29, 2023, 12:01:24 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String s=(String)session.getAttribute("role");
            if(s!=null){
                if(!s.equals("admin") && !s.equals("user") && !s.equals("manager")){
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
                    <li><a href="assignment">Assignment</a></li>
                    <li><a href="project">Project</a></li>                    
                    <li><a href="resource">Resource</a></li>
                    <li><a href="customer">Customer</a></li>
                    <li><a href="#"><i class="fa-solid fa-magnifying-glass" style="margin-right: 5px;"></i>Search</a></li>
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
    </body>
</html>
