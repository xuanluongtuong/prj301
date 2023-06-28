<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Employee"%>
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
                <% Employee em = (Employee)request.getAttribute("employee");
                %>
                <form action="editem" method="post">
                    <div class="form-container">
                        <div class="form-left">
                            <div class="form-group">
                                <label class="form-label" for="HO_VA_TEN">Full name</label>
                                <input type="hidden" name="MANV" value="<%=em.getMaNV()%>" required />
                                <input class="form-input" type="text" id="HOVATEN" name="HOVATEN" value="<%=em.getHoVaTen()%>" required />
                            </div>

                            <div class="form-group" style="margin: 21px 0;">
                                <label class="form-label">Gender</label>
                                <div class="radio-group">

                                    <label>
                                        <input type="radio" name="PHAI" value="1" required <%if(em.getGt()==1){%>checked<%}%>/>                                        
                                        Nam
                                    </label>
                                    <label>
                                        <input type="radio" name="PHAI" value="0" required <%if(em.getGt()==0){%>checked<%}%>/>                                        
                                        Nữ
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYSINH">Date of birth</label>
                                <input class="form-input" type="date" id="NGAYSINH" name="NGAYSINH" value="<%=em.getNgaySinh()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="DIACHI">Address</label>
                                <input class="form-input" type="text" id="DIACHI" name="DIACHI" value="<%=em.getDiaChi()%>" required />
                            </div>
                        </div>
                        <div class="form-right">
                            <div class="form-group">
                                <label class="form-label" for="SDT">Phone number</label>
                                <input class="form-input" type="text" id="SDT" name="SDT" value="<%=em.getSDT()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="EMAIL">Email</label>
                                <input class="form-input" type="email" id="EMAIL" name="EMAIL" value="<%=em.getEmail()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="VITRI">Position</label>
                                <input class="form-input" type="text" id="VITRI" name="VITRI" value="<%=em.getViTri()%>" required />
                            </div>
                            <input  type="hidden"  name="MAQL"  value="<%=session.getAttribute("maql")%>"/>
                            <input  type="hidden"  name="PHONGBAN"  value="<%=session.getAttribute("tenPb")%>"/>
                            <input  type="hidden"  name="MAPB"  value="<%=session.getAttribute("mapb")%>"/>
                            <div class="form-group">
                                <label class="form-label" for="LUONG">Salary</label>
                                <input class="form-input" type="number" id="LUONG" name="LUONG" value="<%=em.getLuong()%>" required />
                            </div>

                        </div>
                    </div>
                    <div class="form-button">
                        <button class="btn-submit" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- menu -->

        <%@include file="footer.jsp"%>

    </body>
</html>
