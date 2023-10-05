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
        background-color: rgb(88, 87, 87);
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


        /* Add padding to containers */
        .container {
        padding: 100px 300px;
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
        .cancel-btn {
            width: 100%;
        }
        }

        #loginTitle{
          padding-top: 100px;
          display : flex;
          align-items: center;
          justify-content: center;
        }

        .login-searchmenu  > div{
          float: left;
          padding : 0px 20px;
        }
        
        .login-searchmenu{
          display : flex;
          align-items: center;
          justify-content: center;
        }

    </style>

</head>
<body>

    <form action="yrlogin.me" method="post">
    	<input type="hidden" name="buy" value="<%= buy %>">

      <h1 id="loginTitle"><b>로그인</b></h1>
      <div class="container">
          <h4>
          <b>
            반갑습니다. <br>
            오늘도 맛있는 식사하세요.
          </b>
          </h4>
          <!-- <label for="uname"><b>아이디</b></label> -->
          <input type="text" placeholder="아이디" name="memberId" required>
      
          <!-- <label for="psw"><b>비밀번호</b></label> -->
          <input type="password" placeholder="비밀번호" name="memberPwd" required>
      
          <button type="submit">로그인</button>
          <!-- 
          <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
          </label>
           -->
        </div>
        
        <div class="login-searchmenu">
          <!-- <button type="button" class="cancel-btn">Cancel</button> -->
          <div class="psw">회원가입 <a href="#"></a></div>
          <div class="psw">아이디 찾기 <a href="#"></a></div>
          <div class="psw">비밀번호 찾기 <a href="#"></a></div>
        </div>
      </form>

  </body>
</html>