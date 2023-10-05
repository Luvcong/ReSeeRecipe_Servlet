<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    h2{
        text-align: center;
    }
   
    .form-control{
        width : 300px;
    }

</style>  
</head>
<body>
    <br><br>
    <h2>회원 정보 수정</h2>
    <br><br>
    <div class="container">
        <form class="form" action="/hlupdateMember.ma">
            
            <label for="memberNo">회원번호</label>
            <input type="text" class="form-control" id="memberNo"  readonly>
            <br>
            <label for="memberName">회원이름</label>
            <input type="password" class="form-control"  id="memberName">
            <br>
            <label for="memberId">회원아이디</label>
            <input type="password" class="form-control"  id="memberId"  readonly>
            <br>
            <label for="memberNickname">회원닉네임</label>
            <input type="password" class="form-control"  id="memberNickname">
            <br>
            <label for="memberEmail">이메일</label>
            <input type="password" class="form-control"  id="memberEmail">
            <br>
            <label for="memberEnrolldate">가입일자</label>
            <input type="password" class="form-control"  id="memberEnrolldate"  readonly>
            <br>
            <label for="membergradeName">회원등급명</label>
            <input type="password" class="form-control"  id="membergradeName"  readonly>
            <br><br><br>
            <button type="submit" class="btn btn-warning">수정하기</button>
            <button type="submit" class="btn btn-warning">돌아가기</button>
        </form>
    </div>  
</body>
</html>