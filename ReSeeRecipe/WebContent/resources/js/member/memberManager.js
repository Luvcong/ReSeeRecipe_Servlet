// memberManager.jsp

/** header 아래에 위치
 * 회원 검색
 */
			$(function(){
        		$('#HL_memSearch').on('click', HL_memSearch);
        	});
        	
        	// 선택한 검색 옵션값 초기화
        	var $seleoption = 'MEM_ID';
        	
        	function HL_memSearch(){
        		
        		var $selectoption = $('#HL_memSearch').val();
        		console.log($selectoption);
        		
        		
        		
        		
        		
        		
        		
        		
        		let $option = $('option:selected');
        		console.log($option.val());
        		let $searcon = $('#searchMember').val();
        		console.log($searcon);
        		$.ajax({
        			url : 'hlsearchmeminfo.ma',
        			type : 'post',
        			data : {
        			/*	option : $option.val(),*/
        				searhcon : $('#searchMember').val()
        			},
        			success : function(result){
        				console.log(result);
    					console.log('회원 정보 검색  성공');
    					for(let i in result){
    						console.log(result[memNo]);
    					}
    					console.log(typeof(result.enrollDate));
    					let resultStr = '';
    					resultStr += '<br><br>'+ '<h2>회원 정보 검색 결과 보기</h2>'
    					    	   + '<br><br>' + '<div class="container">' 
    					    	   + '<div class="from-control">'
    					    	   + '<table class="table">'
    					      	   + '<tr>'
    							   + '<th>회원번호</th>'
    							   + '<td>' + result.memNo + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>회원이름</th>'
    							   + '<td>' + result.memName + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>회원아이디</th>'
    							   + '<td>' + result.memId + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>회원닉네임</th>'
    							   + '<td>' + result.memNickname + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>회원이메일</th>'
    							   + '<td>' + result.memEmail + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>가입일자</th>'
    							   + '<td>' + result.enrollDate + '<td>'
    							   + '</tr>'
    							   + '<tr>'
    							   + '<th>회원등급명</th>'
    							   + '<td>' + result.memGradeName + '<td>'
    							   + '</tr>' 
    							   + '</table>'
    					           + '<br><br>'
    					           + '<div id="memberdetailbtn">'
    					           + '<button id="memberupdateFormbtn" class="w3-button w3-round w3-yellow">수정하기</button>' + '\t'
    					           + '<button onclick="abc()" id="memberList" class="w3-button w3-round w3-yellow">목록으로</button>'
    					           + '</div>'
    					           + '</div>'
    					   		   + '</div>';
    							   
    					$('.header2').html(resultStr);
        			},
        			error : function(result){
        				
        			}
        		})
        		
        	}
/** table 태그 다음에 위치
 *  // 더블클릭 시 회원 상세보기 기능
 */     
     /*   	$(function(){
            	$(document).on('dblclick','#memAllList > tr', function(){
            		const mno =  $(this).children().eq(1).text();
    				location.href = '<%=contextPath%>/hldetailmember.ma?mno=' + mno;
            	});
            }); */

/** 페이징바 위에 스크립트 위치
 * //회원 삭제 기능 3차 시도  
 */
        	function deleteMem(){
            	let mem_trs = document.querySelectorAll('#memAllList > tr');
            	console.log('mem_trs', mem_trs);
            	let check = null;
            	
            	for(let tr of mem_trs){
            		let mem_input = tr.querySelector('input');
            		console.log('몇개선택', mem_input);
            		if(mem_input.checked){
            			check = tr;
            			
            			console.log('체크돼나', check);
            		}
            	}
            	
            	if(check == null){
            		Swal.fire('실패', '회원을 선택해주세요', 'error');
        			return;
            	}
            	
            	Swal.fire({
        			title : "회원을 삭제하시겠습니까?",
        			text : "※  탈퇴회원에서 조회 가능합니다",
        			icon : "warning",
        			showCancelButton: true,
    				confirmButtonColor: "#DD6B55",
    				confirmButtonText: "삭제",
    				cancelButtonText: "취소"
    				}).then((result) => {
    					if (!result.isConfirmed) {
    					  return;
    					}
    					
    					let memtable = document.getElementById('memAll');
    					let memtrs = memtable.querySelectorAll('tbody tr');
    					let del_list = [];
    					
    					for(let tr of memtrs){
    						let memcheckbox = tr.querySelector('input');
    						if(memcheckbox.checked == true){
    							let memcheckno = memcheckbox.value;
    							del_list.push(memcheckno);
    						}
    					}
            		
    					$.ajax({
    						url : 'hldeletemember.ma',
    						type : 'post',
    						dataType : 'json',
    						data : {'mno' : del_list},
    						success : function(result){
    							Swal.fire('성공', '탈퇴회원에서 확인하세요!', 'success');
    							
    							for(let tr of memtrs){
    								let mno = parseInt(tr.children[1].textContent);
    								console.log('result정체?', result)
    								let mnotr = result.indexOf(mno);
    								if(mnotr != -1){ //mno
    									tr.remove();
    									console.log(tr);
    									window.reload();
    								}
    								console.log('mnotr', mnotr);
    								console.dir(mnotr);
    								console.log('result정체3?', result);
    								console.dir(result);
    							}
    						},
    						error : function(result){
    							console.log('실패');
    						},
    						complete : function(result) {
    							window.location.reload();
    						}
    					});
           			 });		
    		
            }

/**
 * // 더블클릭 시 회원 상세보기 기능
 */        	
       /* 	$(function(){
            	$(document).on('dblclick','#memAllList > tr', function(){
            		const mno =  $(this).children().eq(1).text();
    				location.href = '<%=contextPath%>/hldetailmember.ma?mno=' + mno;
            	});
            }); 	*/
        	
/**
 * // 체크박스 체크하면 체크되게 체크박스 체크해제하면 체크해제되는 기능 
/*           $(function(){
        	$('#memberCheckbox').on('change', function(){
        		let $memDetailCheck = $(this).prop('checked');
        		let $delList = [];
        		console.log('this>?',$memDetailCheck);
        		 if($memDetailCheck == true){
						$delList.push($(this).val());
 			       		console.log('val?',$delList);
        		 } else {
        			$memDetailCheck = false;
        		} 
        	})
        })  
*/        	
/**
 * // 회원상세를 볼 회원 행(tr)을 클릭시 체크박스 체크되는 기능
/*          $(function(){
        	$('#memAllList > tr').on('click', function(){
        		let $mc = $(this).children().eq(0).find('input:checkbox');
        		console.log('체크 전 >', $mc.prop('checked'));
        		if($mc.prop('checked') == false){
        			$($mc).prop('checked', true);
        			console.log('체크 후 >true 변환 ',$mc.prop('checked'));
        		} else {
        			$($mc).prop('checked', false);
        			console.log('체크 후 >false 변환 ',$mc.prop('checked'));
        		}
        	});
        });  
 */ 
/** 페이징바 다음 스크립트에 위치
 * // 회원 리스트 페이징처리 함수
 */
       /* 	function page(e){
    			this.location.href = "<%=contextPath %>/hlmembermanage.ma?cmpage=" + e;
    		} */
/**
 * 
		/*
		$(function(){
			$('#memberupdateFormbtn').on("click", updateFormMember);
			console.log('클릭된다');
		});
		function updateFormMember(){
			$.ajax({
				url : 'hlupdatemeberForm.ma',
				data : {mno : $('.table > childredn() > eq(1).text()')},
				success : function(result){
					console.log(result);
		}
				
 */

/**
* 		// 회원 정보 조회 테이블에서 회원 행을 클릭하면 자세히보기 기능
		// Ajax 통신
		/*
		$(function(){
			$('#memAllList > tr').on("click", detailMember);
		});
		function detailMember(){
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : 'hldetailmember.ma',
				data : {mno : $(this).children().eq(1).text()},
				success : function(result){
					console.log(result);
					console.log('회원 상세 조회 성공');
					console.log(typeof(result.enrollDate));
					let resultStr = '';
					resultStr += '<br><br>'+ '<h2>회원 정보 상세보기</h2>'
					    	   + '<br><br>' + '<div class="container">' 
					    	   + '<div class="from-control">'
					    	   + '<table class="table">'
					      	   + '<tr>'
							   + '<th>회원번호</th>'
							   + '<td>' + result.memNo + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원이름</th>'
							   + '<td>' + result.memName + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원아이디</th>'
							   + '<td>' + result.memId + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원닉네임</th>'
							   + '<td>' + result.memNickname + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원이메일</th>'
							   + '<td>' + result.memEmail + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>가입일자</th>'
							   + '<td>' + result.enrollDate + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원등급명</th>'
							   + '<td>' + result.memGradeName + '<td>'
							   + '</tr>' 
							   + '</table>'
					           + '<br><br>'
					           + '<div id="memberdetailbtn">'
					           + '<button id="memberupdateFormbtn" class="w3-button w3-round w3-yellow">수정하기</button>' + '\t'
					           + '<button onclick="abc()" id="memberList" class="w3-button w3-round w3-yellow">목록으로</button>'
					           + '</div>'
					           + '</div>'
					   		   + '</div>';
							   
					$('.rs-content').html(resultStr);
				},
				error : function(result){
					console.log('회원 상세 조회 실패');
					$('.rs-content').text('회원 상세 조회가 되지 않습니다');
				}
				
			})
		};
*/
