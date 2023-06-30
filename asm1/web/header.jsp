<%-- 
    Document   : header
    Created on : Jun 29, 2023, 12:01:24 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LTX Manager</title>        
        <meta charset="utf-8"> 
        <link rel="stylesheet" href="css/stylehome.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>        
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                <h1 class="myshadow">Smart management, shaping the future</h1>
            </div>

        </div>

        <!--end header-->



        <nav style="display: flex;justify-content: space-between;align-items: center;">
            <div style="display: flex;align-items: center;">
                <div class="myhome">
                    <img src="img/home1.png" alt="">
                    <a href="home.jsp">Home</a>
                </div>
                <ul >              
                    <li id="the_object"><a href="depart">Employee</a></li>
                    <li id="the_object"><a href="assignment">Assignment</a></li>
                    <li id="the_object"><a href="project">Project</a></li>                    
                    <li id="the_object"><a href="resource">Resource</a></li>
                    <li id="the_object"><a href="customer">Customer</a></li>
                    <li><a href="#"><i class="fa-solid fa-magnifying-glass" style="margin-right: 5px;"></i>Search</a></li>
                </ul>
            </div>
            <div  style="display: flex;justify-content: right;align-items: center;padding-bottom: 5px;">
                <i id="the_logout" class="fa-solid fa-user" style="margin-right: 5px;color: white;">
                </i>
                <div id="the_logout" style="color: white;"><%=session.getAttribute("name")%></div>
                <a href="logout" style="display:flex; align-items: center; text-decoration: none;color: white;">
                    <div id="the_logout" style="margin-right: 5px;">&nbsp;| Log out
                    </div>
                    <i class="fa-solid fa-arrow-right-from-bracket" style="margin: 5px 10px 0px 0;"></i>                
                </a>
            </div>

        </nav>
    </body>
</html>
