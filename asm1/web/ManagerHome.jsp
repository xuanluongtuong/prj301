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
        <style>
            body{
                position: relative;
            }
            .myheader{
                position: relative;
                width: 100%;
                background-image: url(https://media.zicxa.com/5852926);
                background-size: cover;
                color: white;
                font-size: 36px;
            }

            .mylogo img{
                background-color: black;
                position: relative;
                width: 100px;
                height: 40px;
                display: flex;
                z-index: 1;
                border: 4px solid #dec56c ;
            }

            .myslogan{
                width: 100%;
                position: relative;
                text-align: center;
                vertical-align: middle;
            }

            @media screen and (max-width: 890px) {
                .myslogan {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                }
            }

            .myshadow {
                font-size: 60px;
                text-align: center;
                color: white;
                font-family: 'Dancing Script', cursive;
                margin: 0px 0px 0px 0px;
                font-weight: 700;
                text-shadow: 1px 1px 0px #931400,
                    2px 2px 0px #efa032,
                    3px 3px 0px #46b59b,
                    4px 4px 0px #017e7f,
                    5px 5px 0px #052939,
                    6px 6px 0px #c11a2b;
            }


            @media screen and (max-width: 890px) {
                .myshadow {
                    width: 500px;
                }
            }



            .myhome{
                display: flex;
                background: linear-gradient(135deg, #1e57b3, #3573b0, #390867);
                align-items: center;
                padding: 2px 10px;
                border-radius: 5px 5px 5px 5px;
                margin-left: -5px;
            }

            .myhome a{
                color: white;
                text-decoration: none;
            }

            .myhome img{
                width: 30px;
                height: 30px;
                margin-bottom: 5px;
                margin-right: 5px;
            }


            nav {
                display: flex;
                background-color: #000000;
                padding: 5px;
                align-items: center;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                display: inline;
            }

            nav ul li a {
                color: #fbf7f7;
                padding: 10px;
                text-decoration: none;
            }

            nav ul li a:hover {
                /* background-color: #333; */
                color: #f1e871;
            }

            @media screen and (max-width: 890px) {
                nav #the_object, nav #the_logout {
                    display: none;
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>
    <body>

        <%String s=(String)session.getAttribute("role");
            if(s!=null){
                if(!s.equals("admin") && !s.equals("user") && !s.equals("manager")){
                    response.sendRedirect("login.jsp");
                }
            }else{
                response.sendRedirect("login.jsp");
            }
        %>
        <!--start header-->
        <div class="myheader" style="height: 12rem">

            <div class="mylogo">
                <img src="https://mshgroup.vn/wp-content/uploads/2022/06/logo-happy-home-7.png" alt="">
            </div>

            <div class="myslogan">
                <h1 class="myshadow">Smart management, shaping the future</h1>
            </div>

        </div>

        <!--end header-->



        <nav style="display: flex;justify-content: space-between;align-items: center;">
            <div style="display: flex;align-items: center;">
                <div class="myhome">
                    
                    <img src="img/home1.png" alt="">                    
                    <a href="assignmentmanager?email=<%=session.getAttribute("email")%>">Home</a>
                    
                </div>
                <ul >
                    <%if(s!=null){
                        if(s.equals("admin")){%>

                    <li id="the_object"><a href="assignment">Assignment</a></li>
                        <%}}%>
                    <li id="the_object"><a href="depart">Employee</a></li>
                    <li id="the_object"><a href="project">Project</a></li>                    
                    <li id="the_object"><a href="resource">Resource</a></li>
                    <li id="the_object"><a href="customer">Customer</a></li>
                    <li id="the_object"><a href="changepwd">Change Password</a></li>
                    <li><a href="#"><i class="fa-solid fa-magnifying-glass" style="margin-right: 5px;"></i>Search</a></li>
                </ul>
            </div>
            <div  style="display: flex;justify-content: right;align-items: center;padding-bottom: 5px;">
                <i id="the_logout" class="fa-solid fa-user" style="margin-right: 5px;color: white;">
                </i>
                <div id="the_logout" style="color: white;"><%=session.getAttribute("name")%></div>
                <a href="logout" style="display:flex; align-items: center; text-decoration: none;color: white;">
                    <div id="the_logout" style="margin-right: 5px;">&nbsp;| Log out
                    </div>
                    <i class="fa-solid fa-arrow-right-from-bracket" style="margin: 5px 10px 0px 0;"></i>                
                </a>
            </div>

        </nav>

        <!-- menu -->
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
            
            <div class="mylist">                

                <div class="mycontent">

                    <div style="margin: 20px 0 0 0;">  
                        <%  List<Assignment> list = (ArrayList<Assignment>) request.getAttribute("list");%>
                        
                        <%if(list.size()==0){%>
                        <div >
                            <h4 style="color: #ad00ad;">Your Department have no Assignment</h4>                                    
                        </div>
                        <%}%>                                
                        <%if(list.size()>0){%>

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
                                            Project ID
                                        </th>
                                        <th scope="col" class="px-6 py-3 bg-gray-200 dark:bg-gray-800">
                                            Project Name
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

                                    <%for (Assignment a : list) {                                
                                    %>
                                    <tr class="border-b border-gray-50 dark:border-gray-800">
                                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                            <%=a.getMapb()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%=a.getTenpb()%>
                                        </td>
                                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                                            <%=a.getMada()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%=a.getTenda()%>
                                        </td>
                                        <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                            <%=a.getTen()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%=a.getStart()%>
                                        </td>
                                        <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                                            <%=a.getEnd()%>
                                        </td>
                                        <td class="px-6 py-4">
                                            <%if(a.getTrangThai()==1){%>
                                            <div style="color: rgb(24, 202, 0);font-weight: 600;">
                                                Hoàn thành
                                            </div>
                                            <%}else if(a.getTrangThai()==0){%>
                                            <div style="color: rgb(174, 0, 81);font-weight: 600;">
                                                Đã hủy
                                            </div>
                                            <%}else{%>
                                            <div style="color: rgb(0, 145, 155);font-weight: 600;">
                                                Chưa hoàn thành
                                            </div>
                                            <%}%>
                                        </td>
                                        <%if(s!=null){
                                        if(s.equals("admin") || s.equals("manager")){%>
                                        <td class="px-6 py-4 bg-blue-100 dark:bg-blue-800" id="myaction">   
                                            <%if(s.equals("admin")){%>
                                            <a href="assignmentedit?id=<%=a.getId()%>&mada=<%=request.getAttribute("mada")%>"" class="myedit" style="display: flex;align-items: center;">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                                Edit</a>
                                            
                                            <a href="#" onclick="doDelete('<%=a.getId()%>', '<%=a.getMada()%>')" class="mydelete" style="display: flex;align-items: center;">
                                                <i class="fa-solid fa-trash"></i>
                                                Delete</a>
                                            <%}%>
                                            <a href="work?idpc=<%=a.getId()%>&mapb=<%=a.getMapb()%>&mada=<%=a.getMada()%>" class="mystatus" style="display: flex;align-items: center;">
                                                <i class="fa-solid fa-user"></i>
                                                Watch Task</a>
                                        </td>  
                                        <%}}%>
                                        <%}%>
                                </tbody>
                            </table>

                        </div>
                        <%}%>                                
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
</html>
