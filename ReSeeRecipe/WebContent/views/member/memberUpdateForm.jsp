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

    <!-- Alert창 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
    <style>
        /* Bordered form */
        form {
        border: 3px solid #f1f1f1;
        }

        /* Full-width inputs */
        input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px 12px 20px;
        margin: 0px 0px 0px 0px;
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
          margin-right : 20px;
          color: black;
        }

        input[type="checkbox"]{
          margin : 5px;
        }

        .container > label{
          font-size: 12px;
          margin : 0px 0px 10px 0px;
        }

        .tag{
          margin : 10px 0px;
        }

        .compare{
          display : none;
        }




    </style>

</head>
  <body>
  	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %> 
	
	

    <form enctype="multipart/form-data" action="<%= contextPath %>/yrmemberUpdate.me" method="post">

      <h1 id="title"><b>회원정보변경</b></h1>
      
      <!-- 사진을 바꿀 회원의 번호를 hidden으로 같이 넘겨주기  -->
      <input type="hidden" name="memberNo" id="memberNo" value="<%= loginMember.getMemNo() %>">
      <!-- 회원이 이미 등록된 사진이 있다면 hidden으로 같이 넘겨주기 -->
      <input type="hidden" name="memberPicture" value="<%= loginMember.getMemPicture() %>">

      <!-- 사진 -->
      <div class="container">
        <% if(loginMember.getMemPicture() != null) { %> 
        	<img src="<%= contextPath %>/<%= loginMember.getMemPicture() %>" alt="프로필사진" id="profileImg" width="150" height="150">
        <% } else { %>
        	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ77jbjsG1bGoS5Kn6gm83uk-iiWcuMLRzw&usqp=CAU" alt="프로필사진" id="profileImg" width="150" height="150">
       	<% } %>
        <input type="file" name="profileInput" id="profileInput" onchange="loadImg(this);">
      </div>

      
      <!-- 정보 내용 변경 -->
      <div class="container">
		
		  <!-- value에 loginUser를 update된 걸 넣음 -->
        <p class="tag">이름</p>
        <input type="text" value="<%=loginMember.getMemName() %>" name="memberName" id="memberName" maxlength="5" required>
        <label for="memberName">* 한글 2 ~ 5자로 입력 가능합니다.</label>
        
        <p class="tag">닉네임(활동명)</p>
        <input type="text" value="<%= loginMember.getMemNickname() %>" name="memberNickname" id="memberNickname" maxlength="8" required>
        <label for="memberNickname">* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. </label>

        <p class="tag">아이디(변경불가)</p>
        <input type="text" value="<%= loginMember.getMemId() %>" readonly name="memberId" id="memberId" maxlength="20" required>
        <label for="memberId">* 영문, 숫자 5 ~ 20자로 입력 가능합니다.</label>
        
        <p class="tag">이메일</p>
        <input type="text" value="<%= loginMember.getMemEmail() %>" name="memberEmail" id="memberEmail" maxlength="50" required>
        <label for="memberEmail">* 인증받을 이메일을 입력해 주세요.</label>

        <!-- 현재 로그인된 값 비교할 수 있게 값 뽑기 -->
        <p class="compare" id="loginMemNickname"><%= loginMember.getMemNickname() %></p>
        <p class="compare" id="loginMemEmail"><%= loginMember.getMemEmail() %></p>
        
        <!-- 제출버튼!!!!!!!!!!!!!!!!!! onclick = "return validate();"-->
        <button type="submit" id="submitBtn" >변경하기</button>

        <div class="enroll-checkbox">

        <!-- 비밀번호 변경 모달창-->
        <div>
          <a data-toggle="modal" href="#agreeSiteModal">비밀번호 변경</a>

          <div class="modal" id="agreeSiteModal">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal" id="close">&times;</button>
                </div>

                <!-- Modal body -->
                <!-- <form action=""> -->
                  <!-- 전에 비밀번호 변경도 ajax로 했으니 이것도 ajax로 해주자 -->
                  <div class="modal-body">
                      <label for="close"></label>
                        <input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" maxlength="20">
                        <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>
                        
                        <input type="password" placeholder="비밀번호 확인" name="memberPwdCheck" id="memberPwdCheck" maxlength="20">
                        <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다.</label>
                  </div>
                  <!-- Modal footer -->
                  <div class="modal-footer">
                      <!-- 아이디 같이 보내주기 -->
                      <!-- <button type="submit" action="<%= contextPath %>/yrupdateMemberPwd.me?memberId=<%= loginMember.getMemId() %>" method="post"></button> -->
                      <button type="button" class="btn btn-danger" id="updatePwdBtn" onclick="updateMemberPwd();" data-dismiss="modal" >비밀번호 변경</button>
                  </div>
                  
                <!-- </form> -->
              </div>
            </div>
          </div>

        </div>
        <!-- 비밀번호 변경 모달창 끝 -->

        <!-- 회원삭제버튼 -->
        <button type="button" onclick="logcation.href='<%= contextPath %>/yrmemberDelete.me'">탈퇴하기</button>            

        </div>
        
      </div>
        
    </form>
      
    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

    <script>

      function deleteAlert(){

        Swal.fire({
          title: '정말로 탈퇴하시겠습니까?',
          // showDenyButton: true,
          showCancelButton: true,
          confirmButtonText: '탈퇴하기',
          // denyButtonText: `안함`,
          denyButtonText: `취소`,
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
            // 탈퇴하기 버튼 클릭 시 함수 호출
            memberDelete();
          } 
        })

        // 탈퇴하기 DB ajax
        function memberDelete(){
        $.ajax({
          url : 'yrmemberDelete.me',
          data : {memberNo : $('#memberNo').val()},
          // 회원 탈퇴 성공 시
          success : function(result) {
            if(result == 'NNNNY'){
              Swal.fire({
                title: '탈퇴 완료',
                text: "탈퇴되었습니다.",
                icon: 'success',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인'
                }).then((result) => {
                  // 확인버튼 클릭 시 메인회면으로 이동
              if (result.isConfirmed) {
                $(location).attr("href", "<%= contextPath %>");
                }
              })
            // 회원 탈퇴 실패 시
            } else{
              Swal.fire({
              icon: 'error',
              title: '탈퇴 실패',
              text: '오류가 반복되는 경우 관리자에게 문의하세요.',
              })
            }
          },
          // 중복체크 조회 실패 시
          error : function(){
            console.log('회원 탈퇴 AJAX통신 실패!');
          }
      })
      };









      }

        // 필요한 변수 선언
        const profileImg = document.getElementById('profileImg');
        const profileInput = document.getElementById('profileInput');

        // 사진을 클릭하면 프로필 사진 변경
        function loadImg(inputFile){
            console.log("클릭하면");
            // 파일을 첨부했을 때
            if(inputFile.files.length == 1){
              console.log("성공");
              console.log(inputFile.files.length);
                // 파일을 읽어올 객체 생성
                let reader = new FileReader();
                // 파일의 긴 url을 읽어옴
                reader.readAsDataURL(inputFile.files[0]);
                // 파일읽기가 완료되면 익명함수 호출
                reader.onload = function(e){
                    // $('#profileImg').attr('src', e.target.result);
                    // 이벤트가 발생한곳의 result에 담겨있는 url을 파일 src값으로 넣어줌
                    console.log(profileImg);
                    profileImg.src = e.target.result;
                }
            // 취소(파일 없음)
            } else {
              console.log("실패");
              console.log(inputFile.files.length);
                // 새로 등록된 사진이 없으므로 기존의 사진 등록
                const noImg = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ77jbjsG1bGoS5Kn6gm83uk-iiWcuMLRzw&usqp=CAU';
                // https://usagi-post.com/wp-content/uploads/2020/05/no-image-found-360x250-1.png
                // https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ77jbjsG1bGoS5Kn6gm83uk-iiWcuMLRzw&usqp=CAU
                // https://s3.orbi.kr/data/file/united2/9f61edb66efb4ff982a2675ec5e9e806.png
                profileImg.src = noImg;
            }

        };
        // 파일첨부 input요소를 숨기고 사진을 클릭했을 때 input요소 클릭
        profileInput.style.display = 'none';
        profileImg.addEventListener('click', function(){
          profileInput.click();
        });
        
        // 최대한 javascript로도 해보자
        /*
        $(function(){
            $('#profileInput').hide();

            $('#profileImg').click(function(){
                $('#profileInput').click();
            })
        })
        */
        
        // 비밀번호 변경 모달창 ajax
        const $memberId = $('#memberId');
        const $memberPwd = $('#memberPwd');
        const $memberPwdCheck = $('#memberPwdCheck');
        
        // 비밀번호 재설정 유효성 검사
        // 비밀번호 (영문 숫자 특수문자 !@#$+^* 포함 8 ~ 20자)
        $(function(){
          $('input[name*=memberPwd]').keyup(function(){

            var $regExp = /^[a-zA-Z0-9!@#$+^*]{8,20}$/;
            
            // 비밀번호 정규표현식 불일치 시
            if(!$regExp.test($('input[name=memberPwd]').val())){
              $('label[for="memberPwd"]').css('color', 'red');
              $('#updatePwdBtn').attr('disabled', true);
            
            // 비밀번호확인 불일치 시 (정규표현식을 일치)
            } else if($memberPwd.val() != $memberPwdCheck.val()){
              $('label[for="memberPwdCheck"]').text('* 비밀번호가 일치하지 않습니다.').css('color', 'red');
              $('label[for="memberPwd"]').css('color', 'black');
              $('#updatePwdBtn').attr('disabled', true);
              
            // 둘다 일치
            } else {
              $('label[for="memberPwdCheck"]').text('').css('color', 'black');
              $('label[for="memberPwd"]').css('color', 'black');
              $('#updatePwdBtn').attr('disabled', false);
            }
            
          })
        });

        function updateMemberPwd(){
        	if($memberPwd.val() != $memberPwdCheck.val()){
        		// $('label[for="memberPwdCheck"]').text("* 비밀번호가 일치하지 않습니다.").css('color', 'red');
        		Swal.fire({
					  title: '비밀번호 재설정 실패',
					  text: "비밀번호가 변경되지 않았습니다.",
					  icon: 'error',
				})
        	} else {
        		// $('label[for="memberPwdCheck"]').text("").css('color', 'black');
	        	$.ajax({
	        		url : 'yrupdateMemberPwd.me',
	        		data : {memberId : $memberId.val(),
	        				memberPwd : $memberPwd.val()        			
	        		},
	        		// ajax통신 성공
	        		success : function(result){
	        			if(result == 'S'){
                Swal.fire({
                    title: '비밀번호 재설정 성공',
                    text: "비밀번호가 변경되었습니다.",
                    icon: 'success',
                })
                } else {
                  Swal.fire({
                      title: '비밀번호 재설정 실패',
                      text: "비밀번호가 변경되지 않았습니다.",
                      icon: 'error',
                  })
                }
	        		}
	        		// ajax통신 실패
	        	});
        	}
        }
        

      // 정규표현식 
      $(function() {
        // ★★★★★★★★★★★★★★★★★★클릭한거 뒤에 있는 label의 속성값 바꾸기~_231010
        $('input').keyup(function(){
          var $errorCheck = $('label[for="' + $(this).attr('id') + '"]');

          // 정규표현식 초기화
          var $regExp = /^/;

          // 1) 이름 (2 ~ 6자 이내)
          if($(this)[0] == $('#memberName')[0]) {
            var $regExp = /^[가-힣]{2,6}$/;
          }

          // 2) 닉네임 (3 ~ 8자)
          if($(this)[0] == $('#memberNickname')[0]) {
            var $regExp = /^[a-z0-9가-힣]{3,8}$/;
            // 중복체크 호출(현재 로그인된 값은 중복체크X)
            if($('#loginMemNickname').text() != $('#memberNickname').val())
            nicknameCheck();
            $errorCheck.text("* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. ").css('color', 'black');
          };
          
          // 3) 이메일 (이메일앞부분 6 ~ 24자 + @6 ~ 14자, . 2 ~ 6자가 들어간 형식)
          if($(this)[0] == $('#memberEmail')[0]) {
            var $regExp =  /^[a-z0-9]+@[a-z]+\.[a-z]{2,6}$/;
            // 중복체크 호출(현재 로그인된 값은 중복체크X)
            if($('#loginMemEmail').text() != $('#memberEmail').val())
            emailCheck();
            $errorCheck.text("인증받으실 이메일을 입력해 주세요.").css('color', 'black');
          };
          
          // 정규표현식의 결과를 반환해줄 변수설정
          var eachResult = {};
          var eventThis = $(this).attr('id');
          
          eachResult['eachResult'+eventThis] = 0;

          // 각 정규표현식에 따른 결과
          // 비밀번호는 모달창에서 따로 진행, 다시 초기화된 값으로 조건처리되므로 제외시킴
          if($(this)[0] != $memberPwd[0]){
            if(!$regExp.test($(this).val())){
              $errorCheck.css('color', 'red');
              eachResult['eachResult'+eventThis] = 0;
            } else{
              $errorCheck.css('color', 'black');
              eachResult['eachResult'+eventThis] = 1;
            };
          }
          
          // 모든 조건을 만족할 때 결과
          var submitResult = 1;
          
          // 모든 유효성검사 통과 시 버튼 활성화!!!!!!!!!!!!!
          var list = ['memberName', 'memberNickname', 'memberEmail'];
          for(var a of list){
            // 리스트에 속성값이 초기화되지 않은 경우 NaN이 발생 => 조건처리
            if(!isNaN(eachResult['eachResult' + a])){
              submitResult *= eachResult['eachResult' + a]; 
            }
          }

          // 조건 만족 시 버튼 활성화 여부
          if(submitResult > 0){
            $('#submitBtn').attr('disabled', false);
          } else{
            $('#submitBtn').attr('disabled', true);
          }
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
              $nicknameLabel.text("* 이미 존재하는 닉네임입니다!").css('color', 'red');
            // 사용가능한 아이디
            } else{
              $('#submitBtn').attr('disabled', false);
            }
          },
          // 중복체크 조회 실패 시
          error : function(){
            console.log('닉네임 중복체크 AJAX통신 실패!');
          }
      })
      };

      // ajax를 이용하여 이메일 중복체크
      function emailCheck(){
        $.ajax({
          url : 'yremailCheck.me',
          data : {checkEmail : $('#memberEmail').val()},
          // 중복체크 조회 성공 시
          success : function(result) {
            // 중복된 아이디
            if(result == 'NNNNN'){
              $('label[for="memberEmail"]').text("* 이미 사용하고 있는 이메일입니다!").css('color', 'red');
              $('#submitBtn').attr('disabled', true);
            return false;
            // 사용가능한 아이디
            } else{
              $('#submitBtn').attr('disabled', false);
              return true;
            }
          },
          // 중복체크 조회 실패 시
          error : function(){
            console.log('이메일 중복체크 AJAX통신 실패!');
          }
        })
      }
    </script>


</body>
</html>