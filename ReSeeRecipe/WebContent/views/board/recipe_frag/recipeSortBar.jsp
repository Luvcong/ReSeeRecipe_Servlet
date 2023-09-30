<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
	#recipe-sort-bar-outer {
		width: 1000px;
		height: 50px;
		margin: auto;
		color: white;
	}
</style>
</head>
<body>

	<div id="recipe-sort-bar-wrap">
		<!-- 레시피 정렬 기준 -->
		<div>
			<div>
				<input type="hidden" value="selectRecipeListLt">
				<p class="recipe-sort-by">최신순</p>
			</div>
			<div>
				<input type="hidden" value="selectRecipeListHt">
				<p class="recipe-sort-by">좋아요순</p>
			</div>
			<div>
				<input type="hidden" value="selectRecipeListVw">
				<p class="recipe-sort-by">조회수순</p>
			</div>
			<div>
				<input type="hidden" value="selectRecipeListPo">
				<p class="recipe-sort-by">인기셰프순</p>
			</div>
		</div>
		<!-- 레시피 키워드 검색창 -->
		<div id="recipe-search-area">
			<form action="#" method="get">
				<div>
					<input type="text" name="recipeSearchWord">
				</div>
				<div><input type="submit" value="검색"></div>
			</form>
		</div>
	</div>
	

	<!-- 정렬기준에 맞게 레시피리스트 조회 요청 -->
	<script>
		$(function(){
			$('.recipe-sort-by').click(function(){
				const sortBy = $(this).siblings().val();
				location.href = '<%= request.getContextPath() %>/' + sortBy + '.re';s
			})
		})
	</script>



</body>
</html>