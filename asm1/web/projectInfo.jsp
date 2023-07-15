<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
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
            function doDelete(id) {
                if (confirm("Are you sure to delete this Project?")) {
                    window.location = "projectdelete?id=" + id;
                }
            }
        </script>

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
            <div style="width: 100%; display: flex;justify-content: space-between;margin:10px 30px;">
                <%if(s!=null){
                    if(s.equals("admin")){%>
                <div><h4>Project</h4></div>
                <a href="projectadd" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 40px;font-size: 20px;"><i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>Add New Project</a>
                <%}}%>
            </div>
            <div class="mylist">
                <%  Project p = (Project)request.getAttribute("project");
                    if(p==null){
                        p = (Project)session.getAttribute("projectinfo");
                    }
                %>

                <div class="mycontent">

                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">



                        <div class="project_img">

                            <img id="projectImage" src="<%= p.getUrlImg()%>" alt="alt" />                     

                        </div>
                        <div class="project_content">

                            <div class="project_content_title">
                                <h3>
                                    Project Information(Thông tin dự án)
                                </h3>
                            </div>
                            <div>
                                Customer ID: <%=p.getMakh()%>
                            </div>
                            <div>
                                Customer: <%=p.getTenkh()%>
                            </div>

                            <div>
                                Project ID: <%=p.getMaDA()%>
                            </div>

                            <div>
                                Project name: <%=p.getTenDA()%>
                            </div>

                            <div>
                                Address: <%=p.getDiaDiem()%>
                            </div>

                            <div>
                                Budget: <%=p.getNganSach()%>
                            </div>

                            <div>
                                Start Date: <%=p.getNgayThiCong()%>
                            </div>

                            <div>
                                Status: 
                                <%if(p.getTrangThai()==1){%>
                                <span style="color: rgb(24, 202, 0);font-weight: 600;">
                                    Hoàn thành
                                </span>
                                <%}else if(p.getTrangThai()==0){%>
                                <span style="color: rgb(174, 0, 81);font-weight: 600;">
                                    Đã hủy
                                </span>
                                <%}else{%>
                                <span style="color: rgb(0, 145, 155);font-weight: 600;">
                                    Đang thi công
                                </span>
                                <%}%>
                            </div>

                            <%if(s!=null){
                            if(s.equals("admin")){%>
                            <div class="edit_form">
                                <a href="projectedit?id=<%=p.getMaDA()%>" class="myedit" style="color: rgb(0, 131, 91); display: flex;align-items: center;">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    Edit</a>

                                <a href="#" onclick="doDelete('<%=p.getMaDA()%>')" class="mydelete" style="color: #ff0084;display: flex;align-items: center;">
                                    <i class="fa-solid fa-trash"></i>
                                    Delete</a>
                            </div>
                            <%}}%>

                        </div>
                        <h1 style="color: red;">${mes}</h1>
                    </div>

                </div>   
            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
</html>
