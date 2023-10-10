<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.dm.model.vo.Dm" %>       
<%
	ArrayList<Dm> list = (ArrayList<Dm>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String failMsg = (String)session.getAttribute("failMsg");
	int waitingCount = (int)request.getAttribute("waitingCount");
	int repliedCount = list.size() - waitingCount;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[문의관리] 쪽지함관리</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.sort {
	display: inline-block;
	padding-left: 10px;
	color: darkgray;
}
.table th:hover {
	cursor: pointer;
}
.asc::before {
	content: "\25B2";
}
.desc::before {
	content: "\25BC";
}
.modal .modal-title{
	text-align: center;
	font-weight: bold;
}
.modal .modal-content{
	background-color: rgb(255, 217, 64);
    padding: 5px 20px 30px 20px;
}
.modal .modal-body, .modal .modal-footer{
	background-color: white;
	padding:0;
}
.modal .modal-footer{
	height: 50px;
	border: 1px solid gray;
	justify-content: center;
}
.modal-table {
	width:100%;
	text-align: center;
}
.modal-table th {
	width: 170px;
}
.modal-table tr {
	height: 40px;
}
.modal textarea {
	width:100%;
	height: 200px;
	resize: none;
	text-align: center;
	border: none;
}
</style>

</head>
<body>
	
	<%@ include file="../../manager/navbar.jsp" %>

    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [문의 관리] 쪽지함 관리
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    미답변 <span class="waiting"><%= waitingCount %></span> 개 / 답변완료 <span class="replied"><%= repliedCount %></span>개
                </div>
                <div >
                    <button class="btn btn-sm btn-warning" onclick="showDmRepliedModal()">쪽지 답변</button>
                    <button class="btn btn-sm btn-secondary" onclick="deleteDm()">쪽지 삭제</button>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table id='tb-dm' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox" onclick="checkAll(this)" class="dmCheck" id="all"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>등록일<div class="sort"></div></th>
                        <th data-idx=3>아이디<div class="sort"></div></th>
                        <th data-idx=4>닉네임<div class="sort"></div></th>
                        <th data-idx=5>쪽지 문의내용<div class="sort"></div></th>
                        <th data-idx=6>답변여부<div class="sort"></div></th>
                        <th data-idx=7 style="display: none">답변내용<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
                <% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="7">받은 쪽지가 없습니다</td>
	                </tr>
	            <% } else { %>
	            	<% for(Dm dm : list) { %>    
	                    <tr>
	                        <td><input type="checkbox" class="chk"></td>
	                        <td><%= dm.getDmNo() %></td>
	                        <td><%= dm.getSendDate() %></td>
	                        <td><%= dm.getMemId() %></td>
	                        <td><%= dm.getMemNickname() %></td>
	                        <td><%= dm.getDmContent() %></td>
	                        <td class="<%= dm.getDmStatus().equals("Y") ? "replied" : "waiting" %>">
	                        	답변<%= dm.getDmStatus().equals("Y") ? "완료": "대기"  %>
	                        </td>
	                        <td style="display: none"><%= dm.getDmReply() %></td>
	                    </tr>
   	                <% } %>
                <% } %>   
                </tbody>
            </table>
        </div>

    	</div>  <!-- rs-content -->

	<!-- 쪽지답변  modal창 -->
 	<div class="modal" id="dmRepliedForm">
		<form method="post" action="<%= contextPath %>/jhupdate.dm">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">쪽지 상세내역</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>	<!-- x 닫기버튼 -->
	                </div> 
	                <!-- Modal body -->
	                <div class="modal-body">
							<input type="hidden" name="dmNo">
							<table class="modal-table" border="1">
								<tr>
									<th>회원 아이디</th>
									<td></td>
								</tr>
								<tr>
									<th>회원 닉네임</th>
									<td></td>
								</tr>
								<tr>
									<th>쪽지 발송시간</th>
									<td></td>
								</tr>
								<tr>
									<th class="text-primary">문의 내용</th>
									<td height="200px"></td>
								</tr>
								<tr>
									<th class="text-danger">문의 답변<div style="color: gray"><span id="count">0</span>/500 byte</div></th>
									<td><textarea id="reply-textarea" name="dmReply" onkeyup="checkedByte(this)" placeholder="&#10;&#10;&#10;답변할 내용을 입력하세요&#10;(최대 500byte)"></textarea></td>
								</tr>
							</table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer">
	             		<button type="submit" class="btn btn-sm btn-warning">답변</button>
	                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
	                </div>
	            </div>
	        </div>
	</form>
  </div>

  <!-- 쪽지 글자 byte count -->
	<script>
		let limitByte = 500;
		let totalByte;
		
		function checkedByte(obj){
			totalByte = 0;
			let message = $(obj).val();
		
			for(let i = 0; i < message.length; i++){
				var countByte = message.charCodeAt(i);
				if(countByte > 128){
					totalByte += 3;
				} else {
					totalByte++;
				}
			}
			$('#count').text(totalByte);
		}	// checkedByte
	</script>
  
	<!-- alertMsg script : DmListController에서 사용 -->
	<script>
		var successMsg = '<%= successMsg %>';
		var failMsg = '<%= failMsg %>';
		
		if(successMsg != 'null'){
			Swal.fire('성공', successMsg, 'success');	// alert대신 swal 라이브러리 사용
		}
		
		if(failMsg != 'null'){
			Swal.fire('실패', failMsg, 'error');
		}
		
		<% session.removeAttribute("successMsg"); %>
		<% session.removeAttribute("failMsg"); %>
	</script>
  
  <!-- 쪽지답변 modal창 내부 값 -->
	<script>
		function showDmRepliedModal() {
			// table에 있는 tr요소 모두 선택해서 trs변수에 저장
			let trs = document.querySelectorAll('.table tbody tr');
			
			// tr요소 체크여부 변수 생성
			let checked_tr = null;
			
			for(let tr of trs){
				// tr요소에 존재하는 input 요소를 가지고 와서 변수에 저장
				let input = tr.querySelector('input')
				if(input.checked){
					checked_tr = tr;
					break;	// 첫번째 선택 요소를 갖고 오기 위해 (미작성시, 마지막 선택 요소)
				}
			}
			
			if(checked_tr == null){
				Swal.fire('실패', '쪽지를 선택해주세요!', 'error');
				return;
			}
			
			let modal = document.getElementById('dmRepliedForm');
			let modal_trs = modal.querySelectorAll('table tr');
			
			let dmNo  = checked_tr.children[1].textContent;	// dmNo
			let input = modal.querySelector("input[name='dmNo']");
			input.value = dmNo;
			// console.log(input);
			
			let textarea = document.getElementById('reply-textarea');
			
			modal_trs[0].children[1].textContent = checked_tr.children[3].textContent;	// 아이디	-- 추후 수정(반복문사용)
			modal_trs[1].children[1].textContent = checked_tr.children[4].textContent;	// 닉네임
			modal_trs[2].children[1].textContent = checked_tr.children[2].textContent;	// 발송시간
			modal_trs[3].children[1].textContent = checked_tr.children[5].textContent;	// 쪽지내용
			
	/* 		if(textarea.value != 'null'){
				textarea.readOnly = true;
				textarea.value = checked_tr.children[7].textContent;
				console.log(textarea.value);
			}
			
			if(textarea.value == 'null'){
				textarea.readOnly = false;
				textarea.value = '';
			} */
			
			let replied_txt = checked_tr.children[7].textContent;
			if(replied_txt == 'null'){
				replied_txt = ''; 
			}
			
			textarea.value    = replied_txt;
			textarea.readOnly = (replied_txt != '');
			
	 		checkedByte(document.getElementById('reply-textarea'));
			
			$('#dmRepliedForm').modal('show');
		}
	</script>
	
	<!-- 쪽지 삭제 -->
	<script>
		function deleteDm(){
			let trs = document.querySelectorAll('.table tr');	// showDmRepliedModal()와 중복코드 - 추후 수정예정
			let checked_tr = null;
			
			for(let tr of trs){
				let input = tr.querySelector('input');
				if(input.checked){
					checked_tr = tr;
					break;
				}
			}
			
			if(checked_tr == null){
				Swal.fire('실패', '쪽지를 선택해주세요!', 'error');
				return;
			}
			
			Swal.fire({
				title: "쪽지를 삭제하시겠습니까?",
				text : "※ 삭제 후 복원이 불가합니다",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "삭제",
				cancelButtonText: "취소"
				}).then((result) => {
					if (!result.isConfirmed) {
					  return;
					}
				  
				  	let table = document.getElementById('tb-dm');
				  	let trs = table.querySelectorAll('tbody tr');
					let dm_list = {};
					
					for(let tr of trs){
						let input = tr.querySelector('input');			// input요소
						if(input.checked == true){
							let key = tr.children[1].textContent;		// dmNo
							let val = tr.children[6].classList.contains('replied');	// boolean : true or false인지
							// 속성 추가시 obj[key] = value;
							dm_list[key] = val; // dmNo = true or dmNo = false
						}
					}
					// dm_list = ['100','101','102','103']; // 실패테스트
					// Object.keys 설명
					// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Object/keys
		 			$.ajax({
		 				url : 'jhdelete.dm',
						type : 'get',
						dataType: 'json',
						data : {'dmNo' : Object.keys(dm_list)},
						success : function(result){
							for(let tr of trs){
								let dmNo = parseInt(tr.children[1].textContent);	
								if(result.includes(dmNo)){		// dmNo를 포함하는 문자열이 있으면 == true
									tr.remove();				// 해당 tr remove
								}
							}
							
							// 답변완료 or 답변대기 count
							let header = document.querySelector('.rs-content .header');
							let waiting = header.querySelector('.waiting');
							let replied = header.querySelector('.replied');
							
							let waiting_cnt = <%= waitingCount%>;
							let replied_cnt = <%= repliedCount %>;
							
							for(let key in dm_list) {
								if(dm_list[key] == true){
									replied_cnt -= 1;	// 답변완료 숫자 -1개 
								}
								else {
									waiting_cnt -= 1;	// 답변대기 숫자 -1개
								}
							}
							waiting.textContent = waiting_cnt;
							replied.textContent = replied_cnt;
							
							//swal("성공", "쪽지 삭제가 완료되었습니다!", "success");
						},
						error: function(result) {
							console.log('실패');
						},
						complete : function (result) {
						    Swal.fire('성공', '쪽지 삭제가 완료되었습니다!', 'success');
							/* console.log(result.responseJSON);
							for(let tr of trs) {
								let dmno = parseInt(tr.children[1].textContent);
								if(result.responseJSON.includes(dmno)){
									tr.remove();
								}
							} */
						}
					});
				});
			
			/* 			let table = document.getElementById('tb-dm');
			let trs = table.querySelectorAll('tr');
			
			let dm_list = [];
			
			for(let tr of trs){
				let input = tr.children[0].children[0];			// input요소
				if(input.checked == true){
					dm_list.push(tr.children[1].textContent);	// dmNo
				}
			}
			
			// dm_list = ['100','101','102','103']; // 실패테스트
 			$.ajax({
 				url : 'jhdelete.dm',
				type : 'get',
				dataType: 'json',
				data : {'dmNo' : dm_list},
				complete : function () {
					//$('#tb-dm').load();
					window.location.reload();		// 새로고침 방법 다시 작성해보기
				}
			}) */
		}
	</script>
  
  
  <!-- 컬럼 sort -->
  <script>

/* 	$(function checkAll(){
		$('dmCheck').on('change', function(){
			if($(this).prop('checked') == false){
				$('#all').prop('checked', false);
			}
		});

		$('#all').on('change', function(){
			let $all = $('#all').prop('checked');
			console.log($all);		// true
			if($all){
				$('.dmCheck .chk').prop('checked', true);
			}
			else {
				$('.dmCheck .chk').prop('checked', false);
			}
		})
	}); */
	
	$(function() {
		$('.table th').on('click', sortTable);
	})
	
	function checkAll(element){
		// console.log(element);	// input요소 (table의 헤더부분)
		
		let table = document.getElementById('tb-dm');
		let inputs = document.querySelectorAll('tr input');
		
		// console.log(table);		// 테이블 값 확인 ok
		// console.log(inputs);	// 헤더 체크박스 값 ok
		
		// 헤더 체크박스 클릭시 == checked속성 true > 전체 체크되도록
		// 헤더 체크박스 해제시 == checked속성 false > 전체 해제되도록 
		
		// element의 checked속성이 true인경우 체크 == table의 모든 tr > input 요소가 checked
		// element의 checked속성이 false인 경우 똑같이 flase로 해주어야 함
		// 즉, element.checked == table tr input.checked가 서로 일치하다는 의미
		for(let input of inputs){
			input.checked = element.checked;	// element.checked가 해제/선택일때의 경우 모두 input에 넣음
		}
		
			// 기능 추가 예정
		// table tr input.checked가 하나라도 false가 된다면
		// element의 checekd속성도 false가 되어야 한다
		
		// 체크되어 있는 개수 확인
		// 체크박스 전체 개수
		// 서로 일치하면 true / 일치하지 않으면 false
		
		
	}	// checkAll
		
	function sortTable(){
		
		// this -> th 선택한 나 자신이양~~
		let idx = parseInt(this.getAttribute('data-idx'));
		if(idx == 0){								// data-idx == 0이면
			// checkAll(this.children[0]);				// input요소를 주고 종료 체크는 정렬아뉘니까
			// console.log(this.children[0]);
			return;
		}
		
		let type = this.getAttribute('data-type');	// num
		
		let tbody = document.querySelector('.table tbody');
		let rows = Array.from(tbody.children); // HTMLCollection 객체이기 때문에 Array로 변환 == 유사배열이기 때문	
											   // https://ko.javascript.info/searching-elements-dom
											   // https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/from
		
		// 현재 sort 상태가 뭔지 저장하기위한 변수
		let is_desc = false;
		
		// 1) 모든 th 목록의 desc/asc 클래스를 제거 > 선택된 th요소 class에만 desc/asc 추가
		let ths = document.querySelectorAll('.table th');
		for(let th of ths) {
			let sort = th.children[0];	// input

			// th요소가 현재 선택된 th인 경우
			if(th == this){
				// 내림차순인지 확인
				is_desc = sort.classList.contains('desc');	// 화살표
				
				// 내림차순이면 오름차순으로 변경
				if(is_desc){
					sort.classList.remove('desc');
					sort.classList.add('asc');
				}
				// 내림차순이 아니면 내림차순으로 변경
				else{
					sort.classList.remove('asc');
					sort.classList.add('desc');
				}
			}	// if
			
			// 선택된 th 요소가 아닌경우 asc/desc 클래스를 모두 삭제 (화살표)
			else {
				sort.classList.remove('desc');
				sort.classList.remove('asc');
			}
		}	// for
		
		
/* 		sort함수 참고 -- 삭제예정 (오름차순 기준)
 		rows.sort(function(a, b) {
			if(a < b)
				return -1;
			
			if(a > b)
				return 1;
			
			if(a==0)
				return 0;
		}) */
		
		// 2) 실제 정렬 작업을 하는 부분
		rows.sort(function (trA, trB) {					// Array.from이용한 변수 rows사용
			let txtA = trA.children[idx].textContent;
			let txtB = trB.children[idx].textContent;
			// console.log(txtA);
			// console.log('****************');
			// console.log(txtB);

			
			if(type == 'num')
			{
				txtA = parseInt(txtA);
				txtB = parseInt(txtB);
				// console.log(txtA);
			} 
			
			if(txtA < txtB){
				return is_desc ? -1 : 1;	// 내림차순이면 -1
			}
			else if(txtA > txtB){
				return is_desc ? 1 : -1;	// 내림차순 아니면(오름차순) 1
			}
			else {
				return 0;				
			}
		});
		
		for(let tr of rows){				// 반복문으로 tbody에 tr영역 추가해서 계속 비교되게끔 해주어야 함
			tbody.append(tr);
		}
		
	}
</script>

</body>
</html>