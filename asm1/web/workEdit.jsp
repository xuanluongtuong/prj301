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
        <link rel="stylesheet" href="css/styleadd.css?v=51">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>LTX Manager</title>  

        <style>
            .form-group {
                display: grid;
            }
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 10px;
            }



            @media (min-width: 900px) {
                .form-container {
                    flex-direction: row;
                }
                .form-left,
                .form-right {
                    align-items: flex-start;
                }
            }
        </style>
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
                <form action="workedit" method="post" style="display: inline; justify-content: center;">
                    <div>
                        <h4 style="min-width: 300px;margin: 20px 0 5px 20px; color: purple;"> <%=request.getAttribute("tenpb")%> </h4>
                    </div>
                    <div class="form-container">
                        <div class="form-left">
                            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Employee ID
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Employee Name
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Employee Status
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  List<Employee> list = (ArrayList<Employee>)request.getAttribute("list");
                                        if(list!=null)
                                        for (Employee e : list) {                                
                                    %>
                                    <tr class="border-b border-gray-50 dark:border-gray-800">
                                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                            <%=e.getMaNV()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%=e.getHoVaTen()%>
                                        </td> 
                                        <td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                            <%=e.getStatus()%>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                            <div style="margin-bottom:20px">
                                <c:set var="page" value="${requestScope.page}"/>
                                <div class="pagination" style="justify-content: center;">
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <a id="page-${i}" class="page-link" href="workadd?page=${i}&mapb=${mapb}">${i}</a>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                        <div class="form-right">
                            <div class="form-group">
                                <label class="form-label" >Project ID</label>
                                <input type="hidden" name="mapb" value="${mapb}"/>
                                <input type="hidden" name="id" value="${id}"/>
                                <input type="hidden" name="idpc" value="${idpc}"/>
                                <input class="form-input" type="text" id="TENKH" name="mada" value="<%=request.getAttribute("mada")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Project Name</label>
                                <input class="form-input" type="text" id="TENKH" name="tenda" value="<%=request.getAttribute("tenda")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Employee ID</label>
                                <input class="form-input" type="text" id="DCKH" name="manv" value="${manv}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Task Name</label>
                                <input class="form-input" type="tel" id="SDTKH" name="ten" value="${ten}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Status</label>
                                <select class="form-input" name="status" required>
                                    <option value="2" <%= request.getAttribute("status").equals(2) ? "selected" : "" %>>Chưa hoàn thành</option>
                                    <option value="1" <%= request.getAttribute("status").equals(1) ? "selected" : "" %>>Hoàn thành</option>
                                    <option value="0" <%= request.getAttribute("status").equals(0) ? "selected" : "" %>>Đã hủy</option>
                                </select>
                            </div>
                            <div class="form-button" style="display: flex; justify-content: left;">
                                <button class="btn-submit" type="submit">Submit</button>
                            </div>

                        </div>
                    </div>

                </form>
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
