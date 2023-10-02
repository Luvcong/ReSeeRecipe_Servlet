<!-- ※주의 : 이 fragment는 반드시 header.jspf와 함께 사용되어야 함 -->
<!-- ※Alert : This fragment HAS TO BE USED with header.jspf! -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.*,
			     com.kh.semi.board.unsaved_recipe.model.vo.*,
			     com.kh.semi.board.board_common.model.vo.*,
			     com.kh.semi.member.model.vo.Member" %>
<%	
	

	// 메인경로	
	String recipeEnrollFormPath = request.getContextPath();
	
	// 로그인한 회원
	
	Member recipeEnrollFormMember = (Member)session.getAttribute("loginMember");
	
	ArrayList<UnRecipe> uList = null;
	int memNoChecked = (int)request.getAttribute("memNoChecked");
	HashMap<String, Object> enMap = (HashMap)request.getAttribute("mapEnrollForm");
	ArrayList<RecipeCategory> cList = (ArrayList)enMap.get("cList");
	ArrayList<IngredientMeasure> iList = (ArrayList)enMap.get("iList");
	if(enMap.containsKey("uList")) {
		uList = (ArrayList<UnRecipe>)enMap.get("uList");
	}
	


	//"rMainVwCon", "enrollForm"
	/*
	String rMainVwCon = (String)request.getAttribute("rMainVwCon");

	switch(rMainVwCon) {
		case "enrollForm" :
			HashMap<String, Object> enMap = (HashMap)request.getAttribute("mapEnrollForm");
			ArrayList<RecipeCategory> cList = (ArrayList)enMap.get("cList");
			ArrayList<IngredientMeasure> iList = (ArrayList)enMap.get("iList");
			if(enMap.containsKey("uList")) {
				ArrayList<UnRecipe> uList = (ArrayList<UnRecipe>)enMap.get("uList");
			}
			int memNoChecked = (int)request.getAttribute("memNoChecked");
			break;
	
	}
	*/
	//recipeEnrollForm용 카테고리, 계량단위 정보
	
	
	////////// 임시저장글 번호, 제목도 같이 가져왔어야함
	
	
	// 더블체크용 멤버넘버
	
	
	/*
	ArrayList<UnRecipe> uList = new ArrayList();	
	UnRecipe un1 = new UnRecipe();
	un1.setUnRecipeNo(1);
	un1.setUnRecipeTitle("1번임시글");
	UnRecipe un2 = new UnRecipe();
	un2.setUnRecipeNo(2);
	un2.setUnRecipeTitle("2번임시글");
	UnRecipe un3 = new UnRecipe();
	un3.setUnRecipeNo(3);
	un3.setUnRecipeTitle("3번임시글");
	uList.add(un1);
	uList.add(un2);
	uList.add(un3);
	
	ArrayList<RecipeCategory> cList = new ArrayList();
	cList.add(new RecipeCategory(1, "한식"));
	cList.add(new RecipeCategory(2, "양식"));
	cList.add(new RecipeCategory(3, "중식"));
	cList.add(new RecipeCategory(4, "일식"));
	
	Member loginMember1 = new Member();
	loginMember1.setMemId("user01");
	loginMember1.setMemPwd("pass01");
	// 메인경로	contextPath
	String contextPath1 = request.getContextPath();
	// 로그인한 회원 loginMember
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 글 작성 양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 버튼 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 모달 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	/**********************************************************
		입력양식 폼 상단 바 영역
	**********************************************************/
	/* 입력양식 폼 상단 바 기본 아우터 div 세팅 */
	#recipe-enroll-bar-wrap {
		width: 1000px;
		height: 50px;
		margin: auto;
		box-sizing: border-box;
		position: relative;
	}

	/* 입력양식 폼 상단 바 div요소 기본 세팅 */
	#recipe-enroll-bar-wrap div {
		height: 100%;
		float: left;
		box-sizing: border-box;

	}
	
	

	/**********************************************************/
	/* 카테고리 아이콘 이미지 관련 세팅 */
	#recipe-enroll-bar-img {
		width: 5%;
		margin-left: 30px;
	}

	#recipe-enroll-bar-img > i {
		font-size: 40px;
		color: rgb(255, 145, 77);
	}

	/* 카테고리 선택 블록 관련 세팅 */
	#recipe-enroll-bar-menu {
		width: 35%;
		text-align: left;
	}

	/* 카테고리 선택 블록 내부 h3요소 세팅 */
	#recipe-enroll-bar-menu > h3 {
		margin: 0px;
		padding : 0px;
		font-size: 27px;
		display: inline-block;
		position: absolute;
		left: 9%;
		top: 15%;
	}

	/* 카테고리 선택 블록 내부 select요소 세팅 */
	#recipe-enroll-bar-menu > select {
		width: 15%;
		height: 70%;
		padding: 0px;
		position: absolute;
		left: 27%;
		top: 15%;
		text-align: center;
	}

	/* 임시저장 버튼 세팅 */
	#unrecipe-modal-request-div {
		width: 5%;
		position: absolute;
		top : 0px;
		right : 30px;
	}
	#unrecipe-modal-request-div > button {
		font-size: 45px;
		appearance: none;
		border: none;
        background-color: transparent;
		padding: 2px;
		color: rgb(255, 145, 77);
	}
	
	/* 임시저장 모달창 세팅 */
	#unrecipe-modal, #unrecipe-unavailable-modal{
		position: fixed;
		top: 3%;
		left: 30%;
	}
	
	#unrecipe-unavailable-modal .modal-header,
	#unrecipe-modal .modal-header {
		height: 100px;
	}
	#unrecipe-unavailable-modal .modal-header t4,
	#unrecipe-modal .modal-header t4 {
		font-size: 28px;
	}
	
	#unrecipe-unavailable-modal .modal-body,
	#unrecipe-modal .modal-body {
		height: 130px;
		padding: 10px;
	}
	
	#unrecipe-unavailable-modal .modal-body h5,
	#unrecipe-modal .modal-body h5 {
		margin: 10px;
		font-size: 20px;
	}
		
	#unrecipe-unavailable-modal .modal-body p,
	#unrecipe-modal .modal-body p {
		margin: 0px;
		margin-left: 20px;
		margin-bottom: 10px;
		font-size: 15px;
	}
	
	
	#unrecipe-unavailable-modal .modal-content {
		height: 600px;
	}
	#unrecipe-unavailable-modal .modal-footer,
	#unrecipe-modal .modal-footer {
		height: 100px;
		padding: 10px;
	}

	/**********************************************************
		입력양식 폼 영역
	**********************************************************/
	
	#recipe-enroll-form-wrap {
		/********지울부분****************/
		height: 1200px;
	}	
		
		

	/**********지울부분***************************************/
	div {
		border: 1px solid black;
	}
	
</style>

</head>
<body>
	<!-- 같이 넘어가야 할 것
		TB_RECIPE
		: 레시피 제목, 작성자 번호(MEM_NO), 선택한 레시피 카테고리 번호
		위 구문 수행 후 RECIPE NO 받아서
		TB_COOK_STEPS
		: 각 요리과정 제목, 각 요리과정 내용, 블록 순서(넘버링)
		TB_INGREDIENT
		: 요리에 들어가는 재료, 선택한 계량단위 번호
		TB_RECIPE_TAG
		선택한 해시태그 번호
		TB_RECIPE_PIC
		: 미리보기만 해주고 & 파일INPUT으로 알아서
		-->
	<!--<--%= contextPath %>/insertRecipe.re-->
	
	<div id="recipe-enroll-form-wrap">
		<form action="#" id="recipe-enrolling-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memNo" value="<%= recipeEnrollFormMember.getMemNo() %>">
		
			<!------------- 입력양식 폼 상단 바 영역 ------------->
			<div id="recipe-enroll-bar-wrap">
				<!-- 카테고리 선택 영역 -->
				<div id="recipe-enroll-bar-img" class="recipe-enroll-category">
					<i class='fas fa-align-left'></i>
				</div>
				<div id="recipe-enroll-bar-menu" class="recipe-enroll-category">
					<h3>카테고리 선택</h3>
					<select name="recipeCategoryNo">
						<% for(int i = 0; i < cList.size(); i++) { %>
							<option value="<%= cList.get(i).getRecipeCategoryNo() %>">
								<%= cList.get(i).getRecipeCategoryName() %>
							</option>
						<% } %>
					</select>
				</div>
				

				<!-- 임시저장 버튼 -->
				<div id="unrecipe-modal-request-div">
					<button type="button" onclick="unrecipeModalRequest(this);" class='fas fa-folder' data-toggle="modal" data-target="#"><!--임시저장글개수--></button>
				</div>
				
				<!-- 임시작성글 모달 -->
				<!--  글 3개 미만 0, 1, 2개 상태 : 해시태그, 이미지유실 경고 후 임시저장글 작성 -->
				<div class="modal" id="unrecipe-modal">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				
				      <div class="modal-header">
				        <h4 class="modal-title">임시저장글로 저장합니다.</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <div class="modal-body">
				        <h5>주의! 해시태그와 사진은 저장되지 않습니다.</h5>
						<p>그래도 임시저장글로 저장을 원하시면 저장하기 버튼을 누르세요.</p>
				      </div>
				
				      <div class="modal-footer">
					      <button type="button" id="unrecipe-enrolling-btn" class="btn btn-primary">저장하기</button>
					      <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 임시작성글 3개 이상 시 모달 -->
				<!-- 글 3개 이상 3, 4 . . . 상태 : 모달로 제목 목록띄우면서 '이 글을 지우고 작성' 여부 선택하도록
				 							 -> 선택한 글 지우고 이거 쓰려는게 맞는지, 해시태그와 사진은 저장안된다는 것 더블체크
				  					 		 -> 선택한 임시저장글번호 지우고 + 현재 임시저장글 작성 -->
				<div class="modal" id="unrecipe-unavailable-modal">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				
				      <div class="modal-header">
				        <h4 class="modal-title">임시저장은 3개까지만 가능합니다!</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <div class="modal-body">
				        <h5>기존 임시저장글을 지운 후 이 글을 저장합니다.</h5>
						<p>아래 목록에서 지울 대상을 선택하세요.</p>
						<p>주의! 해시태그와 사진은 저장되지 않습니다.</p>
		
				      </div>
				
				      <div class="modal-content">
				      </div>
				      <div class="modal-footer">
					      <button type="button" id="unrecipe-del-enrolling-btn" class="btn btn-primary">글작성</button>
					      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				

				<!-- 레시피 글 작성 입력 양식 -->
				<div>
				
					<!-- 레시피 썸네일 + 제목 + 재료 입력 테이블 -->
					<div id="cook-steps-basic-info" class="cook-steps-block">
						<table>
							<tr>
								<td rowspan="5"></td><td>레시피제목입력</td>
							</tr>
							<tr><td>'셰프이름'출력</td></tr>
							<tr><td>해시태그입력</td></tr>
							<tr><td>'재료'출력</td><td>재료입력란</td></tr>
							<tr><td>재료엔터치면요소생성</td></tr> <!-- 재료 엔터치면 디스플레이용 요소 생성, 요소 클릭하면 input으로 변화 후 엔터치면 요소생성 -->
						</table>

					</div>

					<!-- 레시피 과정 입력테이블 (과정사진 + 과정제목 + 과정내용) -->
					<div id="cook-steps-instruction" class="cook-steps-block">
						<table>
							<!-- 1 ~ 2번째 -->
							<tr>
								<td><img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif"></td>
								<td><img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif"></td>
							</tr>
							<tr>
								<td><input type="text" name="cookStepsTitle1" maxlength="30" required></td>
								<td><input type="text" name="cookStepsTitle2" maxlength="30"></td>							
							</tr>
							<tr>
								<td><textarea name="cookStepsContent1" id="" cols="30" rows="10" maxlength="500" style="resize: none;"></textarea></td>									
								<td><textarea name="cookStepsContent2" id="" cols="30" rows="10" maxlength="500" style="resize: none;"></textarea></td>
							</tr>
							<!-- 3 ~ 4 번째 -->
							<tr>
								<td><img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif"></td>
								<td><img src="https://simg.wooribank.com/img/section/bz/buss_product_noimgb.gif"></td>
							</tr>
							<tr>
								<td><input type="text" name="cookStepsTitle3" maxlength="30"></td>
								<td><input type="text" name="cookStepsTitle4" maxlength="30"></td>							
							</tr>
							<tr>
								<td><textarea name="cookStepsContent3" id="" cols="30" rows="10" maxlength="500" style="resize: none;"></textarea></td>
								<td><textarea name="cookStepsContent4" id="" cols="30" rows="10" maxlength="500" style="resize: none;"></textarea></td>							
							</tr>
						</table>
					</div>
					

				</div>
				
			</div>

			<!-- 레시피 작성 요청 / 초기화 버튼 (script로 요청) -->
			<div align="center">
			<button type="button" id="recipe-enrolling-btn" class="btn btn-primary">글작성</button>
			<button type="button" id="recipe-resetting-btn">초기화</button>
			</div>
		</form>
	</div>

					
	
	
	
	
	
	<script>
		// 임시저장 아이콘 클릭 시 모달창 설정
		function unrecipeModalRequest(e) {
			<% if(uList.size() < 3) { %>
				e.dataset.target = '#unrecipe-modal';
			<% } else { %>
				e.dataset.target = '#unrecipe-unavailable-modal';
			<% } %>
		}
	
		$(function(){
			// 레시피 글 작성요청 form태그 속성 설정 및 submit
			$('#recipe-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= recipeEnrollFormPath %>/enroll').submit();
			});
			
			// 레시피 글 초기화요청 form태그 reset
			$('#recipe-resetting-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= recipeEnrollFormPath %>/reset').submit();
			});
			
			// 임시저장글 3개미만 모달창 작성요청 form태그 속성 설정 및 submit
			$('#unrecipe-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= recipeEnrollFormPath %>/modalenroll').submit();
			});
			
			// 임시저장글 3개이상 모달창 글삭제/작성요청 form태그 속성 설정 및 submit
			$('#unrecipe-del-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= recipeEnrollFormPath %>/modaldelandenroll').submit();
			});

		})
	</script>
	<% System.out.println("넌아니지"); %>

</body>
</html>