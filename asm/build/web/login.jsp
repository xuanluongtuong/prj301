<%-- 
    Document   : login
    Created on : Jun 5, 2023, 1:24:55 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <title>Trang Đăng Nhập</title>
    <meta charset="utf-8"> 
    <link rel="stylesheet" href="css/stylelogin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
   
</head>
<body>
  <div class="container">
    <h2>Đăng Nhập</h2>
    <form action="login">
      <div class="form-group">
        <label for="username">Tài khoản:</label>
        <input type="text" id="username" name="username"placeholder="Nhập tài khoản của bạn">
      </div>
      <div class="form-group">
        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn">
      </div>
      <div class="form-group">
        <button type="submit">Đăng Nhập</button>
      </div>
      <div class="form-group message">
        <!-- Hiển thị thông báo lỗi tại đây (nếu có) -->
      </div>
    </form>
  </div>
</body>
</html>
