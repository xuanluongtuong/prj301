<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/stylelogin.css">
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

        <title>Sign up</title>
    </head>
    <body>
        <div id="wrapper">
            <form action="" id="form-login">
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
                    <input type="password" class="form-input" name="password" placeholder="Re-Enter password">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <div class="d-flex mb-5 align-items-center" style="color: white;">
                    <label class="control control--checkbox mb-0"><span class="caption">I agree all statements in <a href="#!">Terms of service</a></span>
                        <input type="checkbox" name="checkbox" ></input>
                        <div class="control__indicator"></div>
                    </label>
                </div>
                <input type="submit" value="Sign up" class="form-submit">
                <div style="width: 100%;display: flex;justify-content: right;align-items: center;">
                    <a href="login" style="width: 60px;color: white;text-decoration: none;text-align: center;padding: 3px; border: white 1px solid;margin-top: 20px;">Log in</a>
                </div>
            </form>

        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/mycode.js"></script>
</html>