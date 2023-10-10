<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    </style>

</head>
  <body>
  	<!-- header부분 (상단 메인 메뉴바) -->
	  <%@ include file="/views/common/header.jspf" %>

    <form action="yrenroll.me" method="post">

      <h1 id="title"><b>회원가입</b></h1>
      <div class="container">

          <input type="text" placeholder="이름" name="memberName" id="memberName" required>
          <input type="text" placeholder="닉네임(활동명)" name="memberNickname" id="memberNickname" required>
          <input type="text" placeholder="아이디(중복불가)" name="memberId" id="memberId" required>
          
          <input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" required>
          <input type="password" placeholder="비밀번호" name="memberPwdCheck" id="memberPwdCheck" required>
          
          <input type="text" placeholder="이메일" name="memberEmail" id="memberEmail" required>

          
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
        var memberPwd = documnet.getElementById('memberPwd');
        var memberPwdCheck = document.getElementById('memberPwdCheck');
        var memberEmail = document.getElementById('memberEmail');

        // 1) 이름 (2 ~ 6자 이내)
        var regExp = /^[가-힣]{2,6}$/;
        
        if(!regExp.test(memberName.value)){
          membername.value = '다시 입력';
          alert('다시');
          return false;
        };

        // 2) 닉네임 (3 ~ 8자)
        var regExp = /^[가-힣]{3,8}/;
        if(!regExp.test(memberNickname.value)){
          memberNickname.value = '붑';
          return false;
        };

        // 3) 아이디 (영문 대소문자포함 숫자 5 ~ 20자)
        var regExp = /^[a-zA-Z0-9]{5,20}&/;
        if(!regExp.test(memberId.value)){

          return false;
        };

        // 4) 비밀번호 (영문 숫자 특수문자 !@#$+^* 포함 8 ~ 20자)
        var regExp = /^[a-zA-Z0-9!@#$+^*]{8,20}&/;
        if(!regExp.test(memberPwd.value)){

          return false;
        };

        // 5) 비밀번호 확인
        if(memberPwdCheck.value != memberPwd.value){

          return false;
        }

        // 6) 이메일 (이메일앞부분 6 ~ 30자 + @ + 뒷부분 6 ~ 14자가 들어간 형식)
        var regExp = /^[a-zA-Z0-9]{6,30} @ [a-zA-Z0-9]{6,14}$/;
        if(!regExp.test(memberEmail)){

          return false;
        };

        return true;
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