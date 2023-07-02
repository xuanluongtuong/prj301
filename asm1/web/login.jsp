<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/stylelogin.css?v=51">
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

        <title>Log in</title>
    </head>
    <body>
        <div class="mybackgound">
            <div id="wrapper">
                <form action="login" method="post" id="form-login">
                    <h1 class="form-heading">Log in</h1>
                    <div class="form-group">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="text" class="form-input" name="email" value="${cookie.email.value}" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <i class="fas fa-key"></i>
                        <input type="password" class="form-input" name="Password" value="${cookie.password.value}" placeholder="Password">
                        <div id="eye">
                            <i class="far fa-eye"></i>
                        </div>
                    </div>
                    <div>
                        <div style="display: flex; align-items: center;justify-content: space-between;">
                            <label class="control control--checkbox mb-0"><span class="caption" style="color: white;">Remember me</span>
                                <input type="checkbox" name="remember" ${(cookie.email != null ? "checked" : "")}></input>
                                <div class="control__indicator"></div>
                            </label>
                            <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                        </div>
                    </div>
                    <input type="submit" value="Log in" class="form-submit">
                    
                    <h3 style="color: red; text-align: center;">${error}</h3>
                </form>
            </div>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/mycode.js"></script>
</html>