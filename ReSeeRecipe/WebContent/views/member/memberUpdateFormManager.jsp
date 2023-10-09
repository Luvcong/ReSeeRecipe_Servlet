<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
    
    #memUpdateWhyCon{
    	resize : none;
    	rows : 10;
    }

</style>  
</head>
<body>
<body>
	<%@ include file="../manager/navbar.jsp" %>
<div class="rs-content">
	<div class="rs-content">
    <br><br>
    <h2>회원 정보 수정</h2>
    <br><br>
    <div class="container">
        <form class="form" action="<%=contextPath %>/hlupdateMember.ma" method="post" id="member-updateForm">
            
            <label for="memberNo">회원번호</label>
            <input type="text" class="form-control" id="memberNo" name="memNo" value="<%=m.getMemNo() %>" readonly>
            <br>
            <label for="memberName">회원이름</label>
            <input type="text" class="form-control"  id="memberName" name="memName" value="<%=m.getMemName()%>" required>
            <br>
            <label for="memberId">회원아이디</label>
            <input type="text" class="form-control"  id="memberId"  name="memId" value="<%=m.getMemId()%>" readonly>
            <br>
            <label for="memberNickname">회원닉네임</label>
            <input type="text" class="form-control"  id="memberNickname" name="memNickname" value="<%=m.getMemNickname()%>" required>
            <br>
            <label for="memberEmail">이메일</label>
            <input type="email" class="form-control"  id="memberEmail" name="memEmail" value="<%=m.getMemEmail()%>" required>
            <br>
            <label for="memberEnrolldate">가입일자</label>
            <input type="text" class="form-control"  id="memberEnrolldate" name="memEnrolldate" value="<%=m.getEnrollDate()%>" readonly>
            <br>
            <lable for="memberModifydate">수정일자</lable>
            <input type="text" class="form-control" id="memberModifydate" name="memModifydate" value="<%=m.getModifyDate %>" readonly>
            <br>
            <label for="membergradeName">회원등급명</label>
            <input type="text" class="form-control"  id="membergradeName" name="memGradename" value="<%=m.getMemGradeName()%>" readonly>
            <br>
            <div id="memUpdateWhy">
            	<label for="memUpdateWhyCon">수정사유</label>
            	<textarea id="memUpdateWhyCon" name="memUpdateWhyCon" class="form-control"></textarea>
            </div>
            <br><br>
            <button type="submit" class="btn btn-warning">수정하기</button>
            <button type="button" class="btn btn-warning" onclick="history.back();">돌아가기</button>
        </form>
    </div> 
    </div>
</div> 
</body>
</html>