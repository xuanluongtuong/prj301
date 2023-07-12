<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.*"%>
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
                <form action="customeredit" method="post" style="display: inline; justify-content: center;">
                    <div class="form-container">
                        <div class="form-left">
                            <div class="form-group">
                                <label class="form-label" for="TENKH">Customer Name</label>
                                <input type="hidden" name="MAKH" value="${cus.getMaKH()}"/>
                                <input class="form-input" type="text" id="TENKH" name="TENKH" value="${cus.getTenKH()}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="DCKH">Address</label>
                                <input class="form-input" type="text" id="DCKH" name="DCKH" value="${cus.getDCKH()}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="SDTKH">Phone Number</label>
                                <input class="form-input" type="tel" id="SDTKH" name="SDTKH" value="${cus.getSDTKH()}" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="EMAILKH">Email</label>
                                <input class="form-input" type="email" id="EMAILKH" name="EMAILKH" value="${cus.getEmailKH()}" required />
                            </div>
                        </div>
                        <div class="form-right">
                            <div class="form-button" style="display: flex; justify-content: left">
                                <button class="btn-submit" type="submit" style="margin: 30px 0 0 0;">Submit</button>
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
