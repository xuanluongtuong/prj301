<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Employee"%>
<%@page import="model.Department"%>
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
        <link rel="stylesheet" href="css/stylelist.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>LTX Manager</title>        
        <%
            List<Employee> list = new ArrayList<>();
                if(request.getAttribute("list") != null){
                    list = (ArrayList<Employee>) request.getAttribute("list");
                    
                }else{
                    list = (ArrayList<Employee>) session.getAttribute("list");
                }                                      
        %>
        <% Department depart;
                                
            if(request.getAttribute("department") != null){
            depart = (Department)request.getAttribute("department");

            }else{
                depart = (Department)session.getAttribute("department");
            }
        %>
        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    window.location = "deleteem?id=" + id;
                }
            }
        </script>

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu">
            <div style="width: 100%; display: flex;justify-content: right;margin-top: 10px;">                

                <div style="display: flex;justify-content: right;">
                    <%if(s!=null){
                    if(s.equals("admin")){%>
                    <a href="addem?mapb=<%=depart.getMaPB()%>" style="text-decoration: none;margin: 0px 45px 0px 0;font-size: 20px;color: rgb(133, 0, 159);">
                        <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>
                        Create Employee
                    </a>
                    <%}}%>
                </div>

            </div>
            <div class="mylist">                

                <div class="myhead_title_table" style="margin-bottom: 25px;">
                    <div style="color: rgb(0, 148, 156);"><h3 style="margin-left: 30px;">Department:</h3>
                        <div style="margin-left: 70px;">

                            Department Name: <%=depart.getTenPB()%></br>                            
                            Address: <%=depart.getDiaDiem()%></br>

                        </div>
                    </div>                    
                </div>



                <div class="mycontent">
                    <div style="display: flex;align-items: center;justify-content: space-between;">
                        <form action="searche" method="get" style="width: 320px;margin: 20px;">

                            <div style="display: flex;">

                                <input type="search" name="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" value="${search}" />
                                <input type="hidden" name="mapb" value="<%=depart.getMaPB()%>" />                                

                                <button type="submit" class="btn btn-outline-primary">search</button>

                            </div>

                        </form>

                        <div style="margin: 0 20px 0 0;">
                            <form action="employ">
                                <select name="maPB" class="form-select" aria-label="Default select example" onchange="redirect(this)">
                                    <option value="1" <%=depart.getMaPB() == 1 ? "selected" : ""%>>Phòng quản lý dự án</option>
                                    <option value="2" <%=depart.getMaPB() == 2 ? "selected" : ""%>>Phòng thiết kế</option>
                                    <option value="3" <%=depart.getMaPB() == 3 ? "selected" : ""%>>Phòng kỹ thuật</option>
                                    <option value="4" <%=depart.getMaPB() == 4 ? "selected" : ""%>>Phòng tài chính</option>
                                    <option value="5" <%=depart.getMaPB() == 5 ? "selected" : ""%>>Phòng kinh doanh</option>
                                    <option value="6" <%=depart.getMaPB() == 6 ? "selected" : ""%>>Phòng hành chính</option>
                                </select>
                            </form>
                            <script>
                                function redirect(select) {
                                    var value = select.value;
                                    if (value === "1") {
                                        window.location.href = "employ?maPB=1";
                                    } else if (value === "2") {
                                        window.location.href = "employ?maPB=2";
                                    } else if (value === "3") {
                                        window.location.href = "employ?maPB=3";
                                    } else if (value === "4") {
                                        window.location.href = "employ?maPB=4";
                                    } else if (value === "5") {
                                        window.location.href = "employ?maPB=5";
                                    } else if (value === "6") {
                                        window.location.href = "employ?maPB=6";
                                    }
                                }
                            </script>
                        </div>
                    </div>                    

                    <% if(list.size() >= 1){ %>

                    <% if(list.size() >1){%>

                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg" style="margin: 5px;">


                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-3 py-3 bg-gray-200 dark:bg-gray-800" >
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Full name
                                    </th>

                                    <th scope="col" class="px-2 py-3 bg-gray-200 dark:bg-gray-800">
                                        Gender
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Date of birth
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Address
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Phone Number
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Email
                                    </th>
                                    <th scope="col" class="px-2 py-3 bg-gray-200 dark:bg-gray-800" >
                                        Manager ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Department
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                        Position
                                    </th>

                                    <th scope="col" class="px-1 py-3 bg-gray-200 dark:bg-gray-800">
                                        Salary<br>
                                        (milions Dong)
                                    </th>
                                    <%if(s!=null){
                                        if(s.equals("admin")){%>
                                    <th scope="col" class="px-6 py-3 bg-blue-200 dark:bg-blue-800">
                                        Action
                                    </th>
                                    <%}}%>
                                </tr>
                            </thead>
                            <% for (Employee nv : list) {
                                
                            %>
                            <tr class="border-b border-gray-50 dark:border-gray-800">
                                <td scope="row" class="px-3 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                    <%=nv.getMaNV()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getHoVaTen()%>
                                </td>

                                <td class="px-3 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%if(nv.getGt()==1){
                                    %>
                                    Nam
                                    <%}else{%>Nữ
                                    <%}%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getNgaySinh()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getDiaChi()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getSDT()%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getEmail()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%if(nv.getMaNV() != nv.getMaql()){%>
                                    <%=nv.getMaql()%>
                                    <%}else{%>
                                    
                                    <%}%>
                                </td>
                                <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getPhongBan()%>
                                </td>
                                <td class="px-6 py-4">
                                    <%=nv.getViTri()%>
                                </td>                                

                                <td class="px-3 py-4 bg-gray-50 dark:bg-gray-800">
                                    <%=nv.getLuong()%>
                                </td>
                                <%if(s!=null){
                                    if(s.equals("admin")){%>
                                <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   
                                    <%if(nv.getMaNV() != nv.getMaql()){%>
                                    <a href="changeposanddepart?id=<%=nv.getMaNV()%>" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-arrows-rotate"></i>
                                        Change
                                    </a>
                                    <%}%>
                                    <%if(nv.getMaNV() == nv.getMaql()){%>
                                    <a href="changemanager?id=<%=nv.getMaql()%>" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-arrows-rotate"></i>
                                        Change
                                    </a>
                                    <%}%>
                                    <a href="editem?id=<%=nv.getMaNV()%>" class="myedit" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                        Edit</a>

                                    <%if(nv.getMaNV() != nv.getMaql()){%>
                                    <a href="#" onclick="doDelete('<%=nv.getMaNV()%>')" class="mydelete" style="display: flex;align-items: center;">
                                        <i class="fa-solid fa-trash"></i>
                                        Delete
                                    </a>
                                    <%}%>

                                </td>
                                <%}}%>
                            </tr>  
                            <% }%>                          
                            </tbody>
                        </table>

                    </div> 
                    <%}%>
                    <% }%>
                </div>
            </div>
        </div>
        <!-- menu -->

        <%@include file="footer.jsp"%>

    </body>
</html>
