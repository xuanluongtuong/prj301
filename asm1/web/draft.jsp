<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Draft"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

            <h4 style="width: 300px;margin: 0 0px 0 30px; color: #8b00a3;"> Draft List </h4><br/>


            <%if(s!=null){
                    if(s.equals("admin")){%>
            <a href="draftadd" style="display:flex;align-items: center; text-decoration: none;color: rgb(129, 0, 185);margin: 0 35px 0px 0;font-size: 20px;">
                <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Draft</a>
                <%}}%>

        </div>

        <div class="mylist">
            <form action="searchdr" method="get" style="width: 320px;margin: 20px;">

                <div style="display: flex;">
                    <c:if test="${requestScope.search != null}">
                        <input type="search" name="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" value="${requestScope.search}" />
                    </c:if>
                    <c:if test="${requestScope.search == null}">
                        <input type="search" name="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                    </c:if>
                    <button type="submit" class="btn btn-outline-primary">search</button>

                </div>

            </form>
            <div class="mycontent"> 

                <div style="display: flex; justify-content: center;margin: 10px 0;">
                    <ul style="display: flex;flex-wrap: wrap;list-style: none;margin: 0;padding: 0;justify-content: space-evenly;">
                        <%  List<Draft> list = (ArrayList<Draft>)request.getAttribute("draftlist");
                            for (Draft d : list) {                                
                        %>
                        <li style="width: 320px;margin: 20px 15px; box-shadow: 2px 2px 2px 0.5px #66696b;border-radius: 4px;overflow: hidden;">
                            <img src="<%=d.getImg()%>" alt="Draft have not had image yet" style="width: 100%;height: 200px;">
                            <a href="draftinfo?ma=<%=d.getId()%>" style="color: black; text-decoration: none;font-size: 17px;">
                                <div style="height: 50px;padding: 0px 5px;"><%=d.getName()%></div>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
                    
                <div style="margin-bottom:20px">
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="justify-content: center;">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a id="page-${i}" class="page-link" href="draft?page=${i}">${i}</a>
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
