<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <!--comment-->
    <head>
        <title>LTX Manager</title>        
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/styleDepartment.css?v=51">
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

            <!--            <div class="mycreate_action" style="display: flex;justify-content: right;">
                            <a href="departmentadd" style="text-decoration: none;margin: 5px 40px -5px 0;font-size: 20px;color: rgb(133, 0, 159);">
                                <i class="fa-solid fa-square-plus" style="margin-right: 5px;"></i>
                                Create Department
                            </a>
                        </div>-->

            <%ArrayList<Department> departments = (ArrayList<Department>)request.getAttribute("data");
            %>
            
            <ul class="mymenu_ul" >

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

        <%@include file="footer.jsp"%>

        <script src="js/mycode.js"></script>        
    </body>
</html>