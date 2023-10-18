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
