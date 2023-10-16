<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.reward.model.vo.Reward, com.kh.semi.common.model.vo.PageInfo" %> 
<%
	ArrayList<Reward> list = (ArrayList<Reward>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String failMsg = (String)session.getAttribute("failMsg");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int rewardListCount = pi.getListCount();
	int rewardListPage = pi.getCurrentPage();
	int rewardStartPage = pi.getStartPage();
	int rewardEndPage = pi.getEndPage();
	int rewardMaxPage = pi.getMaxPage();
%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[리워드관리] 리워드 관리</title>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
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
.modal input {
    width: 100%;
    height: 40px;
    cursor: pointer;
    border: none;
    text-align: center;
}
.searchTable{
	padding: 0 10px;
}
.paging-area{
	padding-top: 65px;
	text-align: center;
}

.reward-plus {
	color: dodgerblue;
}
.reward-minus {
	color: red;
}
</style>

</head>
<body>
	
	<%@ include file="../../manager/navbar.jsp" %>
	
	<div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [메뉴 관리] 리워드 관리
            </div>
            
            <div class="searchTable">
            	<table>
            		<tr>
            			<td>
            			    <select name="searchDrop">
								<option value="all">전체</option>
								<option value="memId">아이디</option>
								<option value="memNickname">닉네임</option>
							</select>
            			</td>
            			<td><input id="rewardSearch" type="text" placeholder="검색명을 입력하세요" size="30">
            				<button type="submit">조회</button>
           				</td>
            		</tr>
            	</table>
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">	
                    조회수 <span class="waiting"><%= pi.getListCount() %></span><span>개</span>
                </div>
                <div >
                    <button onclick="showAddRewardModal()" class="btn btn-sm btn-warning">리워드 지급 / 차감</button>
                    <button onclick="showUpdateRewardModal()"class="btn btn-sm btn-warning">리워드 상세조회</button>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table id='tb-reward' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>아이디<div class="sort"></div></th>
                        <th data-idx=3>닉네임<div class="sort"></div></th>
                        <th data-idx=4>회원등급<div class="sort"></div></th>
                        <th data-idx=5>지급일<div class="sort"></div></th>
                        <th data-idx=6>지급사유<div class="sort"></div></th>
                        <th data-idx=7>지급 포인트<div class="sort"></div></th>
                        <th data-idx=8>누적 포인트<div class="sort"></div></th>
                        <th data-idx=9 style="display: none">회원번호<div class="sort"></div></th>
                        <th>
	                    </tr>
                </thead>
                <tbody>
                	<% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="9">회원 리워드 내역이 없습니다</td>
	                </tr>
	                <% } else { %>
	                	<% for(Reward reward : list) { %>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%= reward.getRewardNo() %></td>
	                        <td><%= reward.getMemId() %></td>
	                        <td><%= reward.getMemNickname() %></td>
	                        <td><%= reward.getMemGradeName() %></td>
	                        <td><%= reward.getRewardDate() %></td>
	                        <td><%= reward.getRewardReason() %></td>
	                        <td><%= reward.getRewardScore() %></td>
	                        <td><%= reward.getSumRewardScore() %></td>
	                        <td style="display: none"><%= reward.getMemNo() %></td>
	                    </tr>
	                    <% } %>
	                <% } %>
                </tbody>
            </table>	<!-- tb-category -->
        </div>	<!-- tableBody  -->
        
    <!-- 리워드 지급/차감 modal창 -->
	<div class="modal" id="updateRewardForm">
		<form method="post" action="<%= contextPath %>/jhupdate.rw">
		       <div class="modal-dialog">
		           <div class="modal-content">
		               <!-- Modal Header -->
		               <div class="modal-header">
		                   <h4 class="modal-title">리워드 지급/차감</h4>
		                   <button type="button" class="close" data-dismiss="modal">&times;</button>	<!-- x 닫기버튼 -->
		               </div> 
		               <!-- Modal body -->
		               <div class="modal-body">
							<input type="hidden" name="memNo">
							<table class="modal-table" border="1">
								<tr>
									<th>선택</th>
									<td>
 										<select name="selectReward" onchange="changeColor()">
 											<option value="">유형 선택</option>
											<option class="reward-plus" value="plusReward">리워드 지급</option>
											<option class="reward-minus" value="minusReward">리워드 차감</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>회원 아이디</th>
									<td></td>
								</tr>
								<tr>
									<th>회원 닉네임</th>
									<td></td>
								</tr>
								<tr>
									<th>리워드 포인트</th>
									<td><input type="number" name="rewardScore" id="reward-score" min="0" placeholder="리워드 금액(숫자)을 입력하세요"></td>
								</tr>
								<tr>
									<th>리워드 사유<div style="color: rgb(78, 78, 78)"><span class="replied" id="count">0</span> / 500 byte</div></th>
									<td><textarea id="reward-textarea" name="rewardReason" onkeyup="checkedByte(this)" placeholder="&#10;&#10;&#10;지급/사유 내용을 입력하세요&#10;(최대 500byte)"></textarea></td>
								</tr>
							</table>
		               </div>
		               <!-- Modal footer -->
		                <div class="modal-footer">
		             		<button type="submit" class="btn btn-sm btn-warning" id="nullCheck" disabled onclick="checkReward()">완료</button>
		                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
		                </div>
		            </div>
		        </div>
		</form>
	 </div>	<!-- 리워드 지급/차감 modal창 -->
        
   	<!-- 페이징바 -->
	<div class="paging-area">
		<% if(rewardListPage != 1) { %>
			<button onclick="page('<%= rewardListPage -1 %>');" class="btn btn-warning">&lt;</button>
		<% } %>
		<% for(int i = rewardStartPage; i <= rewardEndPage; i++) { %>
			<% if(rewardListPage != i) { %>
				<button onclick="page('<%= i %>');" class="btn btn-warning"><%= i %></button>
			<% } else { %>
				<button disabled class="btn btn-warning"><%= i %></button>
			<% } %>
		<% } %>
		<% if(rewardListPage != rewardMaxPage) { %>
			<button onclick="page('<%= rewardListPage + 1 %>');" class="btn bbtn-warning">&gt;</button>
		<% } %>
	</div>	<!-- 페이징바 -->
   	</div>  <!-- rs-content -->
	
	<script>
		function page(element){
			this.location.href = "<%= contextPath %>/jhselect.rw?page=" + element;
		}
	</script>
	
	
	<!-- alertMsg script -->
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
	
	<!-- 글자 Byte 수 체크 -->
	<script>
		let limitByte = 500;
		let totalByte;
	
		function checkedByte(obj){		
			totalByte = 0;
			let message = $(obj).val();
			console.log(message);
			
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
	
	<!-- 리워드 지급/차감 modal창 -->
	<Script>
		
		// 리워드 지급/차감에 따른 색상 변경
		function changeColor(){
			let input = document.getElementById('reward-score');
			// console.log(input);
			
			// select 태그 색상 변경
			// reward-score 색상 변경
			// console.log(this);			// window 객체..
			// console.log(event.target);	// select 값ok
			if(event.target.value == 'plusReward'){
				input.style.color = 'dodgerblue';
			}
			else {
				input.style.color = 'red';
			}
			
			// null처리
			// 유형이 없을 경우 > confrim 버튼 disable로 변경
			let confirm = document.querySelector('#nullCheck');
			// console.log(confirm);
			if(event.target.value == null || event.target.value == ""){
				confirm.setAttribute('disabled', true);
				return;
			}
			confirm.removeAttribute('disabled');
		}	// changeColor()
		
		// reward-score가 null이거나 "" 이면 disable? alert..
		function checkReward(){
			let reward = document.querySelector('#reward-score');
			console.log(reward);
			// let reward = document.getElementById('reward-score');
			if(reward.value == null || reward.value == ''){
				event.preventDefault();		// submit event 막아주기
				Swal.fire('실패', '리워드 금액을 입력하세요!', 'error');
				return;
			}
		}
		
		// 리워드 지급
		function showAddRewardModal(){
			let trs = document.querySelectorAll('.tableBody tbody tr');	// .tbody의 tr요소 모두 저장
			console.log(trs);		// 값 ok
			
			let checked_tr = null;
			
			for(let tr of trs){
				let input = tr.querySelector('input');
				console.log(input);
				if(input.checked){
					checked_tr = tr;	// input.checked속성이 true이면 변수에 저장
					console.log(checked_tr);
					break;
				}
			}
			
			// null 체크
			if(checked_tr == null){
				Swal.fire('실패', '회원을 선택해주세요!', 'error');
				return;
			}
			
			let modal = document.querySelector('#updateRewardForm');
			let modal_tds = modal.querySelectorAll('table tr td');
			// console.log(modal_tds);	// 값 ok

			// 회원아이디
			let memId = checked_tr.children[2].textContent;
			console.log('memId : ' + memId);	// 값 ok
			
			// 회원No
			let memNo = checked_tr.children[9].textContent;
			console.log('memNo : ' + memNo);	// 값 ok
			let hidden_input = modal.querySelector('input[name="memNo"]');
			hidden_input.value = memNo;
			console.log('hidden_input : ' + hidden_input)

			
			// 회원닉네임
			let memNickname = checked_tr.children[3].textContent;
			console.log('memNickname : ' + memNickname);	// 값 ok
			
			modal_tds[1].textContent = memId;
			modal_tds[2].textContent = memNickname;
			
			$('#updateRewardForm').modal('show');
		}	// showAddRewardModal
	</Script>
	
	
	
	
</body>
</html>