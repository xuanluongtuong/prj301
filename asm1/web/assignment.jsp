<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>LTX Manager</title>        

        <style>

            .pagination {
                justify-content: center;
            }

            .page-link {
                color: blue; /* Màu mặc định cho các trang chưa được chọn */
            }

            .page-link.active {
                color: white; /* Màu cho trang đang được chọn */
                background: rgb(39, 122, 255);
            }
        </style>
    </style>


</head>
<body>

    <%@include file="header.jsp"%>

    <!-- menu -->
    <div class="mymenu">
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px;">

            <h4 style="margin: 0 0px 0 30px; color: #8b00a3;">Building Project List </h4><br/>           

        </div>

        <div class="mylist">

            <div class="mycontent">                    


                <div style="display: flex; justify-content: center;margin: 10px 0;">
                    <ul style="display: flex;flex-wrap: wrap;list-style: none;margin: 0;padding: 0;justify-content: space-evenly;">
                        <c:forEach items="${list}" var="p">

                            <li style="width: 320px;margin: 20px 15px; box-shadow: 2px 2px 2px 0.5px #66696b;border-radius: 4px;overflow: hidden;">
                                <img src="${p.getUrlImg()}" alt="Project still not have image" style="width: 100%;height: 200px;">                            
                                <a href="assignmentinfo?mada=${p.getMaDA()}" style="color: black; text-decoration: none;font-size: 17px;">
                                    <div style="padding: 0 5px;">
                                        <div >
                                            ${p.getTenDA()}
                                        </div>
                                        <div>
                                            <div style="color: rgb(0, 145, 155);font-weight: 600;">
                                                Đang thi công
                                            </div>

                                        </div>
                                    </div>
                                </a>
                            </li>

                        </c:forEach>
                    </ul>
                </div>
                <div style="margin-bottom:20px">
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="justify-content: center;">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a id="page-${i}" class="page-link" href="assignment?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
<script>
    function showdropdown() {
        var a = document.getElementById('dropdown');
        if (a.style.display !== 'block') {
            a.style.display = 'block';

        } else {
            a.style.display = 'none';
        }
    }
    function menudown(id) {
        var b = document.getElementById(id);
        if (b.style.display !== 'block') {
            b.style.display = 'block';
        } else {
            b.style.display = 'none';
        }
    }
    document.addEventListener("DOMContentLoaded", function () {
        var currentPage = "${requestScope.page}";
        var pageLinks = document.getElementsByClassName("page-link");

        for (var i = 0; i < pageLinks.length; i++) {
            var pageLink = pageLinks[i];
            var pageNumber = pageLink.innerHTML;

            if (pageNumber === currentPage) {
                pageLink.classList.add("active");
            }
        }
    });
</script>
</html>
