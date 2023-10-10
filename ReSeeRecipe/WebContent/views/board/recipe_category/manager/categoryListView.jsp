<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.board.recipe.model.vo.RecipeCategory" %>    
<%
	ArrayList<RecipeCategory> list = (ArrayList<RecipeCategory>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String failMsg = (String)session.getAttribute("failMsg");
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[메뉴관리] 카테고리 관리</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

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
	width: 130px;
}
.modal-table tr {
	height: 40px;
}
.modal input {
    width: 100%;
    height: 50px;
    cursor: pointer;
    border: none;
}
.searchTable{
	padding: 0 10px;
}
</style>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

	<%@ include file="../../../manager/navbar.jsp" %>
	
    <div class="rs-content">        
        <div class="header">
            <div class="h-title p-3">   <!-- 패딩 1rem -->
                [메뉴 관리] 카테고리 관리
            </div>
            <div class="searchTable">
            	<table>
            		<tr>
            			<td><input type="text" placeholder="검색할 카테고리명을 입력하세요" size="30"><button type="submit">조회</button></td>
            		</tr>
            	</table>
            </div>
            <div class="h-content d-flex p-3">  <!-- 패딩 1rem -->
                <div class="mr-auto">
                    조회수 <span class="waiting"><%= list.size() %></span><span>개</span>
                </div>
                <div >
                    <button onclick="showAddCategorydModal()" class="btn btn-sm btn-warning">카테고리 추가</button>
                    <button class="btn btn-sm btn-warning">카테고리 수정</button>
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
							<input type="hidden" name="dmNo">
							<table class="modal-table" border="1">
								<tr>
									<th>카테고리명</th>
									<td>
										<input type="text" name="recipeCategoryName">
									</td>
									<td><button onclick="" class="btn btn-sm btn-warning btn-serach">중복확인</button></td>
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
			swal('성공', successMsg, 'success');	// alert대신 swal 라이브러리 사용
		}
		
		if(failMsg != 'null'){
			swal('실패', failMsg, 'error');
		}
		
		<% session.removeAttribute("successMsg"); %>
		<% session.removeAttribute("failMsg"); %>
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
					// let categoryCount_list = [];		// categoryCount 저장위해 배열 생성 (추가)	-- 틀린방법 key:value로 진행해야함
					let category_list = {};				// categoryNo : categoryCount 저장을 위한 객체 생성
					
					for(let tr of trs){
						let input = tr.querySelector('input');
						// console.log(input); 				// tr input 데이터 값 확인 ok
						if(input.checked == true){
							let key = (tr.children[1].textContent);
							let val = (tr.children[3].textContent);
							// console.log(key);			// categoryNo - ok
							// console.log(val);			// categoryCount - ok
							// 속성 추가시 obj[key] = value;
							category_list[key] = val;
							console.log(category_list);		// {categoryNo : categoryCount} ok
							
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
								'categoryCount' : Object.values(category_list)		
						},
								// 'categoryNo' : categoryNo_list,				- 삭제			.keys(object1)
								// 'categoryCount' : categoryCount_list	// 추가 - 삭제
						dataType: 'json',
						success : function(result){
							Swal.fire('성공', '카테고리 삭제가 완료되었습니다!', 'success');
							for(let tr of trs){
								let categoryNo = parseInt(tr.children[1].textContent);	
								if(result.includes(categoryNo)){		// categoryNo를 포함하는 문자열이 있으면 == true
									tr.remove();						// 해당 tr remove
								}
							}
							console.log('성공');
						},	// success
						error : function(result){
							Swal.fire('실패', '카테고리 삭제가 실패되었습니다!', 'error');
							console.log('실패');
						},	// error
						complete : function(result){
						}
					});	// ajax
				});		// confrim
  		}	// deleteCategory
  </script>	
   	
   	

</body>
</html>