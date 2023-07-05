<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/stylelogin.css?v=51">
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Log in</title>
    </head>
    <body style="background-color: #717674;">

        <div id="wrapper" class="row">
            <div class="wrapper-img col-md-5" id="wrapper-img" style="margin: 0;object-fit: cover;width: 621px">
                <img src="img/258888-P4JKHD-261.png" alt="">
            </div>
            <div class="col-md-5" id="wrapper-content" style="position: relative">
                <form action="login" method="post" id="form-login"> 
                    <h1 class="form-heading-title" style="position: absolute; top: 80px; left: 98px">Log in</h1>
                    <h2 class="form-heading-welcome">Nice to meet you</h2>
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
                            <label class="control control--checkbox mb-0"><span class="caption" style="color: black;">Remember me</span>
                                <input type="checkbox" name="remember" ${(cookie.email != null ? "checked" : "")}></input>
                                <div class="control__indicator"></div>
                            </label>
                            
                        </div>
                    </div>
                    <input type="submit" value="Log in" class="form-submit" style="border-radius: 30px">

                    <h5 style="color: purple; text-align: center;position: absolute;top: 450px;margin-left: -8px">${error}</h5>
                </form>
            </div>
        </div>


    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/mycode.js"></script>
</html>