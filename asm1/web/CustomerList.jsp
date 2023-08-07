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
                if (confirm("Are you sure to delete this Customer?")) {
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

                <h4 style="min-width: 300px;margin: 0 0 0 30px; color: purple;"> Customer List </h4><br/>                        


                <%--<c:if test="${role=='admin'}" >--%>
                <a href="customeradd" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 30px;font-size: 20px;"><i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Customer</a>
                <%--</c:if>--%>

            </div>

            <div class="mylist">

                <div class="mycontent">                    

                    <form action="searchc" method="get" style="width: 320px;margin: 20px;">

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

                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">


                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Customer ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Customer Name
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
                                    <%--<c:if test="${role=='admin'}" >--%>
                                        <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                            Action
                                        </th>
                                    <%--</c:if>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${customer}" var="c">

                                    <tr class="border-b border-gray-50 dark:border-gray-800">
                                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">

                                            ${c.getMaKH()}
                                        </td>
                                        <td class="px-6 py-4">

                                            ${c.getTenKH()}
                                        </td>
                                        <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">

                                            ${c.getDCKH()}
                                        </td>
                                        <td class="px-6 py-4">

                                            ${c.getSDTKH()}
                                        </td>
                                        <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">

                                            ${c.getEmailKH()}
                                        </td>

                                        <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                            <a href="customeredit?id=${c.getMaKH()}" class="myedit" style="display: flex;align-items: center;">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                                Edit
                                            </a>
                                            <c:if test="${role=='admin'}" >
                                                <a href="#" onclick="doDelete('${c.getMaKH()}')" class="mydelete" style="display: flex;align-items: center;">
                                                    <i class="fa-solid fa-trash"></i>
                                                    Delete
                                                </a>
                                            </c:if>
                                        </td>  

                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>

                    </div>

                </div>
                <div style="margin:20px">
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
