<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.board.recipe.model.vo.Recipe,
				 java.util.ArrayList" %>
<%	
	// ArrayList로 받아온 recipes
	ArrayList<Recipe> rList = (ArrayList<Recipe>)request.getAttribute("rList");
	
	/*
	//페이지처리용 변수
	// PageInfo 객체 받음
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 받은 객체에서 int형 변수로 추출
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage()
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	div {
		box-sizing: border-box;

	}

	/*******************	Wrapping divs 세팅 *******************/
	/* 전체 wrap */
	#recipeMainViewWrap {
		width: 1200px;
		margin: auto;
	}
	
	/* 레시피글 디스플레이 영역 wrap */
	#recipeThumnailWrap {
		width: 100%;
		height: 100%;
		padding: 35px 25px 50px 25px;
	}

	/******************* 레시피글 블록(단일 글) 세팅 *******************/
	/* 레시피 글 별 전체 container */
	#recipeMainViewWrap .thumbnail-contariner {
		width: 349px;
		height: 500px;
		display: inline-block;
		margin: 20px 15px 30px 15px;
		border: 1px solid black !important;
	}
	
	/* 상단 (썸네일 이미지) */
	#recipeMainViewWrap .thumbnail-top {
		width: 100%;
		height: 347px;
	}

	#recipeMainViewWrap .thumbnail-top img {
		width:100%;
		height: 100%;
	}

	/* 하단 (제목 + 셰프이름 + 조회수/아이콘 + 좋아요개수/아이콘) */
	#recipeMainViewWrap .thumbnail-bottom {
		width: 100%;
		height: 151px;
	}

	/* 하단 top */
	#recipeMainViewWrap .thumbnail-bottom-inner1 {
		width: 100%;
		height: 65%;
	}
	
	
	/* 하단 bottom (조회수 + 좋아요수) */
	#recipeMainViewWrap .thumbnail-bottom-inner2 {
		width: 100%;
		height: 35%;
	}

	#recipeMainViewWrap .thumbnail-bottom-inner2 div {
		height: 100%;
		float: left;
	}

	/* 쉐프 이름 */
	#recipeMainViewWrap .thumbnail-left-bottom {
		width: 70%;
	}

	#recipeMainViewWrap .thumbnail-left-bottom-chef {
		width: 100%;
	}

	/* 조회수 + 좋아요 */
	#recipeMainViewWrap .thumbnail-right-bottom {
		width: 30%;
	}

	#recipeMainViewWrap .thumbnail-right-bottom div {
		width: 100%;
		height: 50%;
	}

	#recipeMainViewWrap .thumbnail-right-bottom p {
		margin: 0px;
		display: inline-block;
		padding: 3px 0px 0px 10px;
	}

	#recipeMainViewWrap .thumbnail-right-bottom i {
		font-size: 20px;
		float: right;
		padding: 5px 10px 0px 0px;
	}


	/* 조회수 */
	#recipeMainViewWrap .thumbnail-right-bottom-inner1 i {
		color: rgb(255, 145, 77);
	}

	/* 좋아요 */
	#recipeMainViewWrap .thumbnail-right-bottom-inner2 i {
		color: red;
	}
</style>

</head>
<body>
	<!-- 헤더, 레시피 카테고리바, 레시피 정렬바 -->
	<%@ include file="/views/common/header.jspf" %>
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jspf" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jspf" %>
	
	<!-- 전체를 감싸는 div -->
	<div id="recipeMainViewWrap">
		<!-- 레시피 글 블록 wrap -->
		<div id="recipeThumnailWrap">
			<% if(!rList.isEmpty()) { %>
				<!-- ***********[[ 여기가 조회된 레시피 글 만들어줘야할 부분 ]] ***************** -->
				<% for(int i = 0; i < rList.size(); i++) { %>
					<!-- 레시피 글 블록 (* 9개 필요) -->
					<div class="thumbnail-contariner">
						<!-- 상단 이미지부분 -->
						<div class="thumbnail-top">
							<img src="https://dthezntil550i.cloudfront.net/by/latest/by2107310110043690021607870/742bb13f-97a0-4582-ad2f-b9c276ed1709.jpg">
						</div>
						
						<!-- 하단 레시피정보부분 -->
						<div class="thumbnail-bottom">
							<div class="thumbnail-bottom-inner1">
								<p><%= rList.get(i).getRecipeTitle() %></p>
							</div>
	
							<div class="thumbnail-bottom-inner2">
								<div class="thumbnail-left-bottom">
									<div class="thumbnail-left-bottom-chef">
										<p><%= rList.get(i).getMemNickName() %></p>
									</div>
								</div>
	
								<div class="thumbnail-right-bottom">
									<div class="thumbnail-right-bottom-inner1">
										<!-- 조회수 -->
										<p><%= rList.get(i).getRecipeCount() %></p>
										<i class='fas fa-eye'></i>
									</div>
									<div class="thumbnail-right-bottom-inner2">
										<!-- 좋아요수 -->
										<p><%= rList.get(i).getHtCount() %></p>
										<i class="fa fa-heart"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				<% } %>
			<% } else { %>
				<script>
					$(function(){
						location.href = "<%=contextPath%>/errorNoRecipeList.re";
					});
				</script>
			<% } %>
		</div>
		
		<!-- 페이지네이션 영역 -->
		<div id="recipeMainPagationContainer">

		</div>
		
	</div>
	<!-- 전체를 감싸는 div -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 푸터 -->
	<%@ include file="/views/common/footer.jspf" %>
</body>
</html>