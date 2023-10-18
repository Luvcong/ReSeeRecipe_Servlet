const $memberId = $('input[name=memberId]');
const $memberEmail = $('input[name=memberEmail]');

function searchMemberPwd(){
    $.ajax({
        url : 'yrsearchMemberPwd.me',
        data : {memberId : $memberId.val(),
                memberEmail : $memberEmail.val()},
        success : function(result){
            if(result == 'null'){
                $('#searchMemberPwd').text('조회된 결과가 없습니다.');
            } else{
                $('#searchMemberPwd').text('비밀번호 재설정');
                $('#updateMemberPwd').attr('style', "display:block;");
            }
        },
        error : function(){
            console.log('비밀번호 찾기 AJAX통신 실패!');
        }
    })
};

const $memberPwd = $('input[name=memberPwd]');
const $memberPwdCheck = $('input[name=memberPwdCheck]');

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
})



function updateMemberPwd(){
    
    if($memberPwd.val() != $memberPwdCheck.val()){
        console.log("비밀번호 달라");
$('label[for="memberPwdCheck"]').text("* 비밀번호가 일치하지 않습니다.").css('color', 'red');
    } else{ // 비밀번호 재설정 및 확인 동일작성
    $.ajax({
        url : 'yrupdateMemberPwd.me',
        data : {memberId : $memberId.val(),
                memberPwd : $memberPwd.val()		
        },
        success : function(result){
            if(result == 'S'){
                Swal.fire({
                      title: '비밀번호 재설정 성공',
                      text: "비밀번호가 변경되었습니다.",
                      icon: 'success',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인'
                }).then((result) => {
                  if (result.isConfirmed) {
                      $(location).attr("href", "views/member/memberLogin.jsp");
                  }
                })

            } else{
                // ★★★★★★★★★★★★여기서 jsp로 보내니까 다시 입력하면 AJAX통신 오류가 뜸
    Swal.fire({
                      title: '비밀번호 재설정 실패',
                      text: "다시 시도해 주십시오.",
                      icon: 'error',
                      confirmButtonColor: '#d33',
                      confirmButtonText: '확인'
                }).then((result) => {
                  if (result.isConfirmed) {
                      
                      $(location).attr("href", "views/member/searchMemberPwdForm.jsp");
                  }
                })
            }

        },
        error : function(){
            console.log('비밀번호 재설정 AJAX통신 실패!');
        }
    })
    }
};