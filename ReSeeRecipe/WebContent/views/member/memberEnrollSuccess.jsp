<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 초본_231006_yr -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        button {
            background-color: rgb(88, 87, 87);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        div{
            box-sizing : border-box;
            border : none;
        }

        .container {
            padding: 100px 250px;
        }

        .success{
            border : none;
            display : flex;
            align-items: center;
            justify-content: center;
        }
    </style>

</head>
<body>

    <!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>

    <div class="container">
        <div class="success">
            <h1>회원가입이 완료되었습니다.</h1>
        </div>
        <div class="success">
            <button type="button" class="btn btn-secondary">로그인하러 가기</button>
        </div>
    </div>


    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

</body>
</html>