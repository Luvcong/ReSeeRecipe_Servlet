<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buy = (String)request.getAttribute("buy");
%>
<!-- 초본_231005_yr -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

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

        #title{
          padding-top: 100px;
          display : flex;
          align-items: center;
          justify-content: center;
        }

        .enroll-checkbox > div{ 
          
        }

    </style>

</head>
  <body>
  	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>


    <form action="yrenroll.me" method="post">

      <h1 id="title"><b>회원가입</b></h1>
      <div class="container">

          <input type="text" placeholder="이름" name="memName" required>
          <input type="text" placeholder="닉네임(활동명)" name="memNicname" required>
          <input type="text" placeholder="아이디(중복불가)" name="memId" required>
          
          <input type="password" placeholder="비밀번호" name="memberPwd" required>
          <input type="password" placeholder="비밀번호" name="memberPwdCheck" required>
          
          <input type="text" placeholder="이메일" name="memEmail" required>
          
          <button type="submit">가입하기</button>

        </div>
        
        <div class="enroll-checkbox">
          <div><input type="checkbox" id="agreeAll"><label for="agreeAll">전체 동의</label></div>
          <input type="checkbox" id="agreeSite"><label for="agreeSite">사이트 이용약관 동의(필수)</label>
          <input type="checkbox" id="agreePerson"><label for="agreePerson">개인정보 수집 및 이용 동의(필수)</label>
        </div>
      </form>
      
    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>
      

  </body>
</html>