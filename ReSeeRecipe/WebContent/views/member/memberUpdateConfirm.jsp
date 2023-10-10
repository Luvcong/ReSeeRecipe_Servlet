<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>


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

    /* Add padding to containers */
    .container {
        padding: 100px 350px;
        background-color: lightgray;
    }

    #title{
        padding-top: 100px;
        display : flex;
        align-items: center;
        justify-content: center;
    }


    
</style>

</head>
<body>
    <!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>

    <div>
        <form action="yrmemberUpdateConfirm.me" mothod="post">
            <h1 id="title"><b>회원정보변경</b></h1>
            <div class="container">
            <input type="password" placeholder="비밀번호를 입력해 주세요." required>
            <button type="submit" location="<%= contextPath %>/memberUpdateConfirm.me">확인</button>
            </div>
        </form>
    </div>

    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>

</body>
</html>