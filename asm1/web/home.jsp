<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<html>
    <!--comment-->
    <head>
        <title>LTX Manager</title>        
        <meta charset="utf-8"> 
        <link rel="stylesheet" href="css/stylehome.css?v=51">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>        
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body> 
        <style>
            body{
                position: relative;
            }
            .myheader{
                position: relative;
                width: 100%;
                background-image: url(https://media.zicxa.com/5852926);
                background-size: cover;
                color: white;
                font-size: 36px;
            }

            .mylogo img{
                background-color: black;
                position: relative;
                width: 100px;
                height: 40px;
                display: flex;
                z-index: 1;
                border: 4px solid #dec56c ;
            }

            .myslogan{
                width: 100%;
                position: relative;
                text-align: center;
                vertical-align: middle;
            }

            @media screen and (max-width: 890px) {
                .myslogan {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                }
            }

            .myshadow {
                font-size: 60px;
                text-align: center;
                color: white;
                font-family: 'Dancing Script', cursive;
                margin: 0px 0px 0px 0px;
                font-weight: 700;
                text-shadow: 1px 1px 0px #931400,
                    2px 2px 0px #efa032,
                    3px 3px 0px #46b59b,
                    4px 4px 0px #017e7f,
                    5px 5px 0px #052939,
                    6px 6px 0px #c11a2b;
            }


            @media screen and (max-width: 890px) {
                .myshadow {
                    width: 500px;
                }
            }



            .myhome{
                display: flex;
                background: linear-gradient(135deg, #1e57b3, #3573b0, #390867);
                align-items: center;
                padding: 2px 10px;
                border-radius: 5px 5px 5px 5px;
                margin-left: -5px;
            }

            .myhome a{
                color: white;
                text-decoration: none;
            }

            .myhome img{
                width: 30px;
                height: 30px;
                margin-bottom: 5px;
                margin-right: 5px;
            }


            nav {
                display: flex;
                background-color: #000000;
                padding: 5px;
                align-items: center;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                display: inline;
            }

            nav ul li a {
                color: #fbf7f7;
                padding: 10px;
                text-decoration: none;
            }

            nav ul li a:hover {
                /* background-color: #333; */
                color: #f1e871;
            }

            @media screen and (max-width: 890px) {
                nav #the_object, nav #the_logout {
                    display: none;
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
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
                    <%if(s!=null){
                        if(s.equals("admin")){%>
                    <a href="home.jsp">Home</a>
                    <%}else if(s.equals("manager")){%>
                    <a href="assignmentmanager?email=${email}">Home</a>
                    <%}else if(s.equals("user")){%>
                    <a href="workemployee?email=${email}">Home</a>
                    <%}}%>
                </div>
                <ul >
                    <%if(s!=null){
                        if(s.equals("admin")){%>

                    <li id="the_object"><a href="assignment">Assignment</a></li>
                        <%}}%>

                    <li id="the_object"><a href="project">Project</a></li>                    
                    <li id="the_object"><a href="resource">Resource</a></li>
                    <li id="the_object"><a href="customer">Customer</a></li>
                    <li id="the_object"><a href="depart">Employee</a></li>

                    <%if(s!=null){
                        if(s.equals("admin")){%>
                    <li id="the_object"><a href="signup">Sign up new</a></li>
                        <%}else{%>
                        
                    <li id="the_object"><a href="changepwd">Change Password</a></li>
                        <%}}%>
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

        <!-- menu -->
        <div class="mymenu">

            <ul class="mymenu_ul" style="margin-top: 25px;margin-bottom: 35px;">



                <a href="assignment">
                    <li class="mysub_menu">
                        <div class="mysub_menu_title">Assignment</div>
                        <div class="mysub_menu_logo">
                            <img src="img/work.png" alt="">
                        </div>                
                    </li> 
                </a>

                <a href="project">
                    <li class="mysub_menu">
                        <div class="mysub_menu_title">Project</div>
                        <div class="mysub_menu_logo">
                            <img src="img/duan.png" alt="">
                        </div>

                    </li>
                </a>


                <a href="resource">
                    <li class="mysub_menu sub_menu_tn">
                        <div class="mysub_menu_title">Resource</div>
                        <div class="mysub_menu_logo">
                            <img src="img/tainguyen1.png" alt="">
                        </div>

                    </li> 
                </a>

                <a href="customer">
                    <li class="mysub_menu">
                        <div class="mysub_menu_title">Customer</div>
                        <div class="mysub_menu_logo">
                            <img src="img/khachhang2.png" alt="">
                        </div>

                    </li>
                </a>
                <a href="depart">
                    <li class="mysub_menu">
                        <div class="mysub_menu_title">Employee</div>
                        <div class="mysub_menu_logo">
                            <img src="img/nhansu.png" alt="">
                        </div>                
                    </li> 
                </a>

            </ul>

        </div>
        <!-- menu -->

        <%@include file="footer.jsp"%>
        <script src="js/mycode.js"></script>        
    </body>
</html>
