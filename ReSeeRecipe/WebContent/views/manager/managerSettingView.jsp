<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member" %>
<%
    //Member loginMember = (Member)session.getAttribute("loginMember");
    Member m = (Member)request.getAttribute("m");
	Member mp = (Member)request.getAttribute("mp");   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 설정</title>
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
    
    #HL_adminUpdateWhyCon{
    	resize : none;
    	rows : 10;
    }
</style>  


</head>
<body>
	<%@ include file="../manager/navbar.jsp" %>
<div class="rs-content">
    <div class="container">
    <br><br>
    <h2>관리자 정보 수정</h2>
    <form enctype="multipart/form-data" action="<%= contextPath %>/hladminupdate.ma" methods="post">
		 
        <label for="adminpic">프로필 사진</label>
        <div class="container">
            <% if(mp != null) { %> 
               <img src="<%= contextPath %>/<%= m.getMemPicture() %>" alt="프로필사진" id="adminprofileImg" width="150" height="150">
            <% } else { %>
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ77jbjsG1bGoS5Kn6gm83uk-iiWcuMLRzw&usqp=CAU" alt="프로필사진" id="admindefpic" width="150" height="150">
            <% } %>
            <input type="file" name="adminpic" id="adminpic">
        </div>  
        <label for="HL_adminNo">회원번호</label>
        <input type="text" class="form-control" id="HL_adminNo" name="adminNo" value="<%=m.getMemNo() %>" readonly> <br>
        
        <br>
        <label for="HL_adminName">회원이름</label>
        <input type="text" class="form-control" id="HL_adminName" name="adminName" value="<%=m.getMemName() %>" required>
        <br>
        <label for="HL_adminId">회원아이디</label>
        <input type="text" class="form-control" id="HL_adminId" name="adminId" value="<%=m.getMemId() %>" readonly>
        <br>
        <label for="HL_adminNickname">회원닉네임</label>
        <input type="text" class="form-control" id="HL_adminNickname" name="adminNickname" value="<%=m.getMemNickname() %>" required>
        <br>
        <label for="HL_adminEmail">이메일</label>
        <input type="email" class="form-control" id="HL_adminEmail" name="adminEmail" value="<%= m.getMemEmail() %>" required>
        <br>
        <label for="HL_adminEnrolldate">가입일자</label>
        <input type="text" class="form-control" id="HL_adminEnrolldate" name="adminEnrolldate" value="<%= m.getEnrollDate()%>" readonly>
        <br>
        <label for="HL_adminModifydate">수정일자</lable>
        <input type="text" class="form-control" id="HL_adminModifydate" name="adminModifydate" value="<%= m.getModifyDate() %>" readonly>
        <br>
        <div id="HL_adminUpdateWhy">
           	<label for="HL_adminUpdateWhyCon">수정사유</label>
           	<textarea id="HL_adminUpdateWhyCon" name="HL_adminUpdateWhyCon" class="form-control"></textarea>
        </div>
        <br><br>
        <button type="submit" class="btn btn-warning">수정하기</button>
        <button type="button" class="btn btn-warning" onclick="history.back();">돌아가기</button>
    </form>
    </div>
</div>
</body>
</html>