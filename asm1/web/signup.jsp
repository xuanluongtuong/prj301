<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/stylesignup.css?v=51">
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Sign up</title>
    </head>
    <body style="background-color: #717674">
        <%String s=(String)session.getAttribute("role");
            if(s!=null){
                if(!s.equals("admin")){
                    response.sendRedirect("login.jsp");
                }
            }else{
                response.sendRedirect("login.jsp");
            }
        %>

        <div id="wrapper">
            <div class="wrapper-img col-md-5" id="wrapper-img" style="margin: 0;object-fit: cover;width: 621px">
                <img src="img/258888-P4JKHD-261.png" alt="">
            </div>
            <form action="signup" method="post" id="form-login">
                <h1 class="form-heading">Sign up</h1>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="name" placeholder="Account name">
                </div>
                <div class="form-group">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" class="form-input" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <i class="fa-solid fa-phone"></i>
                    <input type="text" class="form-input" name="phone" placeholder="Phone number">
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" name="password" placeholder="Enter password">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" name="repassword" placeholder="Re-Enter password">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>

                <input type="submit" value="Sign up" class="form-submit" style="border-radius: 30px">
                <div style="width: 100%;display: flex;justify-content: right;align-items: center;">
                    <a href="checkrole" style="text-decoration: none;text-align: center;padding: 3px;margin-top: 20px;color: black;">Back to Home</a>
                </div>
                <h5 style="color: purple; text-align: center;position: absolute;top: 600px;margin-left: 10px">${error}</h5>
            </form>

        </div>


    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/mycode.js"></script>
</html>