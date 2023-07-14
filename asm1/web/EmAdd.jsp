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
                <form action="addem" method="post">
                    <div class="form-container">
                        <div class="form-left">
                            <div class="form-group">
                                <label class="form-label" for="HO_VA_TEN">Full name</label>
                                <input class="form-input" type="text" id="HOVATEN" name="HOVATEN" required />
                            </div>                            
                            <div class="form-group" style="margin: 21px 0;">
                                <label class="form-label">Gender</label>
                                <div class="radio-group">
                                    <label>
                                        <input type="radio" name="PHAI" value="1" required checked />
                                        Nam
                                    </label>
                                    <label>
                                        <input type="radio" name="PHAI" value="0" required />
                                        Nữ
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="NGAYSINH">Date of birth</label>
                                <input class="form-input" type="date" id="NGAYSINH" name="NGAYSINH" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="DIACHI">Address</label>
                                <input class="form-input" type="text" id="DIACHI" name="DIACHI" required />
                            </div>
                        </div>
                        <div class="form-right">
                            <div class="form-group">
                                <label class="form-label" for="SDT">Phone Number</label>
                                <input class="form-input" type="text" id="SDT" name="SDT" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="EMAIL">Email</label>
                                <input class="form-input" type="email" id="EMAIL" name="EMAIL" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="VITRI">Position</label>
                                <input class="form-input" type="text" id="VITRI" name="VITRI" required />
                            </div>                            
                            <input  type="hidden"  name="MAPB"  value="${mapb}"/>
                            <div class="form-group">
                                <label class="form-label" for="LUONG">Salary</label>
                                <input class="form-input" type="number" id="LUONG" name="LUONG" required />
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
