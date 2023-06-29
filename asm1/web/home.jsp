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
        <%@include file="header.jsp"%>

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
