<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  

<link rel="stylesheet" href="resources/css/member/searchMemberPwdForm.css">



</head>
<body>
	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>

    <!-- ajax로 처리 
    <form action="yrsearchMemberPwd.me" method="post">
	-->
      <h1 id="title"><b>비밀번호 찾기</b></h1>
      <div class="container">

          <input type="text" placeholder="아이디" name="memberId" required>
      
          <input type="text" placeholder="이메일" name="memberEmail" required>

          <!-- 인증코드 입력창 -->
          <input type="text" placeholder="인증코드 입력" name="certificationCode" required>
          <!-- <button type="submit">확인</button> -->
          <button type="button" onclick="searchMemberPwd();">확인</button>
          
          <div id="searchMemberPwd"> </div>

          <!-- 비밀번호 재설정 -->
          <div id="updateMemberPwd">
	          <input type="password" placeholder="비밀번호 재설정" name="memberPwd" maxlength="20" required>
            <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>
	          <input type="password" placeholder="비밀번호 재설정 확인" name="memberPwdCheck" maxlength="20" required>
            <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다.</label>
	      	  <button type="button" id="updatePwdBtn" onclick="updateMemberPwd();">비밀번호 재설정하기</button>
          </div>
	          <button type="button" onclick="location.href='<%= contextPath %>/yrloginForm.me'">로그인하러 가기</button>
        </div>
        
      <!-- </form> -->
      
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>

  <script src="resources/js/member/searchMemberPwdForm.js"></script>
  </body>
</html>