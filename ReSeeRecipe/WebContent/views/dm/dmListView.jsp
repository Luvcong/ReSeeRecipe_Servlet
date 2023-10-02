<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.dm.model.vo.Dm" %>       
<%
	ArrayList<Dm> list = (ArrayList<Dm>)request.getAttribute("list");
	int waitingCount = (int)request.getAttribute("waitingCount");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[문의관리] 쪽지함관리</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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

<<<<<<< HEAD
	<%@ include file="../manager/manager.jsp" %>
=======
	<%@ include file="../manager/navbar.jsp" %>
>>>>>>> 5ab6a8648967725588603a07959b7739691bed44

    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [문의 관리] 쪽지함 관리
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    미답변 <span class="waiting"><%= waitingCount %></span> 개 / 답변완료 <span class="replied"><%= list.size() - waitingCount %></span>개
                </div>
                <div >
                    <div class="btn btn-sm btn-warning" onclick="showDmRepliedModal()">쪽지 답변</div>
                    <div class="btn btn-sm btn-secondary">쪽지 삭제</div>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>등록일<div class="sort"></div></th>
                        <th data-idx=3>아이디<div class="sort"></div></th>
                        <th data-idx=4>닉네임<div class="sort"></div></th>
                        <th data-idx=5>쪽지 문의내용<div class="sort"></div></th>
                        <th data-idx=6>답변여부<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
                <% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="6">받은 쪽지가 없습니다</td>
	                </tr>
	            <% } else { %>
	            	<% for(Dm dm : list) { %>    
	                    <tr>
	                        <td><input type="checkbox" checked></td>
	                        <td><%= dm.getDmNo() %></td>
	                        <td><%= dm.getSendDate() %></td>
	                        <td><%= dm.getMemId() %></td>
	                        <td><%= dm.getMemNickname() %></td>
	                        <td><%= dm.getDmContent() %></td>
	                        <td class="<%= dm.getDmStatus().equals("Y") ? "replied" : "waiting" %>">
	                        	답변<%= dm.getDmStatus().equals("Y") ? "완료": "대기"  %>
	                        </td>
	                    </tr>
   	                <% } %>
                <% } %>     
                </tbody>
            </table>
        </div>

    	</div>  <!-- rs-content -->
    


	<!-- 쪽지답변  modal창 -->
 	<div class="modal" id="dmRepliedForm">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">쪽지 상세내역</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>	<!-- x 닫기버튼 -->
                </div>
                <!-- Modal body -->
                <div class="modal-body">
					<form method="post" action="<%= contextPath %>/repliedDm.dm">
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
								<th class="text-danger">문의 답변</th>
								<td><textarea placeholder="답변할 내용을 입력하세요"></textarea></td>
							</tr>
						</table>
					</form>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
             		 <button type="submit" class="btn btn-sm btn-warning">답변</button>
                     <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
  </div>
  
  <script>
	function showDmRepliedModal() {
		// table에 있는 tr요소 모두 선택해서 trs변수에 저장
		let trs = document.querySelectorAll('.table tr');
		// tr요소 체크여부 변수 생성
		let checked_tr = null;
		for(let tr of trs){
			// tr요소에 존재하는 input 요소를 가지고 와서 변수에 저장
			let input = tr.children[0].children[0];
			if(input.checked){
				checked_tr = tr;
				break;
			}
		}
		
		if(checked_tr == null){
			alert('선택해주세요.');
			return;
		}
		
		let modal = document.getElementById('dmRepliedForm');
		let modal_trs = modal.querySelectorAll('table tr');
		
		modal_trs[0].children[1].textContent = checked_tr.children[3].textContent;
		modal_trs[1].children[1].textContent = checked_tr.children[4].textContent;
		modal_trs[2].children[1].textContent = checked_tr.children[2].textContent;
		modal_trs[3].children[1].textContent = checked_tr.children[5].textContent;
		
		$('#dmRepliedForm').modal('show');
	}
	</script>
  
  
  <script>
	$(function() {
		$('.table th').on('click', sortTable);
	})
	
	
	function sortTable(){
		let idx = parseInt(this.getAttribute('data-idx'));
		let type = this.getAttribute('data-type');
		
		let tbody = document.querySelector('.table tbody');
		let rows = Array.from(tbody.children);
		rows.sort(function (a, b) {
			let childA = a.children[idx];
			let childB = b.children[idx];

			let tarA = childA.textContent;
			let tarB = childB.textContent;
			if(type == 'num')
			{
				tarA = parseInt(tarA);
				tarB = parseInt(tarB);
			}
			if(tarA < tarB)
				return -1;
			
			if(tarA > tarB)
				return 1;
			
			return 0;
		});
		
		
		tbody.appendChild(rows);
	}
</script>
</body>
</html>