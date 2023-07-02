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

        <title>Sign up</title>
    </head>
    <body>
        <div class="mybackgound">
            <div id="wrapper">
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
                    
                    <input type="submit" value="Sign up" class="form-submit">
                    
                    <h3 style="color: red; text-align: center;">${error}</h3>
                </form>

            </div>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/mycode.js"></script>
</html>