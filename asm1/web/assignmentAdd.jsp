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

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu">
            <div class="mylist">
                <form action="assignmentadd" method="post" style="display: inline; justify-content: center;">

                    <div class="form-container">
                        <div class="form-left">
                            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Department ID
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Department Name
                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${data}" var="d" >
                                        
                                        <tr class="border-b border-gray-50 dark:border-gray-800">
                                            <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                                ${d.getMaPB()}
                                            </td>
                                            <td class="px-6 py-4">
                                                ${d.getTenPB()}
                                            </td>                                        
                                        </tr>
                                        
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <div class="form-right">
                            <div class="form-group">
                                <label class="form-label" >Project ID</label>
                                <input class="form-input" type="text" id="TENKH" name="mada" value="<%=request.getAttribute("mada")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Project Name</label>
                                <input class="form-input" type="text" id="TENKH" name="tenda" value="<%=request.getAttribute("tenda")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Department</label>
                                <select class="form-input" name="mapb" required>
                                    <option value="1">Phòng quản lý dự án</option>
                                    <option value="2">Phòng thiết kế</option>
                                    <option value="3">Phòng kỹ thuật</option>
                                    <option value="4">Phòng tài chính</option>
                                    <option value="5">Phòng kinh doanh</option>
                                    <option value="6">Phòng hành chính</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Assignment Name</label>
                                <input class="form-input" type="tel" id="SDTKH" name="ten" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYTHICONG">Start Date</label>
                                <input class="form-input" type="date"  name="start" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYTHICONG">End Date</label>
                                <input class="form-input" type="date"  name="end" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Status</label>
                                <select class="form-input"  name="status" required>
                                    <option value="2">Chưa hoàn thành</option>
                                    <option value="1">Hoàn thành</option>
                                    <option value="0">Đã hủy</option>
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
</html>
