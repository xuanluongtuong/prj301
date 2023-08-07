<%-- 
    Document   : header
    Created on : Jun 29, 2023, 12:01:24 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>LTX Manager</title>        
        <meta charset="utf-8"> 

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
                background-image: url(img/background.jpg);
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

            li#the_object a.active {
                color: rgb(79, 222, 254);
                font-weight: 600;
            }

            @media screen and (max-width: 890px) {
                nav #the_object, nav #the_logout {
                    display: none;
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>

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

        <c:set var="role" value="${sessionScope.role}"></c:set>

            <nav style="display: flex;justify-content: space-between;align-items: center;">
                <div style="display: flex;align-items: center;">

                    <div class="myhome">
                        <img src="img/home1.png" alt="">
                    <c:if test="${role=='admin'}" >
                        <a href="home.jsp">Home</a>
                    </c:if>
                    <c:if test="${role=='manager'}" >
                        <a href="assignmentmanager?email=${email}">Home</a>
                    </c:if>
                    <c:if test="${role=='user'}" >
                        <a href="workemployee?email=${email}">Home</a>
                    </c:if>
                </div>

                <ul>


                    <li id="the_object"><a id="assignment-link" href="assignment">Assignment</a></li>
                    <li id="the_object"><a id="project-link" href="project">Project</a></li>                    
                    <li id="the_object"><a id="resource-link" href="resource">Resource</a></li>
                    <li id="the_object"><a id="customer-link" href="customer">Customer</a></li>
                        <c:if test="${role=='admin'}" >

                        <li id="the_object"><a id="employ-link" href="employ">Employee</a></li>

                        <li id="the_object"><a href="signup">Sign up new</a></li>
                        </c:if>
                        <%--<c:if test="${role!='admin'}" >--%>
                        <li id="the_object"><a href="changepwd">Change Password</a></li>
                        <%--</c:if>--%>
                </ul>
                <script>

                    var currentUrl = window.location.href;


                    var linkList = document.getElementsByTagName("a");
                    for (var i = 0; i < linkList.length; i++) {
                        var link = linkList[i];
                        if (link.href === currentUrl) {
                            link.classList.add("active");
                            break;
                        }
                    }
                </script>
                <script>
                    // Lấy đường link (URL) hiện tại
                    var currentUrl = window.location.href;

                    if (currentUrl.indexOf("assignment") !== -1 || currentUrl.indexOf("work") !== -1) {
                        var customerLink = document.getElementById("assignment-link");
                        customerLink.classList.add("active");
                    }

                    if (currentUrl.indexOf("project") !== -1 || currentUrl.indexOf("searchp") !== -1) {
                        var customerLink = document.getElementById("project-link");
                        customerLink.classList.add("active");
                    }

                    if (currentUrl.indexOf("resource") !== -1 || currentUrl.indexOf("searchd") !== -1 || currentUrl.indexOf("design") !== -1 || currentUrl.indexOf("draft") !== -1) {
                        var customerLink = document.getElementById("resource-link");
                        customerLink.classList.add("active");
                    }

                    if (currentUrl.indexOf("customer") !== -1 || currentUrl.indexOf("searchc") !== -1) {
                        var customerLink = document.getElementById("customer-link");
                        customerLink.classList.add("active");
                    }
                    if (currentUrl.indexOf("employ") !== -1 || currentUrl.indexOf("searche") !== -1 || currentUrl.indexOf("depart") !== -1 || currentUrl.indexOf("manage") !== -1) {
                        var customerLink = document.getElementById("employ-link");
                        customerLink.classList.add("active");
                    }
                </script>
            </div>
            <div  style="display: flex;justify-content: right;align-items: center;padding-bottom: 5px;">
                <c:if test="${role!='admin'}" >
                    <a href="employinfo" style="display: flex; align-items: center; text-decoration: none;">
                        <i id="the_logout" class="fa-solid fa-user" style="margin-right: 5px;color: white;">
                        </i>
                        <div id="the_logout" style="color: white;"><%=session.getAttribute("name")%></div>
                    </a>
                </c:if>
                <c:if test="${role=='admin'}" >
                    <i id="the_logout" class="fa-solid fa-user" style="margin-right: 5px;color: white;">
                    </i>
                    <div id="the_logout" style="color: white;"><%=session.getAttribute("name")%></div>
                </c:if>
                <a href="logout" style="display:flex; align-items: center; text-decoration: none;color: white;">
                    <div id="the_logout" style="margin-right: 5px;">&nbsp;| Log out
                    </div>
                    <i class="fa-solid fa-arrow-right-from-bracket" style="margin: 5px 10px 0px 0;"></i>                
                </a>
            </div>

        </nav>

    </body>
</html>
