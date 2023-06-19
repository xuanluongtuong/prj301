<%-- 
    Document   : loginModal
    Created on : Jun 2, 2023, 2:52:42 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/fonts/icomoon/style.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/owl.carousel.min.css">
        <!-- Style -->
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/loginModal.css"
            />
        <title>Login</title>
    </head>
    <body>



        <div class="auth">        
            <div id="wrapper" class="log_in" style="margin-top: 100px;">

                <form action="login" method="post" id="form-login">
                    <h1 class="form-heading">Đăng ký</h1>

                    <div class="form-group">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="text" name="email" class="form-input" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <i class="fas fa-key"></i>
                        <input type="password" name="Password" class="form-input" placeholder="Mật khẩu">
                        <div id="eye">
                            <i class="far fa-eye"></i>
                        </div>
                    </div>              
                    <input type="submit" value="Tiếp theo" class="form-submit">
                    <div class="d-flex mb-5 align-items-center" style="color: white;">
                        <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                            <input type="checkbox" name="remember" ${(cookie.email != null ? "checked" : "")}></input>
                            <div class="control__indicator"></div>
                        </label>
                        <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                    </div>
                    <h6 style="color: red;text-align: center;margin-top: 15px;">${error}</h6>                    
                    <div class="myheadwrapper__btn">
                        <a href="sign" >Đăng ký</a>
                    </div>
                </form>
            </div>

        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <script>
            function btnSubmit() {
                const href = window.location.href;
                const url = href.split("/");
                document.getElementsByName("url")[0].value = url[url.length - 1];
            }
        </script>

    </body>
</html>