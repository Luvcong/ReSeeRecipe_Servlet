<!-- ※주의 : 이 fragment는 반드시 header.jspf와 함께 사용되어야 함 -->
<!-- ※Alert : This fragment HAS TO BE USED with header.jspf! -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.RecipeCategory,
			     com.kh.semi.board.unsaved_recipe.model.vo.UnRecipe,
			     com.kh.semi.board.board_common.model.vo.IngredientMeasure" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 글 작성 양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 버튼 / 모달 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 아이콘 부트스트랩 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>


<style>
	/**********************************************************
		wrap div + wrap내부 div 세팅
	**********************************************************/
	div {
		box-sizing: border-box;
	}

	/* 전체 div wrap */
	#recipe-enroll-form-wrap {
		width: 900px;
		box-sizing: border-box;
		margin: auto;
	}
	/*******************************************/
	/* > 글쓰기 양식 form태그wrap */
	#recipe-enrolling-form { 
		width: 100%;
		box-sizing: border-box;
		position: relative;
	}

	/*******************************************/
	/* > > 상단바wrap div 세팅 */
	#recipe-enroll-top-bar-wrap {
		width: 100%;
		height: 80px;
		margin: auto;
		box-sizing: border-box;
		/*지울부분*/
		background-color: aqua;
	}

	/* > >... 상단바 내부 div요소 default 세팅 */
	#recipe-enroll-top-bar-wrap div {
		height: 100%;
		float: left;
	}

	/* > > 입력폼wrap div 세팅 */
	#recipe-enroll-context-wrap {
		width: 100%;
		height: 2000px;
	}

	/* > >... 입력폼 내부 상단 div (썸네일 + 제목 + 재료입력) */
	#cook-steps-basic-info {
		width: 100%;
		height: 30%;
	}

	/* > >... 입력폼 내부 중단 div (과정사진 + 제목 + 내용) */
	#cook-steps-instruction {
		width: 100%;
		height: 63%;
	}

	/* > >... 입력폼 내부 하단 div (submit + reset 버튼) */
	#cook-steps-buttons {
		width: 100%;
		height: 5%;
	}


	/**********************************************************
		상단바 영역 (#recipe-enroll-top-bar-wrap 내부)
	**********************************************************/
	/* 1. 아이콘 이미지 세팅 */
	#recipe-enroll-bar-img {
		width: 10%;
		padding: 18px 0px 0px 30px;
	}

	#recipe-enroll-bar-img > i {
		font-size: 45px;
		color: rgb(255, 145, 77);
	}

	/* 2. 카테고리 메뉴 세팅 */
	#recipe-enroll-bar-menu {
		width: 75%;
	}

	/* select요소 */
	#recipe-enroll-bar-inner {
		width: 45%;
		position: relative;
	}
	
	#recipe-enroll-bar-menu select {
		width: 90%;
		height: 60%;
		text-align: center;
		position: absolute;
		top: 16px;
	}

	#enroll-bar-inner-blank1 {
		width: 55%;
	}

	/* 3. 임시저장 버튼 세팅 */
	#unrecipe-modal-request-div {
		width:15%;
	}

	#unrecipe-modal-request-div > button {
		width: 100%;
		height: 100%;
		font-size: 55px;
		text-align: center;
		color: rgb(255, 145, 77);
		appearance: none;
		border: none;
        background-color: transparent;
	
	}
	/******************여기부터아직스타일정리X***********************/
	/* 4. 임시저장 입력폼 모달창 세팅 */
	/*
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
	*/


	/**********************************************************
		입력양식 내용 영역 (#recipe-enroll-context-wrap내부)
	**********************************************************/
	/* 1. 입력폼 내부 상단 div (썸네일 + 제목 + 재료입력) */
	/* 여백 영역 */
	#enroll-form-blank1 {
		width: 100%;
		height: 2%;
	}

	/* 좌우 큰 div */
	#cook-steps-basic-info .cook-steps-input-content {
		width: 50%;
		height: 98%;
		float: left;
		text-align: center;
	}
	
	#cook-steps-basic-info .cook-steps-inner {
		width: 100%;
	}

	/* --- 좌측 --- */
	/* 썸네일 div */
	#content-thumbnail-image {
		width: 100%;
		height: 76%;
	}

	/* 셰프이름 + 해시태그 div */
	#content-writer-hashtag {
		width: 100%;
		height: 24%;
	}

	/* 셰프이름 */
	#cook-steps-chef {
		height: 40%;
	}

	#cook-steps-chef > p {
		margin: 0px;
		margin-top: 12px;
		font-size: 20px;
		font-weight: 1000;
		color: rgb(132, 137, 143);
	}

	/* 해시태그 */
	#cook-steps-hashtag {
		height: 60%;
	}

	#cook-steps-hashtag > button {
		width: 90%;
		height: 70%;
		border-radius: 50px;
		border-color: rgb(255, 145, 77);
		margin-top : 12px;
	
	}
	/* --- 우측 --- */
	/* 제목 */
	#cook-steps-title {
		height: 24%;
	}

	#cook-steps-title > #title-text-area-div {
		width: 100%;
		height: 100%;
	}

	#cook-steps-title > div > textarea {
		width: 420px;
		height: 105px;
		resize: none;
		text-align: center;
		border-radius: 10px;
		padding : 10px 120px 10px 50px;
		margin: auto;
		position: absolute;
		top: 112px;
		right: 15px;
	}

	#cook-steps-title > div > textarea::placeholder {
		padding-top: 30px;
		text-align: center;
	}

	#cook-steps-title > #title-bytes-span {
		display: inline-block;
		font-size: 2px;
		z-index: 1;
		position: absolute;
		top: 182px;
		right: 26px;
	}


	/* 재료 제목 */
	#cook-steps-ingredient-title {
		height: 13%;
	}

	#cook-steps-ingredient-title > div {
		height: 100%;
		float: left;
	}

	#ingredient-title-div1 {
		width: 67%;
		padding-top: 15px;
	}

	#ingredient-title-div2 {
		width: 33%;
		text-align: left;
		padding-top: 32px;
		padding-left: 2px;
	}


	#ingredient-add-msg-div {
		float: right;
	}

	#ingredient-add-msg-div label {
		margin: 0px;
		margin-top: 2px;
		margin-right: 5px;
		font-size: 25px;
		font-weight: 1000;
		color: rgb(132, 137, 143);
		display: inline-block;
	}
	
	#ingredient-add-msg-div button {
		font-size: 40px;
		padding: 0px;
		appearance: none;
		border: none;
		background-color: transparent;
		color: rgb(89, 164, 255);
		float: right;
	}
	
	#ingredient-add-msg-div label:hover {
		cursor: pointer;
	}
	
	#ingredient-title-div1 button:hover {
		color: rgb(59, 134, 225);
	}
	

	#ingredient-title-div2 > p {
		margin-bottom: 0px;
		font-size: 1px;
		color: rgb(142, 147, 153);
	}


	/* 재료 콘텐트 */
	#cook-steps-ingredient-content {
		height: 67%;
	}

	#cook-steps-ingredient-content div {
		width: 100%;
		height: 30%;
	}
	




	/*2. 입력폼 내부 중단 div (과정사진 + 제목 + 내용) */
	#cook-steps-instruction {

	}

	/* 3. 입력폼 내부 하단 div (submit + reset 버튼) */
	#cook-steps-buttons {

	}

	

		

	/**********지울부분***************************************/
	table td { border: 1px solid black }


</style>

</head>
<body>

	<%@ include file="/views/common/header.jspf" %>
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jsp" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jsp" %>

	<script>
		// jsp파일 로딩 시 카테고리 접힘상태로 로딩시켜주는 함수
		$(function(){
			const categoryFoldingText = $('#category-toggle-msg > h3');
			categoryFoldingText.text('카테고리 더보기');
			$('#category-toggle-menu').css('display', 'none');
		});
	</script>
	
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

	<div id="recipe-enroll-form-wrap"><!-- 전체 wrap 시작 -->
		
		<!-- 글작성 전체 form / 요청 시점 memNo같이넘김 -->
		<form action="#" id="recipe-enrolling-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memNo" value="2">

			<!------------- 입력양식 상단 바 영역 ------------->
			<div id="recipe-enroll-top-bar-wrap">
				<!-- 카테고리 선택 영역 -->
				<div id="recipe-enroll-bar-img">
					<i class='fas fa-align-left'></i>
				</div>
				<div id="recipe-enroll-bar-menu">
					<div id="recipe-enroll-bar-inner">
						<select name="recipeCategoryNo">
								<option	value="한식">한식</option>
								<option value="양식">양식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
								<option value="아시안">아시안</option>
								<option value="야식">야식</option>
								<option value="디저트">디저트</option>
								<option value="음료">음료</option>
						</select>
					</div>
					<div id="enroll-bar-inner-blank1"></div>
				</div>

				<!-- 임시저장 아이콘 (클릭 시 모달 호출) -->
				<div id="unrecipe-modal-request-div">
					<button type="button" onclick="unrecipeModalRequest(this);"
						class='fas fa-folder' data-toggle="modal" data-target="#">
						<!--임시저장글개수-->
					</button>
				</div>

				<!-- 1. 임시작성 기본 모달 (if else는 script에서 처리) -->
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
								<button type="button" id="unrecipe-enrolling-btn"
									class="btn btn-primary">저장하기</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 2. 임시작성 글 3개 이상 시 모달 -->
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
									<input type="radio" class="testList" name="unRecipeDelNo1" id="unRecipeDelNo1" value="1" checked><label for="unRecipeDelNo1">레시피제목1</label>
									<input type="radio" class="testList" name="unRecipeDelNo2" id="unRecipeDelNo2" value="2"><label for="unRecipeDelNo2">레시피제목2</label>
									<input type="radio" class="testList" name="unRecipeDelNo3" id="unRecipeDelNo3" value="3"><label for="unRecipeDelNo3">레시피제목3</label>
							</div>
	
							<div class="modal-content"></div>
							<div class="modal-footer">
								<button type="button" id="unrecipe-del-enrolling-btn" class="btn btn-primary">글작성</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 입력양식 상단 바 영역 끝 -->

			
			<!--------------------------------------------------------------->
			<!-- 레시피 글 작성 내용 영역 -->
			<div id="recipe-enroll-context-wrap">
				
				<!-- 레시피 썸네일 + 제목 + 재료 입력 테이블 -->
				<div id="cook-steps-basic-info">
					<div id="enroll-form-blank1"></div>
					<div class="cook-steps-input-content">
						<div id="content-writer-hashtag">
							<div id="cook-steps-chef" class="cook-steps-inner">
								<p>김xx셰프</p>
							</div>
							<div id="cook-steps-hashtag" class="cook-steps-inner">
								<button type="button" class="btn btn-info">해시태그입력</button>
							</div>
						</div>
						<div id="content-thumbnail-image">
							<img src="d" alt="">dddddddddd
						</div>
					</div>
					<div class="cook-steps-input-content">
						<div id="cook-steps-title" class="cook-steps-inner">
							<div id="title-text-area-div">
								<textarea name="title" cols="10" rows="2" placeholder="레시피 제목을 입력하세요" required></textarea>
							</div>
							<div id="title-bytes-span">
								<span>0</span>
								<span>/60 bytes</span>
							</div>
						</div>
						<div id="cook-steps-ingredient-title" class="cook-steps-inner">
							<div id="ingredient-title-div1">
								<div id="ingredient-add-msg-div">
									<label for="ingredient-title-btn">재료추가</label>
									<button type="button" id="ingredient-title-btn" class="fa fa-plus-square"></button>
								</div>
							</div>
							<div id="ingredient-title-div2">
								<p>(최대 30개)</p>
							</div>
						</div>
						<div id="cook-steps-ingredient-content" class="cook-steps-inner">
							
							<div class="input-group" style="width: 100%; height: 50px; margin: 1px;">
								<div class="input-group-prepend" style="width: 20%; display: inline-block;">
								  <span class="input-group-text">재료입력</span>
								</div>
								<input type="text" class="form-control" placeholder="First Name" style="width: 30%; display: inline-block;">
								<input type="text" class="form-control" placeholder="Last Name" style="width: 30%; display: inline-block;">
							</div>


							<div>
								<span>
									<input type="text" placeholder="재료" required>
								</span>
								<span>
									<input type="number" placeholder="숫자" min="0">
								</span>
								<span>
									<select name="" id="">
										<option value="">g</option>
										<option value="">kg</option>
										<option value="">cups</option>
										<option value="">ml</option>
										<option value="">L</option>
									</select>
								</span>
							</div>
							
						</div>
					</div>
						<!--
						<table>
							<tr>
								<td id="cook-steps-title" class="cook-steps-inner">
									<textarea name="title" cols="10" rows="2" placeholder="레시피 제목을 입력하세요" required></textarea>
									<span>0</span><span>/60 bytes</span>
								</td>
							</tr>
							<tr>
								<td id="cook-steps-chef" class="cook-steps-inner">김xx셰프</td>
							</tr>
							<tr>
								<td id="cook-steps-hashtag" class="cook-steps-inner">해시태그입력</td>
							</tr>
							<tr>
								<td id="cook-steps-ingredient-title" class="cook-steps-inner">재료</td>
							</tr>
							<tr>
								<td id="cook-steps-ingredient-content" class="cook-steps-inner">
									<div>
										<input type="text">
									</div>
									<div>재료영역2</div>
								</td>
							</tr>
						</table>
					</div>
					-->
					<!-- 재료 엔터치면 디스플레이용 요소 생성, 요소 클릭하면 input으로 변화 후 엔터치면 요소생성 -->
				</div>

				<!-- 타이틀 글자수 바이트 수 세기 -->
				<script>
					$(function(){

						$('#cook-steps-title textarea').keyup(function(e){
							var textAreaBytes = 0;
							var textArea = $(this).val();
							var numberingSpan = $('#cook-steps-title').find('span').eq(0);

							var patternKor = /[ㄱ-ㅎㅏ-ㅣ가-힣]/m;
							var patternBlank = /[\s]/m;
							var patternOne = /[\w~!@#%^&*()_+-=\\$\`\[\]\{\}]/m;
							
							if(textArea.length != 0){
								for(let i = 0; i < textArea.length; i++){
									console.log('d');
									if(textAreaBytes <= 60) {
										textAreaBytesBefore = textAreaBytes;
										if(patternKor.test(textArea.charAt(i))) {
											textAreaBytes += 3;
										}
										else if(patternBlank.test(textArea.charAt(i)) || patternOne.test(textArea.charAt(i))) {
											if(e.key == 'Enter') {
												textAreaBytes += 2;
											}
											else {
												textArea.replace(patternBlank, ' '); // 엔터 외에는 모두 한칸 스페이스로 변경
												textAreaBytes++;
											}
										}
										else {
											textAreaBytes += 3;
										}
										numberingSpan.text(textAreaBytes);
									}
									if(60 < textAreaBytes) { // if처리
										$(this).val(textArea.substring(0, i));
										numberingSpan.text(textAreaBytesBefore);
										alert('더 이상 입력할 수 없습니다!');
										return false;
									}
								}
							}
							else {
								numberingSpan.text(0);
							}
						});
					});
					
				</script>

				<!-- 레시피 과정 입력테이블 (과정사진 + 과정제목 + 과정내용) -->
				<div id="cook-steps-instruction">
					<div class="cook-steps-inst-outer-div">
						<div>
							<div class="cook-steps-inst-inner-div">
								<div></div>
								<div>
									<div>1</div>
									<div>내용제목1 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
							<div class="cook-steps-inst-div">
								<div></div>
								<div>
									<div>2</div>
									<div>내용제목2 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
						</div>
						<divv class="cook-steps-inst-outer-div">
							<div class="cook-steps-inst-div">
								<div></div>
								<div>
									<div>3</div>
									<div>내용제목3 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
							<div class="cook-steps-inst-div">
								<div></div>
								<div>
									<div>4</div>
									<div>내용제목4 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
						</divv>
						<divv class="cook-steps-inst-outer-div">
							<div class="cook-steps-inst-div">
								<div></div>
								<div>
									<div>5</div>
									<div>내용제목5 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
							<div class="cook-steps-inst-div">
								<div></div>
								<div>
									<div>6</div>
									<div>내용제목6 재료를 손질해 요리한다</div>
								</div>
								<div><textarea name="cookStepsContent3" id="" cols="30"
									rows="10" maxlength="500" style="resize: none;"></textarea>
								</div>
							</div>
						</divv>
					</div>

				</div>

				<!-- 레시피 작성 요청 / 초기화 버튼 (script로 요청) -->
				<div id="cook-steps-buttons" align="center">
					<div>
						<button type="button" id="recipe-enrolling-btn" class="btn btn-primary">글작성</button>
					</div>
					<div>
						<button type="reset" id="recipe-resetting-btn" onclick="return confirmReset();" class="btn btn-warning">초기화</button>
					</div>
				</div>

			</div><!-- 레시피 글 작성 내용 영역 끝 -->

			
		</form><!-- 글 작성 전체 form 끝 -->

	</div><!-- 전체 wrap 끝 -->


	<script>
		// 임시저장 아이콘 클릭 시 모달창 설정
		function unrecipeModalRequest(e) {
			console.log(document.getElementsByClassName('.testList'));
			//if(document.getElementsByClassName('.testList').length < 3 ) {

				//e.dataset.target = '#unrecipe-modal';
			//} else {
				//e.dataset.target = '#unrecipe-unavailable-modal';
			//}
		};
		
		// 양식 초기화 요청 confirm
		function confirmReset() {
			return confirm("입력한 정보를 초기화하시겠습니까?");
		};
		
		$(function(){

			// 레시피 글 작성요청 form태그 속성 설정 및 submit
			$('#recipe-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/insertRecipe.re').submit();
			});
			
			// 임시저장글 3개미만 모달창 작성요청 form태그 속성 설정 및 submit
			$('#unrecipe-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/unRecipeInsert.un').submit();
			});
			
			// 임시저장글 3개이상 모달창 글삭제/작성요청 form태그 속성 설정 및 submit
			$('#unrecipe-del-enrolling-btn').click(function(){
				$('#recipe-enrolling-form').attr('action', '<%= contextPath %>/unRecipeInsertInstead.un').submit();
			})
		});
	</script>


	<script>
		$(function(){
			$('#ingredient-title-btn').click(function(){
				alert('재료추가');
			})
		});
	</script>
</body>
</html>