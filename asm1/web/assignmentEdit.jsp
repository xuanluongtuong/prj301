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
                <form action="assignmentedit" method="post" style="display: inline; justify-content: center;">

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
                                    <%  List<Department> list = (ArrayList<Department>)request.getAttribute("data");
                                        if(list!=null)
                                        for (Department d : list) {                                
                                    %>
                                    <tr class="border-b border-gray-50 dark:border-gray-800">
                                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                            <%=d.getMaPB()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%=d.getTenPB()%>
                                        </td>                                        
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>

                        </div>
                        <div class="form-right">
                            <input  type="hidden"  name="id" value="${id}" />
                            <div class="form-group">
                                <label class="form-label" >Project ID</label>
                                <input class="form-input" type="text"  name="mada" value="<%=request.getAttribute("mada")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Project Name</label>
                                <input class="form-input" type="text"  name="tenda" value="<%=request.getAttribute("tenda")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Department ID</label>
                                <input class="form-input" type="text"  name="mapb" value="${mapb}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Assignment Name</label>
                                <input class="form-input" type="tel"  name="ten" value="${ten}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYTHICONG">Start Date</label>
                                <input class="form-input" type="date"  name="start" value="${start}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYTHICONG">End Date</label>
                                <input class="form-input" type="date"  name="end" value="${end}" required />
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
</html>
