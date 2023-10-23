/** 공지사항 작성하기 스크립트 - 해시태그 하단에 위치
 * 등록된 해시태그 조회 Ajax 스트립트
 */
			
/*
$(document).ready(function () {
			    // 등록된 해시태그명 조회
			    $.ajax({
			      url: 'hlhashtag.tg',
			      type: 'GET',
			      dataType: 'json',
			      success: function (result) {
			        // 태그명 "tagName" 을 추출 -> whitelist로 설정
			        var whitelist = result.map(function (item) {
			          return item.tagName;
			        });
			        initTagify(whitelist);
			        
			      },
			      error: function (error) {
			        console.error('에러 발생:', error);
			      }
			    });

			    function initTagify(whitelist) {
			      var inputElm = document.querySelector('input[name=tags]');
				 // 사용자가 해시태그 입력하였을 때 보여줄 해시태그 개수 5개
			      var tagify = new Tagify(inputElm, {
			        enforceWhitelist: true,
			        whitelist: whitelist,
			        dropdown: {
			          maxItems: 5,
			          enabled: 0,
			          closeOnSelect: true,
			        }
			      });

			      tagify.on('input', onInput);

			      function onInput(e) {
			        var value = e.detail.value;
			        var input = value.toLowerCase().trim();
			        var dataBlacklist = inputElm.getAttribute('data-blacklist');
			        var blacklist = dataBlacklist.split(',').map(function (item) {
			          return item.trim().toLowerCase();
			        });

			        if (blacklist.includes(input)) {
			          //tagify.removeTags();
			          console.log('입력값이 블랙리스트에 포함되어 삭제됨.');
			          tagify.replaceTag();
			        }
			      }

			      tagify.on('add', onAddTag);
			      
			      function onAddTag(e) {
					var dataInput = e.detail.data.value;
			        var hashtagList = [];
			        console.log(tagify.value);
			        console.log(tagify.value.length);
			        // 사용자가 입력한 해시태그가 whitelist(등록된 해시태그)일 경우 해시태그리스트에 추가
			        for(let i=0 ; i< tagify.value.length ; i++){
			        	hashtagList.push(tagify.value[i].value);
			        }
			        console.log(hashtagList);
			      }
			      
			    }
			    
			  }); */
			