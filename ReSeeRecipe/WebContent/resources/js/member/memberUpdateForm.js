


    
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