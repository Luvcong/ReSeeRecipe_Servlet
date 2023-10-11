<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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
    input[type=text] {
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
    }

    /* The "Forgot password" text */
    span.psw {
    float: right;
    padding-top: 16px;
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

    <!-- ajax로 처리할 것 
    <form action="yrsearchMemberId.me" method="post">
	   -->
      <h1 id="title"><b>아이디 찾기</b></h1>
      <div class="container">

          <input type="text" placeholder="이름" name="memberName" required>
      
          <input type="text" placeholder="이메일" name="memberEmail" required>

          <!-- 인증코드 입력창 -->
          <input type="text" placeholder="인증코드 입력" name="certificationCode" required>
          <!-- <button type="submit">확인</button> -->

          <button type="button" onclick="searchMemberId();">확인</button>

          <div id="searchMemberId">
           	 당신의 아이디는 <br>
            	 입니다.
          </div>
      
          <button type="button" onclick="location.href='<%= contextPath %>/yrloginForm.me'">로그인하러 가기</button>

        </div>
        
      <!-- </form> -->
      
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>
	
	<script>
	// 아이디 찾기 ajax
	const $memberName = $('input[name=memberName]');
	const $memberEmail = $('input[name=memberEmail]');
	
    function searchMemberId(){
    	console.log($memberName);
    	console.log($memberEmail);
      $.ajax({
    	  url : 'yrsearchMemberId.me',
    	  data : {memberName : $memberName.val(),
    		  	  memberEmail : $memberEmail.val()},
 		  success : function(result){
 			  if(result == 'null'){
 				  $('#searchMemberId').html('조회된 아이디가 없습니다.');
 			  } else{
 				  if(result.searchMemberStatus == 'Y'){
					$('#searchMemberId').html('조회 아이디 : ' + result.searchMemberId);
 				  } else{
 					  $('#searchMemberId').html('이미 탈퇴한 회원입니다. 관리자에게 문의바랍니다.');
 				  }
 			  }
 			  
 		  },
 		  
 		  error : function(){
 			 console.log('아이디 찾기 AJAX통신 실패!');
 		  }
      })
    }

  </script>

  </body>
</html>