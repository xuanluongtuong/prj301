<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Report"%>
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
                if (confirm("Are you sure to delete Report? You have to add new Report.")) {
                    window.location = "reportdelete?id=" + id;
                }
            }
        </script>

    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu" style="background: linear-gradient(-135deg, #59ffff 0%, #cc7aff 100%);">            
            <div class="mylist">
                <%  Report r;
                    if(request.getAttribute("report")!=null){
                    r = (Report)request.getAttribute("report");
                %>
                <div style="margin: 10px;display: flex;">
                    <div style="width: 60%;">
                        <h5>Report ID: <%=r.getId()%></h5>
                        <h5>Report Name: <%=r.getTen()%></h5>
                        <h5>Task Name: <%=r.getTencv()%></h5>
                        <h5>Employee: <%=r.getTennv()%></h5>
                        <h5>Department: <%=r.getTenpb()%></h5>
                        <h5>Title: <%=r.getNoiDung()%></h5>
                        <h5>Report day: <%=r.getTime()%></h5>
                        <h5>Detail: </h5>
                        <p style="font-size: 20px; min-height: 200px; border: rgb(72, 72, 72) 1px solid;border-radius: 5px;margin: 0 10px 0 0;">
                            <%=r.getChiTiet()%>
                        </p>
                        <%if(s.equals("user")){%>
                        <div class="edit_form" style="margin:10px 0 0 10px ;">
                            <a href="reportedit?id=<%=r.getId()%>&macv=${macv}&idpc=${idpc}&mada=${mada}&mapb=${mapb}" class="myedit" style="color: rgb(0, 131, 91); display: flex;align-items: center;text-decoration: none">
                                <i class="fa-solid fa-pen-to-square"></i>
                                Edit</a>

<!--                    <a href="#" onclick="doDelete('<%=r.getId()%>')" class="mydelete" style="color: #ff0084;display: flex;align-items: center;text-decoration: none">
                        <i class="fa-solid fa-trash"></i>
                        Delete</a>-->
                        </div>
                        <%}%>
                    </div>
                    <div style="width: 40%;">
                        <img style="width: 100%;" src="<%=r.getImg()%>" alt="alt"/>
                    </div>                
                </div>


                <%}else{%>
                <div style="display: flex;align-items: center;justify-content: space-between;">
                    <div>
                        <h4 style="color: rgb(140, 0, 159); padding: 20px;">Have no report.</h4>
                    </div>                    
                </div>
                <%}%>
                <%if(s.equals("admin") || s.equals("manager")){%>
                <div style="margin: -50px 0 0 10px;">
                    <form action="duyetwork" method="get" >                                
                        <label class="form-label">Accept Report</label>
                        <input type="hidden" name="macv" value="${macv}"/>
                        <input type="hidden" name="idpc" value="${idpc}"/>
                        <input type="hidden" name="mada" value="${mada}"/>
                        <input type="hidden" name="mapb" value="${mapb}"/>
                        <div class="radio-group" >
                            <label>
                                <input type="radio" name="duyet" value="1" required checked/>                                        
                                Yes
                            </label>
                            <label>
                                <input type="radio" name="duyet" value="0" required />                                        
                                No
                            </label>
                            <label>
                                <input type="radio" name="duyet" value="2" required />                                        
                                wait
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <%}%>

            </div>
        </div>
    </div>
    <!-- menu -->

    <%@include file="footer.jsp"%>

</body>
</html>
