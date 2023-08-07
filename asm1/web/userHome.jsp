<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="DAL.*"%>
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


            <div class="mylist">

                <div class="mycontent">       
                    <c:set var="list" value="${list}"></c:set>

                        <h3 style="min-width: 300px;margin: 20px 0 0px 20px; color: rgb(0, 102, 142);">Your department: ${tenpb} </h3>

                    <c:if test="${list.size()==0}">

                        <h4 style="min-width: 300px;margin: 20px 0 10px 20px; color: purple;">You do not have any work now.</h4>

                    </c:if>

                    <c:if test="${list.size()!=0}">
                        <h4 style="min-width: 300px;margin: 20px 0 10px 20px; color: purple;">Your works list: </h4>
                        <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">


                            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Project ID
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Project Name (Click to see information of Project)
                                        </th>

                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Task
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Start Date
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            End Date
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Status
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${list}" var="w">

                                        <tr class="border-b border-gray-50 dark:border-gray-800">
                                            <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                                ${w.getMada()}
                                            </td>
                                            <td class="px-6 py-4">
                                                <a href="projectinfo?mada=${w.getMada()}" style="text-decoration: none;">${w.getTenda()}</a>                                        
                                            </td>

                                            <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                                ${w.getTen()}
                                            </td>
                                            <td class="px-6 py-4">
                                                ${w.getStart()}
                                            </td>
                                            <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                                ${w.getEnd()}
                                            </td>
                                            <td class="px-6 py-4">

                                                <!--Tien do cong viec-->

                                                <c:if test="${w.getTrangThai()==1}">

                                                    <div style="color: rgb(24, 202, 0);font-weight: 600;">
                                                        Hoàn thành
                                                    </div>
                                                </c:if>
                                                <c:if test="${w.getTrangThai()==1}">
                                                    <div style="color: rgb(174, 0, 81);font-weight: 600;">
                                                        Đã hủy
                                                    </div>
                                                </c:if>
                                                <c:if test="${w.getTrangThai()!=1 && w.getTrangThai()!=0}">
                                                    <div style="color: rgb(0, 145, 155);font-weight: 600;">
                                                        Chưa hoàn thành
                                                    </div>
                                                </c:if>

                                                <!--phe duyet bao cao cong viec-->
                                                <c:if test="${w.getDuyet()==1}">
                                                    <div style="color: rgb(24, 202, 0);font-weight: 600;">
                                                        Đạt yêu cầu
                                                    </div>
                                                </c:if>
                                                <c:if test="${w.getDuyet()==0}">
                                                    <div style="color: rgb(174, 0, 81);font-weight: 600;">
                                                        Chưa đạt yêu cầu
                                                    </div>
                                                </c:if>
                                                <c:if test="${w.getDuyet()!=1 && w.getDuyet()!=0}">
                                                    <div style="color: rgb(0, 145, 155);font-weight: 600;">
                                                        Chờ phê duyệt
                                                    </div>
                                                </c:if>                                       
                                            </td> 
                                            <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                                <a href="workedit?mada=${w.getMada()}&id=${w.getId()}&mapb=${w.getMapb()}&idpc=${w.getIdpc()}" class="myedit" style="display: flex;align-items: center;">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                    Edit
                                                </a> 

                                                <c:set var="r" value="${requestScope.rDAO.getReportByMacv(w.getId())}"></c:set>
                                                <c:if test="${r==null}">

                                                    <a href="reportadd?macv=${w.getId()}" class="mystatus" style="display: flex;align-items: center;">
                                                        <i class="fa-solid fa-file-pen"></i>
                                                        Submit Report
                                                    </a> 
                                                </c:if>
                                                <c:if test="${r!=null}">
                                                    <a href="report?macv=${w.getId()}&mada=${mada}&mapb=${mapb}&idpc=${idpc}" class="mystatus" style="display: flex;align-items: center;color: rgb(77, 0, 128);">
                                                        <i class="fa-solid fa-clipboard"></i>
                                                        Watch Report
                                                    </a>
                                                </c:if>
                                            </td> 
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </c:if>
                </div>
                <div style="margin:20px">
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="justify-content: center;">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a id="page-${i}" class="page-link" href="workemployee?page=${i}&email=${email}">${i}</a>
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
