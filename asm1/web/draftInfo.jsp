<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Draft"%>
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
                if (confirm("Are you sure to delete this Draft?")) {
                    window.location = "draftdelete?id=" + id;
                }
            }
        </script>

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">
            <div style="width: 100%; display: flex;justify-content: space-between;margin:10px 30px;">
                <%--<c:if test="${sessionScope.role == 'admin'}">--%>
                <div><h4>Draft</h4></div>
                <a href="draftadd" style="text-decoration: none;color: rgb(173, 0, 185);margin-right: 40px;font-size: 20px;">
                    <i class="fa-solid fa-square-plus" style="padding-right: 5px;"></i>
                    Add New Draft
                </a>
                <%--</c:if>--%>
            </div>
            <div class="mylist">

                <div class="mycontent">                    



                    <div id="mytable" class="relative overflow-x-auto shadow-md sm:rounded-lg">

                        <c:set var="d" value="${info}"></c:set>
                        <c:if test="${d==null}" >
                            <c:set var="d" value="${sessionScope.designinfo}"></c:set>
                        </c:if> 

                        <div class="project_img">
                            <img src="${d.getImg()}" alt="alt" />
                        </div>
                        <div class="project_content">
                            <div class="project_content_title">
                                <h3>
                                    Draft Information
                                </h3>
                            </div>


                            <div>
                                Draft ID: ${d.getId()}
                            </div>

                            <div>
                                Draft name: ${d.getName()}
                            </div>
                            

                            <div class="edit_form">
                                <a href="draftedit?id=${d.getId()}" class="myedit" style="color: rgb(0, 131, 91); display: flex;align-items: center;">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    Edit
                                </a>
                                <c:if test="${sessionScope.role == 'admin'}">
                                    <a href="#" onclick="doDelete('${d.getId()}')" class="mydelete" style="color: #ff0084;display: flex;align-items: center;">
                                        <i class="fa-solid fa-trash"></i>
                                        Delete
                                    </a>
                                </c:if>
                            </div>

                        </div>

                    </div>

                </div>   
            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
</html>
