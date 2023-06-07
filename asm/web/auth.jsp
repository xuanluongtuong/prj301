<%-- 
    Document   : login
    Created on : Jun 5, 2023, 1:24:55 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylelogin.css">
    
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <title>Happy Home</title>
</head>
<body>
    <div id="wrapper">
        <form action="login" id="form-login">
            <h1 class="form-heading">Đăng nhập</h1>
            <h4 style="color: red;text-align: center">${error}</h4>
            <div class="form-group">
                <i class="far fa-user"></i>
                <input type="text" name="username" class="form-input" placeholder="Tên đăng nhập">
            </div>
            <div class="form-group">
                <i class="fas fa-key"></i>
                <input type="password" name="password" class="form-input" placeholder="Mật khẩu">
                <div id="eye">
                    <i class="far fa-eye"></i>
                </div>
            </div>
            <input type="submit" value="Đăng nhập" class="form-submit">
        </form>
    </div>
    
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/mycode.js"></script>
</html>