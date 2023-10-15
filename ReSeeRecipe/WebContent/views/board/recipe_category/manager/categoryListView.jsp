<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.board.recipe.model.vo.RecipeCategory, com.kh.semi.common.model.vo.PageInfo" %> 
<%
	ArrayList<RecipeCategory> list = (ArrayList<RecipeCategory>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String failMsg = (String)session.getAttribute("failMsg");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int categoryListCount = pi.getListCount();
	int categoryListPage = pi.getCurrentPage();
	int categoryStartPage = pi.getStartPage();
	int categoryEndPage = pi.getEndPage();
	int categoryMaxPage = pi.getMaxPage();
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[메뉴관리] 카테고리 관리</title>

<!-- sweetalert -->
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
/* .modal-table th {
	width: 130px;
} */
.modal-table tr {
	height: 50px;
}
.modal-table tr td > label {
	font-size: 12px;
}
.modal input {
    width: 100%;
    height: 50px;
    cursor: pointer;
    border: none;
    text-align: center;
}

.paging-area{
	text-align: center;
	padding: 65px;
}

.searchTable{
	padding: 0 10px;
}

#updateCategoryForm th{
	width: 170px;
	height: 80px;
}
#updateCategoryForm td input{
	height: 80px;
}
.list-btn{
	text-align: center;
    padding-top: 30px;
}


</style>

</head>
<body>

	<%@ include file="../../../manager/navbar.jsp" %>
	
    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [메뉴 관리] 카테고리 관리
            </div>
            <div class="searchTable">
            <!-- <form action="<%= contextPath %>/jhcheck.ct" method="post"> -->
            	<table id="check-table">
            		<tr>
            			<td><input id="checkName" name="checkCategoryName" onkeydown="checkSearchName()" type="text" placeholder="검색할 카테고리명을 입력하세요" size="30"><button onclick="checkCategory()" >조회</button></td>
            		</tr>
            	</table>
            <!-- </form> -->
            </div>	<!-- searchTable -->
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    조회수 <span class="waiting"><%= pi.getListCount() %></span><span>개</span>
                </div>
                <div >
                    <button onclick="showAddCategorydModal()" class="btn btn-sm btn-warning">카테고리 추가</button>
                    <button onclick="showUpdateCategoryModal()"class="btn btn-sm btn-warning">카테고리 수정</button>
                    <button onclick="deleteCategory()" class="btn btn-sm btn-secondary">카테고리 삭제</button>
                </div>
            </div>
        </div>
        <div class="tableBody">
            <table id='tb-category' class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th data-idx=0><input type="checkbox"></th>
                        <th data-idx=1 data-type="num">번호<div class="sort"></div></th>
                        <th data-idx=2>카테고리명<div class="sort"></div></th>
                        <th data-idx=3>게시글 수<div class="sort"></div></th>
                    </tr>
                </thead>
                <tbody>
                	<% if(list == null || list.isEmpty()) { %>
   	                <tr>
	                    <td colspan="4">등록한 카테고리가 없습니다</td>
	                </tr>
                    <% } else { %>
                    	<% for(RecipeCategory recipeCategory : list) { %>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%= recipeCategory.getRecipeCategoryNo() %></td>
	                        <td><%= recipeCategory.getRecipeCategoryName() %></td>
	                        <td><%= recipeCategory.getRecipeCategoryCount() %></td>
	                    </tr>	
	                    <% } %>
					<% } %>    
                </tbody>
            </table>	<!-- tb-category -->
        </div>	<!-- tableBody  -->
        
	   	<!-- 페이징바 -->
		<div class="paging-area">
			<% if(categoryListPage != 1) { %>
				<button onclick="page('<%= categoryListPage -1 %>');" class="btn btn-warning">&lt;</button>
			<% } %>
			<% for(int i = categoryStartPage; i <= categoryEndPage; i++) { %>
				<% if(categoryListPage != i) { %>
					<button onclick="page('<%= i %>');" class="btn btn-warning"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-warning"><%= i %></button>
				<% } %>
			<% } %>
			<% if(categoryListPage != categoryMaxPage) { %>
				<button onclick="page('<%= categoryListPage + 1 %>');" class="btn bbtn-warning">&gt;</button>
			<% } %>
		</div>	<!-- 페이징바 -->
		
		<div style="display: none" class="list-btn">
			<!-- 카테고리 삭제 후 눌렀을경우 history.back은 바로 반영이 되지 않음 -->
			<!-- <button type="button" class="btn btn-sm btn-outline-info" onclick="history.back()">목록으로</button>  -->
			<button type="button" class="btn btn-sm btn-outline-info" onclick="location.href = '<%=contextPath %>/jhselect.ct?page=1';">목록으로</button>
		</div>
	
   	</div>  <!-- rs-content -->
   	
   	
	<!-- 카테고리 추가  modal창 -->
 	<div class="modal" id="addCategoryForm">
		<form method="get" action="<%= contextPath %>/jhinsert.ct">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">카테고리 추가</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>	<!-- x 닫기버튼 -->
	                </div> 
	                <!-- Modal body -->
	                <div class="modal-body">
							<input type="hidden" name="categoryListPage">
							<table class="modal-table" border="1">
								<tr>
									<th>카테고리명</th>
								</tr>
								<tr>
									<td><input type="text" name="recipeCategoryName">
									<label for="recipeCategoryName"></label>
									</td>
								</tr>
							</table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer">
	             		<button type="submit" class="btn btn-sm btn-warning">추가</button>
	                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
	                </div>
	            </div>
	        </div>
	</form>
  	</div>	<!-- 카테고리 추가 modal -->
  
	<!-- 카테고리 수정  modal창 -->
	<div class="modal" id="updateCategoryForm">
		<form method="post" action="<%= contextPath %>/jhupdate.ct">
			<div class="modal-dialog modal-lg">
			    <div class="modal-content">
			        <!-- Modal Header -->
				     <div class="modal-header">
				         <h4 class="modal-title">카테고리 수정</h4>
				         <button type="button" class="close" data-dismiss="modal">&times;</button>	<!-- x 닫기버튼 -->
				     </div> 
				     <!-- Modal body -->
			         <div class="modal-body">
					<input type="hidden" name="dmNo">
					<table class="modal-table" border="1">
						<tr>
							<th>기존 카테고리명</th>
							<td><input type="text" name="categoryName" readonly></td>
						</tr>
						<tr>
							<th>현재 게시글 수</th>
							<td><input type="text" name="boardCount" readonly></td>
						</tr>
						<tr>
							<th>변경 카테고리명<div style="color: rgb(78, 78, 78)"><span class="replied" id="count">0</span> / 20 byte</div></th>
							<td>
								<input type="text" name="categoryUpdateName" placeholder="변경 카테고리명을 입력하세요" onkeyup="checkedByte(this)">
							</td>
						</tr>
					</table>
		          	</div>
		          	<!-- Modal footer -->
		            <div class="modal-footer">
		         		<button type="submit" class="btn btn-sm btn-warning">수정</button>
		                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
		            </div>
		    	</div>	<!-- modal-content -->
		    </div>	<!-- modal-dialog  -->
		</form>
	</div>	<!-- 카테고리 수정 modal -->
  
  <!-- 페이징바 -->
  <script>
		function page(element){
			this.location.href = "<%= contextPath %>/jhselect.ct?page=" + element;
		}
  </script>
  
  <!-- 카테고리 추가 modal -->
  <script>
  		function showAddCategorydModal(){
  			$('#addCategoryForm').modal('show');
  		}	// showAddCategorydModal
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
  
  <script>
	function checkSearchName(){
		console.log(event.code);
		if(event.code == 'Enter'){
			checkCategory();	
		}
	}

  </script>

  <!-- 카테고리 삭제 -->
  <script>
	
  		function deleteCategory(){
  			let trs = document.querySelectorAll('.table tbody tr');	// 데이터가 들어있는 행(tr) 모두 갖고와서 저장
  			let checked_tr = null									// tr체크여부 변수 생성
  			
  			for(let tr of trs){
  				let input = tr.querySelector('input');			// tr의 input 요소 저장
  					if(input.checked){							// input의 checked 속성이 true인 경우
  						checked_tr = tr;						// tr체크여부 변수에 checked == true인 행(tr)을 저장한다
  						break;									// input요소가 여러개인 경우 첫번째에 해당하는 요소만 선택하기 위해 break
  					}
  			}
  			// console.log(checked_tr);
  			
  			// 체크되어 있는 카테고리가 없을 경우 alert창 발생
  			if(checked_tr == null){
  				Swal.fire('실패', '카테고리를 선택해주세요!', 'error');
  				return;
  			}
  			
  			// 체크가 되어있는 경우 confirm창 발생
			Swal.fire({
				title: "카테고리를 삭제하시겠습니까?",
				text : "※ 삭제 후 복원이 불가합니다. ",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "삭제",
				cancelButtonText: "취소"
				}).then((result) => {
					if (!result.isConfirmed) {
					  return;
					}
					
					// 카테고리 번호
					// 1) 카테고리 번호를 넘기고 > 레시피 테이블에서 해당 카테고리 NO에 일치하는 데이터만 STATUS = N && CATEGORY_NO = 0 으로 변경
					// 2) 카테고리 테이블에서 해당 카테고리를 0번으로 변경 or 카테고리 STATUS = N으로 변경
  					let table = document.getElementById('tb-category');			
					let trs = table.querySelectorAll('tbody tr');		// 데이터 행 부분
					// let categoryNo_list = [];		// categoryNo 저장위해 배열 생성
					// let categoryCount_list = [];		// categoryCount 저장위해 배열 생성 (추가)	
					let category_list = {};				// categoryNo : categoryCount 저장을 위한 객체 생성 - ** 어차피 배열로 넘어가니까 []로 각각 선언해도 될 듯? 담에 해보기..나중에..
					
					for(let tr of trs){
						let input = tr.querySelector('input');
						// console.log(input); 				// tr input 데이터 값 확인 ok
						if(input.checked == true){
							let key = (tr.children[1].textContent);
							let val = (tr.children[3].textContent);
							// console.log(key);			// categoryNo - ok
							// console.log(val);			// categoryCount - ok
							// 속성 추가시 obj[key] = value;
							category_list[key] = parseInt(val);
							// console.log(category_list);		// {categoryNo : categoryCount} ok
							
							// categoryNo_list.push(tr.children[1].textContent);		// categoryNo
							// categoryCount_list.push(tr.children[3].textContent);	// categoryCount
							// console.log(categoryNo_list);		// categoryNo 값 확인 ok
							// console.log('***********');
							// console.log(categoryCount_list);	// categoryCount 값 확인 ok
						}
					}
					
					$.ajax({
		 				url : 'jhdelete.ct',
						type : 'get',
						data : {
								'categoryNo' : Object.keys(category_list),
								'categoryCount' : Object.values(category_list)			// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Object/values
						},
								// 'categoryNo' : categoryNo_list,				- 삭제			.keys(object1)
								// 'categoryCount' : categoryCount_list	// 추가 - 삭제
						dataType: 'json',
						success : function(result){
							
							Swal.fire('성공', '카테고리 삭제가 완료되었습니다!', 'success');
							
							let removeCategoryCount = 0;
							
							for(let tr of trs){
								let categoryNo = parseInt(tr.children[1].textContent);	
								if(result.includes(categoryNo)){		// categoryNo를 포함하는 문자열이 있으면 == true
									tr.remove();						// 해당 tr remove
									removeCategoryCount += category_list[categoryNo];
									console.log(category_list[categoryNo]);	
									// console.log(removeCategoryCount);
								}
							}
							
							// 카테고리No:0의 기존 게시글 수
							let origin_count = parseInt(trs[0].children[3].textContent);
							// console.log(origin_count);
							// 기존 게시글 수에 지워진 게시글 수만큼 ++
							trs[0].children[3].textContent = origin_count + removeCategoryCount;
								
						},	// success
						error : function(result){
							Swal.fire('실패', '카테고리 삭제가 실패되었습니다!', 'error');
							console.log('실패');
						},	// error
					});	// ajax
				});		// confrim	
  		}	// deleteCategory
  </script>	
  
  <!-- 카테고리 수정 modal -->
  <script>
  		function showUpdateCategoryModal(){
  			
 			let trs = document.querySelectorAll('.table tbody tr');	// 데이터가 들어있는 행(tr) 모두 갖고와서 저장
 			let checked_tr = null									// tr체크여부 변수 생성
 			
 			for(let tr of trs){
 				let input = tr.querySelector('input');			// tr의 input 요소 저장
 					if(input.checked){							// input의 checked 속성이 true인 경우
 						checked_tr = tr;						// tr체크여부 변수에 checked == true인 행(tr)을 저장한다
 						break;									// input요소가 여러개인 경우 첫번째에 해당하는 요소만 선택하기 위해 break
 					}
 			}
 			// console.log(checked_tr);
 			
 			// 체크되어 있는 카테고리가 없을 경우 alert창 발생
 			if(checked_tr == null){
 				Swal.fire('실패', '카테고리를 선택해주세요!', 'error');
 				return;
 			}	
 			
 			let modal = document.getElementById('updateCategoryForm');
 			let modal_trs = modal.querySelectorAll('table tr');
 			
 			// 기존게시글 input value
 			let category_name = checked_tr.children[2].textContent;
 			// console.log(category_Name);	// input check 첫번째 요소 값 ok
 			let modal_input = modal.querySelector("input[name='categoryName']");
 			modal_input.value = category_name;
 			// console.log(modal_input);
 			
 			// 기존게시글 수 input value
 			let category_count = checked_tr.children[3].textContent;
 			modal_input = modal.querySelector("input[name='boardCount']");
 			modal_input.value = category_count + '개';

 			
 			// 수정버튼 클릭시 중복여부 체크
 			// 중복값이 있는 경우 alert창
 			// let origin_name = trs[0].children[2].textContent; - 없음 출력
 			
 			
			let origin_name = checked_tr.children[2].textContent;	
 			// console.log(origin_name);	- 카테고리명 ok
 			
 			console.log(checked_tr.children[2].textContent);
 			console.log(checked_tr);
 				
  			$('#updateCategoryForm').modal('show');
  			
  		}	// showUpdateCategoryModal
  </script>
  
  <!-- jsp로 수정예정 -->
  <script>
  		function checkCategory(){
  			
  			// let test = document.getElementById('check-table');
  			// let input_test = test.querySelector('input');
  			// console.log(test);
  			// console.log(input_test.value);
  			
  			let input = document.getElementById('checkName');
  			// console.log(input);
  			// console.log(input.value);			// 값 ok
  			let checkCategoryName = input.value;
  			console.log(checkCategoryName);			// 값 ok
  			
   			$.ajax({
  				url : 'jhcheck.ct',
  				type : 'post',
  				dataType : 'json',
  				data : {'checkCategoryName' : checkCategoryName},
   				success : function(result){
   					console.log('성공');
   					
    				let resultStr = '';
    				for(let i in result){
    					resultStr += '<tr>'
    								+ '<td><input type="checkbox"></td>'
    							   + '<td>' + result[i].recipeCategoryNo + '</td>'
    							   + '<td>' + result[i].recipeCategoryName + '</td>'
    							   + '<td>' + result[i].recipeCategoryCount + '</td>'
    							   + '</tr>'
    				}
    				
    				$('#tb-category tbody').html(resultStr);
    				
    				// $('.paging-area').hide();
    				$('.list-btn').show();
    				
    				
   				},	// success
   				error : function(result){
   					console.log('실패');
   				}	// error
   				
  			}) 
 
  			
  		}
  </script>

   	
   	
   	

</body>
</html>