<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String errorMsg = (String)request.getAttribute("errorMsg"); %>
<!-- 초본_231005_yr -->
<!-- 수정_231006_yr -->

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
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    

    <style>
        /* Bordered form */
        form {
        border: 3px solid #f1f1f1;
        }

        /* Full-width inputs */
        input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0px 0px 0px;
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

        .enroll-checkbox{
          border : none;
          margin : 20px 0px;
        }

        .enroll-checkbox > div{ 
          border : none;
        }

        .enroll-checkbox > div > a{
          float : right;
          margin-right : 20px;
          color: black;
        }

        input[type="checkbox"]{
          margin : 5px;
        }

        .container > label{
          font-size: 12px;
          margin : 0px 0px 5px 0px;
        }


    </style>

</head>
  <body>
  	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>
	
	<% if(errorMsg != null) { %>
		<script>
			alert("<%=errorMsg%>");
		</script>
	<% } %>

    <form action="yrenroll.me" method="post">

      <h1 id="title"><b>회원가입</b></h1>
      <div class="container">

          <input type="text" placeholder="이름" name="memberName" id="memberName" required>
          <label for="memberName">* 한글 2 ~ 6자로 입력 가능합니다.</label>
          
          <input type="text" placeholder="닉네임(활동명)" name="memberNickname" id="memberNickname" required>
          <label for="memberNickname">* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. </label>

          <input type="text" placeholder="아이디(중복불가)" name="memberId" id="memberId" required>
          <label for="memberId">* 영문, 숫자 5 ~ 20자로 입력 가능합니다.</label>
		  <button type="button" onclick="idCheck();">중복확인</button>
          
          <input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" required>
          <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>

          <input type="password" placeholder="비밀번호" name="memberPwdCheck" id="memberPwdCheck" required>
          <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다. </label>
          
          <input type="text" placeholder="이메일" name="memberEmail" id="memberEmail" required>
          <label for="memberEmail">* 유효한 이메일이 아닙니다.</label>

          
          <div class="enroll-checkbox">
            <div>
              <input type="checkbox" id="agreeAll" required><label for="agreeAll"><b>전체 동의</b></label>
            </div>

            <div>
              <input type="checkbox" id="agreeSite" class="agree"><label for="agreeSite">사이트 이용약관 동의(필수)</label>
              <!-- 사이트 이용약관 동의 모달창-->
              <a data-toggle="modal" href="#agreeSiteModal">보기</a>

              <div class="modal" id="agreeSiteModal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">사이트 이용약관 동의</h4>
                      <button type="button" class="close" data-dismiss="modal" id="close">&times;</button>
                      
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                      <label for="close">
                      서비스 이용약관
                      </label>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>

            </div>

            <div>
              <input type="checkbox" id="agreePerson" class="agree"><label for="agreePerson">개인정보 수집 및 이용 동의(필수)</label>
              <!-- 개인정보 수집 및 이용 동의 모달창-->
              <a data-toggle="modal" href="#agreePersonModal">보기</a>

              <div class="modal" id="agreePersonModal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">개인정보 수집 및 이용 동의</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                      서비스 이용약관
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <!-- 제출버튼!!!!!!!!!!!!!!!!!! -->
          <button type="submit" onclick = "return validate();">가입하기</button>
      </div>
        
    </form>
      
    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

    <script>
        function validate(){
        // 유효성 검사
        
        var memberName = document.getElementById('memberName');
        var memberNickname = document.getElementById('memberNickname');
        var memberId = document.getElementById('memberId');
        var memberPwd = document.getElementById('memberPwd');
        var memberPwdCheck = document.getElementById('memberPwdCheck');
        var memberEmail = document.getElementById('memberEmail');
        
        // 각 input요소에 대응하는 label요소들
        var labels = document.getElementsByTagName('label');
        
        // 1) 이름 (2 ~ 6자 이내)
        var regExp = /^[가-힣]{2,6}$/;
        if(!regExp.test(memberName.value)){
          labels[0].style.color = 'red';
          memberName.select();
          return false;
        } else{
          labels[0].style.display = 'none';
        };

        // 2) 닉네임 (3 ~ 8자)
        var regExp = /^[a-z0-9가-힣]{3,8}$/;
        if(!regExp.test(memberNickname.value)){
          labels[1].style.color = 'red';
          memberNickname.select();
          return false;
        } else{
          labels[1].style.display = 'none';
        };

        // 3) 아이디 (영문 대소문자포함 숫자 5 ~ 20자)
        var regExp = /^[a-zA-Z0-9]{5,20}$/;
        if(!regExp.test(memberId.value)){
          labels[2].style.color = 'red';
          memberId.select();
          return false;
        } else{
          labels[2].style.display = 'none';
        };

        // 4) 비밀번호 (영문 숫자 특수문자 !@#$+^* 포함 8 ~ 20자)
        var regExp = /^[a-zA-Z0-9!@#$+^*]{8,20}$/;
        if(!regExp.test(memberPwd.value)){
          labels[3].style.color = 'red';
          memberPwd.select();
          return false;
        } else{
          labels[3].style.display = 'none';
        };

        // 5) 비밀번호 확인
        if(memberPwdCheck.value != memberPwd.value){
          labels[4].style.color = 'red';
          memberPwdCheck.select();
          return false;
        } else{
          labels[4].style.display = 'none';
        };

        // 6) 이메일 (이메일앞부분 6 ~ 24자 + @6 ~ 14자, . 2 ~ 3자가 들어간 형식)
        var regExp =  /^[a-z0-9]+@[a-z]+\.[a-z]{6,24}$/;
        
        if(!regExp.test(memberEmail.value)){
          labels[5].style.color = 'red';
          memberEmail.select();
          return false;
        } else{
          labels[5].style.display = 'none';
        };

        return true;
      }
    </script>
    
    
    <!-- ajax를 이용하여 아이디 중복체크 -->
    <script>
		function idCheck(){
			
			const $memberId = $('#memberId');
			// const $memberId = $('.container input[name=memberId]');
			
			$.ajax({
				url : 'idCheck.me',
				data : {checkId : $memberId.val()},
				// 중복체크 조회 성공 시
				success : function(result) {
					// 중복된 아이디
					if(result == 'NNNNN'){
						Swal.fire({
							  icon: 'error',
							  title: '아이디 중복',
							  text: '이미 존재하거나 탈퇴한 회원의 아이디입니다!'
						})
						
						$memberId.val('').focus();
					// 사용가능한 아이디
					}
					
				},
				// 중복체크 조회 실패 시
				error : function(){
					
				}
			})
		}
		


    </script>
    
    


    <script>
      $(function(){
        // 전체 동의 시 하위항목 동의체크 / 미동의 시 체크해제
        $('#agreeAll').on('change', function(){

          let agreeAllCheck = $('#agreeAll').prop('checked');

          if(agreeAllCheck){
            $('#agreeSite, #agreePerson').prop('checked', true);
          }
          else{
            $('#agreeSite, #agreePerson').prop('checked', false);
          }
        });

        // 하위항목 동의 체크 시 전체동의 체크
        $('.agree').on('change', function(){
          let agreeCount = 0;

          $('.agree').each(function(){
            if($(this).prop('checked') == true){
              agreeCount++;
            } 
            else{
              agreeCount--;
            }
          });

          if(agreeCount == $('.agree').length){
            $('#agreeAll').prop('checked', true);
          }
          else{
            $('#agreeAll').prop('checked', false);
          }
        });
      })



    </script>
      

  </body>
</html>