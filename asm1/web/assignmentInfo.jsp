<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

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

        <script>
            function doDelete(id, mada) {
                if (confirm("Are you sure to delete this Assignment?")) {
                    window.location = "assignmentdelete?id=" + id + "&mada=" + mada;
                }
            }
        </script>

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
            <div style="width: 100%; display: flex;justify-content: right;margin:10px 30px;">

                <c:if test="${sessionScope.role=='admin'}">
                    <a href="assignmentadd?mada=<%=request.getAttribute("mada")%>" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 60px;font-size: 20px;">
                        <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Assignment
                    </a>
                </c:if>
            </div>
            <div class="mylist">
                <c:set var="p" value="${project}"></c:set>
                <c:if test="${p==null}">
                    <c:set var="p" value="${sessionScope.projectinfo}"></c:set>
                </c:if>


                <div class="mycontent">

                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">

                        <div class="project_img">

                            <img id="projectImage" src="${p.getUrlImg()}" alt="alt" />                     

                        </div>
                        <div class="project_content">
                            <div>
                                <div class="project_content_title">
                                    <h3>
                                        Project Information(Thông tin dự án)
                                    </h3>
                                </div>
                                <div>
                                    Customer: ${p.getTenkh()}
                                </div>

                                <div>
                                    Project ID: ${p.getMaDA()}
                                </div>

                                <div>
                                    Project name: ${p.getTenDA()}
                                </div>

                                <div>
                                    Address: ${p.getDiaDiem()}
                                </div>

                                <div>
                                    Budget: ${p.getNganSach()}
                                </div>

                                <div>
                                    Start Date: ${p.getNgayThiCong()}
                                </div>

                                <div>
                                    Status: 
                                    <c:if test="${p.getTrangThai()==1}">

                                        <span style="color: rgb(24, 202, 0);font-weight: 600;">
                                            Hoàn thành
                                        </span>
                                    </c:if>
                                    <c:if test="${p.getTrangThai()==0}">
                                        <span style="color: rgb(174, 0, 81);font-weight: 600;">
                                            Đã hủy
                                        </span>
                                    </c:if>
                                    <c:if test="${p.getTrangThai()!=1 && p.getTrangThai()!=0}">
                                        <span style="color: rgb(0, 145, 155);font-weight: 600;">
                                            Đang thi công
                                        </span>
                                    </c:if>
                                </div>
                            </div>


                        </div>

                    </div>

                    <c:if test="${p.getTrangThai()!=1 && p.getTrangThai()!=0}">

                        <div style="margin: 20px 0 0 0;">  
                            <c:set var="list" value="${list}"></c:set>
                            <c:if test="${list.size()==0}">

                                <div >
                                    <h4 style="color: #ad00ad;">This project have been assigned by no Department yet</h4>                                    
                                </div>

                            </c:if>

                            <c:if test="${list.size()!=0}">


                                <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">

                                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                        <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                            <tr>
                                                <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                                    Department ID
                                                </th>
                                                <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                                    Department Name
                                                </th>
                                                <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                                    Assignment Name
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
                                            <c:forEach items="${list}" var="a">

                                                <tr class="border-b border-gray-50 dark:border-gray-800">
                                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                                        ${a.getMapb()}
                                                    </td>
                                                    <td class="px-6 py-4">
                                                        ${a.getTenpb()}
                                                    </td>
                                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                                        ${a.getTen()}
                                                    </td>
                                                    <td class="px-6 py-4">
                                                        ${a.getStart()}
                                                    </td>
                                                    <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                                        ${a.getEnd()}
                                                    </td>
                                                    <td class="px-6 py-4">
                                                        <c:if test="${a.getTrangThai()==1}">

                                                            <div style="color: rgb(24, 202, 0);font-weight: 600;">
                                                                Hoàn thành
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${a.getTrangThai()==0}">
                                                            <div style="color: rgb(174, 0, 81);font-weight: 600;">
                                                                Đã hủy
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${a.getTrangThai()!=0 && a.getTrangThai()!=1}">
                                                            <div style="color: rgb(0, 145, 155);font-weight: 600;">
                                                                Chưa hoàn thành
                                                            </div>
                                                        </c:if>
                                                    </td>

                                                    <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   

                                                        <a href="assignmentedit?id=${a.getId()}&mada=${a.getMada()}" class="myedit" style="display: flex;align-items: center;">
                                                            <i class="fa-solid fa-pen-to-square"></i>
                                                            Edit
                                                        </a>
                                                        <c:if test="${sessionScope.role == 'admin'}">
                                                            <a href="#" onclick="doDelete('${a.getId()}', '${a.getMada()}')" class="mydelete" style="display: flex;align-items: center;">
                                                                <i class="fa-solid fa-trash"></i>
                                                                Delete
                                                            </a>
                                                        </c:if>
                                                        <a href="work?idpc=${a.getId()}&mapb=${a.getMapb()}&mada=${a.getMada()}" class="mystatus" style="display: flex;align-items: center;">
                                                            <i class="fa-solid fa-user"></i>
                                                            Watch Task</a>
                                                    </td>  

                                                </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </c:if>                               
                        </div>

                    </c:if>
                </div>

            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
</html>
