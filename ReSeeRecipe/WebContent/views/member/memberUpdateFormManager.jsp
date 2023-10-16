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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	<%@ include file="../manager/navbar.jsp" %>
<div class="rs-content">
	<div class="rs-content">
    <br><br>
    <h2>회원 정보 수정</h2>
    <br><br>
    <div class="container">
        <form class="form" action="<%=contextPath %>/hlupdatemember.ma" method="post" id="member-updateForm">
            
            <input type="hidden" id="invalidmemnickname" value="<%= loginMember.getMemNickname() %>">
            <input type="hidden" id="invalidmemEmail" value="<%= loginMember.getMemEmail() %>">
            <label for="memberNo">회원번호</label>
            <input type="text" class="form-control" id="memberNo" name="memNo" value="<%=m.getMemNo() %>" readonly>
            <br>
            <p class="tag">회원이름</p>
            <input type="text" class="form-control"  id="HL_memberName" name="memName" value="<%=m.getMemName() %>" required>
            <label for="HL_memberName">* 한글 2 ~ 5자로 입력 가능합니다.</label>
            <br>
            <p class="tag">회원아이디(변경불가)</p>
            <input type="text" class="form-control"  id="memberId"  name="memId" value="<%=m.getMemId()%>" readonly>
            <label for="memberId">* 영문, 숫자 5 ~ 20자로 입력 가능합니다.</label>
            <br>
            <p class="tag">회원닉네임</p>
            <input type="text" class="form-control"  id="HL_memberNickname" name="memNickname" value="<%=m.getMemNickname()%>" required>
            <label for="HL_memberNickname">* 영문, 한글, 숫자 3 ~ 8자로 입력 가능합니다. </label>
            <button type="button" class="btn btn-sm btn-primary" id="HL_invalidNick">중복확인</button>
            <br>
            <p class="tag">이메일</p>
            <input type="email" class="form-control"  id="HL_memberEmail" name="memEmail" value="<%=m.getMemEmail()%>" required>
            <label for="HL_memberEmail">* 인증받을 이메일을 입력해 주세요.</label>
            <button type="button" class="btn btn-sm btn-primary" id="invalidEmail" onclick="invalidEmail();">중복확인</button>
            <br>
            <label for="memberEnrolldate">가입일자</label>
            <input type="text" class="form-control"  id="memberEnrolldate" name="memEnrolldate" value="<%=m.getEnrollDate()%>" readonly>
            <br>
            <label for="memberModifydate">수정일자</lable>
            <input type="text" class="form-control" id="memberModifydate" name="memModifydate" value="<%=m.getModifyDate() %>" readonly>
            <br>
            <label for="membergradeNo">회원등급번호</label>
            <input type="text" class="form-control" id="membergradeNo" name="memgradeNo" value="<%= m.getMemGrade()%>" readonly>
            <br>
            <p class="tag">회원등급명</p>
            <input type="text" class="form-control"  id="membergradeName" name="memGradename" value="<%=m.getMemGradeName()%>" required>
            <label for="membergradeName">회원등급은 요린이 요리왕 요리마스터 입니다.</label>
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

<script>

    $(function(){
        $('#HL_invalidNick').on('click', invalidNick);
    });
    // 닉네임 중복확인 함수
	function invalidNick(){
        console.log('모범시민');
        const $hlmemnickname = $('#HL_memberNickname');

        $.ajax({
            url : 'yrnicknameCheck.me', //hlinvalidnickname.ma
            data : {checkNickname : $hlmemnickname.val()},
            success : function(result){

                console.log(result);
                // result 경우의 수 "NNNNN", "NNNNY"

                // 동등비교연산으로 문자열 따지기
                if(result == 'NNNNN') {
                    /*
                    Swal.fire({
                      '회원 닉네임 중복',         // Alert 제목
                      '이미 존재하거나 탈퇴한 회원의 닉네임입니다.',  // Alert 내용
                      'success'                         // Alert 타입
                    });
                    */
                    alert('회원 닉네임 중복');
                    $hlmemnickname.val('').focus();
                }
                else { // 중복X == 사용가능

                    // 알림창 => confirm();
                    if(Swal.fire({
                        title: '닉네임 변경',
                        text: '기존 닉네임 사용이 어려울 수 있습니다. 변경하시겠습니까?',
                        icon: 'warning',
                        
                        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                        confirmButtonText: '승인', // confirm 버튼 텍스트 지정
                        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
                        
                        reverseButtons: true, // 버튼 순서 거꾸로
                        
                        }).then(result => {
                        // 만약 Promise리턴을 받으면,
                        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                        
                            Swal.fire('승인이 완료되었습니다.', '닉네임 변경성공~!', 'success');
                        }
                        })) {
                            // 닉네임값은 이후에 변경 불가능하도록 ==> readonly
                            $hlmemnickname.attr('readonly', true);

                            // 닉네임 중복확인 버튼 비활성화
                            $('#HL_invalidNick').attr('disabled', true);
                        }
                        else {
                            $hlmemnickname.focus();
                        }
                    }
                },
                error : function(){
                    console.log('닉네임 중복체크 AJAX통신 실패!');
                }
        });
    }

    // 이메일 중복확인 함수
    function invalidEmail(){

        // 이메일 인풋 요소의 value 값
        const $hlmemEmail = $('#HL_memberEmail');

        // Ajax 통신 후 이메일 중복체크
        $.ajax({
            url : 'yremailCheck.me',//hlinvalidEmail.ma
            data : {checkEmail : $hlmemEmail.val()},
            success : function(result){

                console.log(result);

                // result 경우의 수 : "NNNNN" / "NNNNY"

                // 동등비교연산으로 문자열 따지기
                if(result == 'NNNNN') {
                    Swal.fire({
                      '회원 닉네임 중복',         // Alert 제목
                      '이미 존재하거나 탈퇴한 회원의 닉네임입니다.',  // Alert 내용
                      'success',                         // Alert 타입
                    });

                    $hlmemEmail.val('').focus();
                }
                else {
                    // 알림창 => confirm();
                    if(Swal.fire({
                        title: '이메일 변경',
                        text: '기존 이메일 사용이 어려울 수 있습니다. 변경하시겠습니까?',
                        icon: 'warning',
                        
                        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                        confirmButtonText: '승인', // confirm 버튼 텍스트 지정
                        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
                        
                        reverseButtons: true, // 버튼 순서 거꾸로
                        
                        }).then(result => {
                        // 만약 Promise리턴을 받으면,
                        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                        
                            Swal.fire('승인이 완료되었습니다.', '이메일 변경성공~!', 'success');
                        }
                        })) {
                            // 이메일값은 이후에 변경 불가능하도록 ==> readonly
                            $hlmemEmail.attr('readonly', true);

                            // 이메일 중복확인 버튼 비활성화
                            $('#HL_invalidEmail').attr('disabled', true);
                        }
                        else {
                            $hlmemEmail.focus();
                        }
                    }
                },
                error : function(){
                    console.log('이메일 중복체크 AJAX통신 실패!');
                }
        });
    }



</script>
</html>