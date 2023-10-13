<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String errorMsg = (String)request.getAttribute("errorMsg"); %>
-->
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
        padding: 50px 300px;
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
          padding-top: 50px;
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

          <input type="text" placeholder="이름" name="memberName" id="memberName" maxlength="5" required>
          <label for="memberName">* 한글 2 ~ 5자로 입력 가능합니다.</label>
          
          <input type="text" placeholder="닉네임(활동명)" name="memberNickname" id="memberNickname" maxlength="8" required>
          <!-- <button type="button" onclick="nicknameCheck();">닉네임 중복확인</button> -->
          <label for="memberNickname">* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. </label>
          

          <input type="text" placeholder="아이디(중복불가)" name="memberId" id="memberId" maxlength="20" required>
          <!-- <button type="button" onclick="idCheck();">아이디 중복확인</button> -->
          <label for="memberId">* 영문, 숫자 5 ~ 20자로 입력 가능합니다.</label>
          
          
          <input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" maxlength="20" required>
          <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>

          <input type="password" placeholder="비밀번호 확인" name="memberPwdCheck" id="memberPwdCheck" maxlength="20" required>
          <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다.</label>
          
          <input type="text" placeholder="이메일" name="memberEmail" id="memberEmail" maxlength="50" required>
          <!-- <button type="button" onclick="emailCheck();">이메일 중복확인</button> -->
          <label for="memberEmail">* 인증받을 이메일을 입력해 주세요.</label>
          

          
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
          <!-- 제출버튼!!!!!!!!!!!!!!!!!! onclick = "return validate();"-->
          <button type="submit" id="submitBtn" disabled>가입하기</button>
      </div>
        
    </form>
      
    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

    <!--
    <script>
        /*
        // 유효성 검사
        function validate(){
        
        var memberName = document.getElementById('memberName');
        var memberNickname = document.getElementById('memberNickname');
        var memberId = document.getElementById('memberId');
        var memberPwd = document.getElementById('memberPwd');
        var memberPwdCheck = document.getElementById('memberPwdCheck');
        var memberEmail = document.getElementById('memberEmail');
        var submitBtn = document.getElementById('submitBtn');

        /*
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
      */
    </script>
    -->
    
    <script>
      
      $(function() {
        // ★★★★★★★★★★★★★★★★★★클릭한거 뒤에 있는 label의 속성값 바꾸기~_231010
        
        $('input').keyup(function(){
          // console.log($(this));
          var $errorCheck = $('label[for="' + $(this).attr('id') + '"]');

          
          // 1) 이름 (2 ~ 6자 이내)
          if($(this)[0] == $('#memberName')[0]) {
            var $regExp = /^[가-힣]{2,6}$/;
            
          }

          // 2) 닉네임 (3 ~ 8자)
          if($(this)[0] == $('#memberNickname')[0]) {
            var $regExp = /^[a-z0-9가-힣]{3,8}$/;
            // 중복체크 호출
            nicknameCheck();
            /*
            console.log(nicknameCheck());
            if(nicknameCheck()) {
              console.log('들어옴');
              $errorCheck.text("* 이미 존재하는 닉네임입니다!").css('color', 'red');
						  $('#memberNickname').val('').focus();
            }
            */
            $errorCheck.text("* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. ").css('color', 'black');
            
          };

          // 3) 아이디 (영문 대소문자포함 숫자 5 ~ 20자)
          if($(this)[0] == $('#memberId')[0]) {
            var $regExp = /^[a-zA-Z0-9]{5,20}$/;
            // 중복체크 호출
            idCheck();
            /*
            if(idCheck()) {
              $errorCheck.text("* 이미 존재하는 아이디입니다!").css('color', 'red');
              $('#memberId').val('').focus();
            }
            */
            $errorCheck.text("* 영문, 숫자 5 ~ 20자로 입력 가능합니다.").css('color', 'black');
          };
          
          // 4) 비밀번호 (영문 숫자 특수문자 !@#$+^* 포함 8 ~ 20자)
          if($(this)[0] == $('#memberPwd')[0]) var $regExp = /^[a-zA-Z0-9!@#$+^*]{8,20}$/;
          
          // 5) 비밀번호 확인
          // 비밀번호 또는 비밀번호 확인 input에 입력시, 비밀번호와 비밀번호 확인 값의 일치여부
          
          if(($(this)[0] == $('#memberPwdCheck')[0] || $(this)[0] == $('#memberPwd')[0] ) && $('#memberPwdCheck').val() != $('#memberPwd').val()) {
            $('label[for="memberPwdCheck"]').text("* 비밀번호가 일치하지 않습니다.").css('color', 'red');
          } else{
            $('label[for="memberPwdCheck"]').text("").css('color', 'black');
          };
          
          // 6) 이메일 (이메일앞부분 6 ~ 24자 + @6 ~ 14자, . 2 ~ 6자가 들어간 형식)
          if($(this)[0] == $('#memberEmail')[0]) {
            var $regExp =  /^[a-z0-9]+@[a-z]+\.[a-z]{2,6}$/;
            // 중복체크 호출
            emailCheck();
            /*
            if(emailCheck()) {
              $errorCheck.text("* 이미 사용 중인 이메일입니다!").css('color', 'red');
              $('#memberEmail').val('').focus();
            }
            */
            $errorCheck.text("인증받으실 이메일을 입력해 주세요.").css('color', 'black');
          };
          
          // 정규표현식의 결과를 반환해줄 변수설정
          var eachResult = {};
          var eventThis = $(this).attr('id');
          
          // eachResult['eachResult'+eventThis] = 1;
          eachResult['eachResult'+eventThis] = 0;
          // 각 정규표현식에 따른 결과
          if(!$regExp.test($(this).val())){
            // labels[0].style.color = 'red';
            // memberName.select();
            $errorCheck.css('color', 'red');
            // $('#submitBtn').attr('disabled', true);

            // console.log(eventThis);
            eachResult['eachResult'+eventThis] = 0;
            // console.log(eachResult['eachResult'+'memberName']);
            // console.log(eventThis);
            
            
            
          } else{
            $errorCheck.css('color', 'black');
            // $('#submitBtn').attr('disabled', false);
            
            eachResult['eachResult'+eventThis] = 1;
            // console.log(eachResult['eachResult'+eventThis]);
            // console.log(eventThis);
          };
          
          // 모든 유효성검사 통과 시 버튼 활성화!!!!!!!!!!!!!
          
          // 모든 조건을 만족할 때 결과
          // console.log(eachResult['eachResult'+eventThis]);
          // console.log(eventThis);
          var submitResult = 1;
  
          // 배열로 for-each문 for of (객체로 쓸거면 키밸류로 for in사용)
          var list = ['memberName', 'memberNickname', 'memberId', 'memberPwd', 'memberEmail'];
  
          for(var a of list){
            // console.log(eachResult['eachResult' + a]);
            submitResult *= eachResult['eachResult' + a]; 
            // console.log(eachResult['eachResult' + eventThis]);
            // console.log(a);
            console.log(submitResult);
          }
          console.log(submitResult);
          if(submitResult > 0){
            $('#submitBtn').attr('disabled', false);
          }
  
          // var $count = $cName * $cNickname;
          // if($count > 0){
            //   $('#submitBtn').attr('disabled', false);
          // } 
          
        });
        
        



        

        

      })

   		// ajax를 이용하여 닉네임 중복체크
    	function nicknameCheck(){
        $.ajax({
          url : 'yrnicknameCheck.me',
          data : {checkNickname : $('#memberNickname').val()},
          // 중복체크 조회 성공 시
          success : function(result) {
            // 중복된 아이디
            const $nicknameLabel = $('label[for="memberNickname"]');
            if(result == 'NNNNN'){
              /*
              Swal.fire({
                  icon: 'error',
                  title: '닉네임 중복',
                  text: '이미 존재하거나 탈퇴한 회원의 닉네임입니다!'
              })
              */
              $nicknameLabel.text("* 이미 존재하는 닉네임입니다!").css('color', 'red');
              //$('#memberNickname').val('').focus();
              
              // return false;

            // 사용가능한 아이디
            } else{
              // $nicknameLabel.text("* 사용가능한 닉네임입니다.");
              // $nicknameLabel.css('color', 'black');
              // return true;
            }
          },
          // 중복체크 조회 실패 시
          error : function(){
            console.log('닉네임 중복체크 AJAX통신 실패!');
          }
			})
    	}
    
    	// ajax를 이용하여 아이디 중복체크
		function idCheck(){
			$.ajax({
				url : 'yridCheck.me',
				data : {checkId : $('#memberId').val()},
				// 중복체크 조회 성공 시
				success : function(result) {
					// 중복된 아이디
					if(result == 'NNNNN'){
            /*
						Swal.fire({
							  icon: 'error',
							  title: '아이디 중복',
							  text: '이미 존재하거나 탈퇴한 회원의 아이디입니다!'
						})
            */
						$('label[for="memberId"]').text("* 이미 존재하거나 탈퇴한 회원의 아이디입니다!").css('color', 'red');
						// $('#memberId').val('').focus();
            
            // return false;

					// 사용가능한 아이디
					} else{
						// $('label[for="memberId"]').text("* 사용가능한 아이디입니다.");
					}
				},
				// 중복체크 조회 실패 시
				error : function(){
					console.log('아이디 중복체크 AJAX통신 실패!');
				}
			})
		}
		
		// ajax를 이용하여 이메일 중복체크
		function emailCheck(){
			$.ajax({
				url : 'yremailCheck.me',
				data : {checkEmail : $('#memberEmail').val()},
				// 중복체크 조회 성공 시
				success : function(result) {
					// 중복된 아이디
					if(result == 'NNNNN'){
            /*
						Swal.fire({
							  icon: 'error',
							  title: '이메일 중복',
							  text: '이미 사용하고 있는 이메일입니다!'
						})
            */
						$('label[for="memberEmail"]').text("* 이미 사용하고 있는 이메일입니다!").css('color', 'red');
						// $('#memberEmail').val('').focus();
            
           // return false;
					// 사용가능한 아이디
					} else{
						// $('label[for="memberEmail"]').text("* 사용가능한 이메일입니다.");
            // return true;
					}
				},
				// 중복체크 조회 실패 시
				error : function(){
					console.log('이메일 중복체크 AJAX통신 실패!');
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