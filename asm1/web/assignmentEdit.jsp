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
                            <input  type="hidden"  name="id" value="${id}" />
                            <div class="form-group">
                                <label class="form-label" >Project ID</label>
                                <input class="form-input" type="text"  name="mada" value="${mada}" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Project Name</label>
                                <input class="form-input" type="text"  name="tenda" value="${tenda}" readonly/>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Department</label>
                                <input class="form-input" type="hidden"  name="mapb" value="${mapb}" />
                                <input class="form-input" type="text"  name="mapb" value="${tenpb}" readonly />
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Assignment Name</label>
                                <input class="form-input" type="tel"  name="ten" value="${ten}" required />
                            </div>

                        </div>
                        <div class="form-right">
                            
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
                                    <option value="2" <c:if test="${requestScope.status != 1 && requestScope.status != 0}">selected</c:if>>Chưa hoàn thành</option>
                                    <option value="1" <c:if test="${requestScope.status == 1}">selected</c:if>>Hoàn thành</option>
                                    <option value="0" <c:if test="${requestScope.status == 0}">selected</c:if>>Đã hủy</option>
                                </select>
                            </div>
                            <div class="form-button" style="display: flex; justify-content: center;margin: 42px 0 13px 0">
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
