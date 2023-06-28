<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.*"%>
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
        <title>LXT Manager</title>        

        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete this Assignment?")) {
                    window.location = "customerdelete?id=" + id;
                }
            }
        </script>
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
    </head>
    <body>
        
        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu">
            <div style="display: flex;justify-content: space-between; align-items: center; padding: 10px;">

                <h4 style="min-width: 300px;margin: 0 0 0 30px; color: purple;"> Assignment List </h4><br/>                        


                <%if(s!=null){
                    if(s.equals("admin")){%>
                <a href="customeradd" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 30px;font-size: 20px;"><i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Assignment</a>
                <%}}%>

            </div>

            <div class="mylist">

                <div class="mycontent">                    


                    <% List<Assignment> list = (ArrayList<Assignment>) request.getAttribute("customer");
                        if(list!=null){%>
                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">


                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Project ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Project Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Department ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Department Name
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Task Name
                                    </th>
                                    <%if(s!=null){
                                        if(s.equals("admin")){%>
                                    <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                        Action
                                    </th>
                                    <%}}%>
                                </tr>
                            </thead>
                            <tbody>
                                <%  
                                    for (Assignment a : list) {                                
                                %>
                                <tr class="border-b border-gray-50 dark:border-gray-800">
                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                        <%=a.getMada()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=a.getTenda()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=a.getMapb()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=a.getTenpb()%>
                                    </td>
                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                        <%=a.getTen()%>
                                    </td>
                                    <%if(s!=null){
                                        if(s.equals("admin")){%>
                                    <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                        <a href="customeredit?id=<%=a.getMada()%>" class="myedit" style="display: flex;align-items: center;">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            Edit</a>

                                        <a href="#" onclick="doDelete('<%=a.getMada()%>')" class="mydelete" style="display: flex;align-items: center;">
                                            <i class="fa-solid fa-trash"></i>
                                            Delete</a>

                                    </td>  
                                    <%}}%>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>

                    </div>
                    <%}else{%>
                    <h3 style="color: purple; margin-left: 20px;">There have been no Task yet.</h3>
                    <%}%>
                </div>
                <div style="margin-bottom:20px">
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="justify-content: center;">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a id="page-${i}" class="page-link" href="customer?page=${i}">${i}</a>
                        </c:forEach>
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
