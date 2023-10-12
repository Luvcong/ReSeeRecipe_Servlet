<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>
</head>
<body>

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

    <form enctype="multipart/form-data" action="<%= contextPath %>/memberUpdate.me" method="post">

      <h1 id="title"><b>회원정보변경</b></h1>
      
      <!-- 사진을 바꿀 회원의 번호를 hidden으로 같이 넘겨주기  -->
      <input type="hidden" name="memberNo" value="<%= loginMember.getMemNo() %>">

      <!-- 사진 -->
      <div class="container">
        <img src="https://usagi-post.com/wp-content/uploads/2020/05/no-image-found-360x250-1.png" alt="프로필사진" id="profileImg" width="150" height="150">
        <input type="file" name="profileInput" id="profileInput" onchange="loadImg(this);">
      </div>
      

      <!-- 정보 내용 변경 -->
      <div class="container">
		
		<!-- placeholder에 넣어야 하는데 loginUser를 넣게되면 업데이트하고 나서 오면 업데이트한 내용이 안보이잖어???
		그래서 updateConfirm에서 컨트롤러를 들려서 select해서 다시 와야할듯??? -->
        <input type="text" placeholder="이름" name="memberName" id="memberName" maxlength="5" required>
        <label for="memberName">* 한글 2 ~ 5자로 입력 가능합니다.</label>
        
        <input type="text" placeholder="닉네임(활동명)" name="memberNickname" id="memberNickname" maxlength="8" required>
        <label for="memberNickname">* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. </label>

        <input type="text" placeholder="아이디(중복불가)" name="memberId" id="memberId" maxlength="20" required>
        <label for="memberId">* 영문, 숫자 5 ~ 20자로 입력 가능합니다.</label>
        
        <input type="text" placeholder="이메일" name="memberEmail" id="memberEmail" maxlength="50" required>
        <label for="memberEmail">* 인증받을 이메일을 입력해 주세요.</label>
          
        <div class="enroll-checkbox">

        <!-- 비밀번호 변경 모달창-->
        <div>
            <a data-toggle="modal" href="#agreeSiteModal">**비밀번호 변경**</a>

            <div class="modal" id="agreeSiteModal">
            <div class="modal-dialog">
                <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal" id="close">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label for="close">
						
                        <input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" maxlength="20" required>
                        <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>
                
                        <input type="password" placeholder="비밀번호 확인" name="memberPwdCheck" id="memberPwdCheck" maxlength="20" required>
                        <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다.</label>

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

            
        </div>
        <!-- 제출버튼!!!!!!!!!!!!!!!!!! onclick = "return validate();"-->
        <button type="submit" id="submitBtn" disabled>변경하기</button>
      </div>
        
    </form>
      
    <!-- footer 푸터영역 -->
    <%@ include file="/views/common/footer.jspf" %>

    <script>

        // 필요한 변수 선언
        const profileImg = document.getElementById('profileImg');
        const profileInput = document.getElementById('profileInput');

        // 사진을 클릭하면 프로필 사진 변경
        function loadImg(inputFile){

            // 파일을 첨부했을 때
            if(inputFile.files.length == 1){
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
                // 새로 등록된 사진이 없으므로 기존의 사진 등록
                const noImg = 'https://usagi-post.com/wp-content/uploads/2020/05/no-image-found-360x250-1.png';
                // https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ77jbjsG1bGoS5Kn6gm83uk-iiWcuMLRzw&usqp=CAU
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
        
    </script>

</body>
</html>