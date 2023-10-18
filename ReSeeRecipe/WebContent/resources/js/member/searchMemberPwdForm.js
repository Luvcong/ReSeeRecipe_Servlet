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



