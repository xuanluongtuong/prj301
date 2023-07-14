<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="DAL.*"%>
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
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }

            .form-container {
                background-color: #fff;
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            }

            .form-container h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-button {
                text-align: center;
                margin-top: 20px;
            }

            .form-button button {
                padding: 10px 20px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .form-button button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu">
            <div class="mylist">                

                <form action="reportadd" method="post">

                    <div class="form-group">
                        <label for="macv">Task ID</label>
                        <input type="text" id="macv" name="macv" value="${macv}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="macv">Task Name</label>
                        <input type="text" name="tencv" value="${tencv}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="ten">Report Name</label>
                        <input type="text" id="ten" name="ten" required>
                    </div>

                    <div class="form-group">
                        <label for="noidung">Title</label>
                        <input type="text" id="noidung" name="noidung" required>
                    </div>
                    <div class="form-group">
                        <label for="chitiet">Detail</label>
                        <textarea id="chitiet" name="chitiet" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="img">Image</label>
                        <input type="text" id="img" name="img" required>
                    </div>
                    <div class="form-button">
                        <button type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- menu -->

        <%@include file="footer.jsp"%>

    </body>
</html>
