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
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/stylelogin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <title>HAPPY HOME</title>
</head>
<body>    

    <div class="auth">        
        <div id="wrapper" class="log_in">

            <form action="sign" id="form-login">
                <h1 class="form-heading">Đăng ký</h1>
                
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" name="username" class="form-input" placeholder="Tên đăng nhập">
                </div>
                <div class="form-group">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" name="email" class="form-input" placeholder="Email">
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" name="password" class="form-input" placeholder="Mật khẩu">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" name="repassword" class="form-input" placeholder="Nhập lại mật khẩu">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <input type="submit" value="Tiếp theo" class="form-submit">
                <h6 style="color: red;text-align: center;margin-top: 15px;">${error}</h6>
                <div class="myheadwrapper__btn">
                    <a href="login.jsp" >Đăng nhập</a>
                </div>
            </form>
        </div>
        
    </div>
    
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/mycode.js"></script>
</html>