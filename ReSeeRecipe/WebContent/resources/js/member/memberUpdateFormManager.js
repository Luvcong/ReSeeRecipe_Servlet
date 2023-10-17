//관리자 회원정보 수정 폼 js파일 memberUpdateFormManager.js

/**
 * body 태그 이후 스크립트 태그 위치
 */
    $(function(){
        $('#HL_invalidNick').on('click', function() {
            invalidNick();
        });

         $('#invalidEmail').on('click', function() {
            invalidEmail();
        });
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
            
                    Swal.fire('실패', '회원 닉네임 중복', 'error');
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
                   alert('이미 존재하거나 탈퇴한 회원의 이메일입니다.');

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


