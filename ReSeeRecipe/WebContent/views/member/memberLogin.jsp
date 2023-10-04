<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buy = (String)request.getAttribute("buy");
%>
<!-- 임시용_230928 yr -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Bordered form */
        form {
        border: 3px solid #f1f1f1;
        }

        /* Full-width inputs */
        input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
        background-color: #04AA6D;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        }

        /* Add a hover effect for buttons */
        button:hover {
        opacity: 0.8;
        }

        /* Extra style for the cancel button (red) */
        .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
        }

        /* Center the avatar image inside this container */
        .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        }

        /* Avatar image */
        img.avatar {
        width: 40%;
        border-radius: 50%;
        }

        /* Add padding to containers */
        .container {
        padding: 16px;
        }

        /* The "Forgot password" text */
        span.psw {
        float: right;
        padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
        }
    </style>

</head>
<body>

    <form action="yrlogin.me" method="post">
    	<input type="hidden" name="buy" value="<%= buy %>">
        <div class="imgcontainer">
          <img src="img_avatar2.png" alt="Avatar" class="avatar">
        </div>
      
        <div class="container">
          <label for="uname"><b>아이디</b></label>
          <input type="text" placeholder="Enter Username" name="memberId" required>
      
          <label for="psw"><b>비밀번호</b></label>
          <input type="password" placeholder="Enter Password" name="memberPwd" required>
      
          <button type="submit">Login</button>
          <!-- 
          <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
          </label>
           -->
        </div>
      
        <div class="container" style="background-color:#f1f1f1">
          <button type="button" class="cancelbtn">Cancel</button>
          <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
      </form>

</body>
</html>