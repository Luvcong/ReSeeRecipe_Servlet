<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	//페이지처리용 변수
	/*
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
<style>
	div {
		box-sizing: border-box;
	}

	#recipeMainViewWrap {
		width: 1000px;
		height: 1000px;
		margin: auto;
	}

	.thumbnailContariner {
		width: 300px;
		height: 500px;
		margin-top: 30px;
	}
	
	.thumbnailTop {
		width: 100%;
		height: 300px;
		background: #aaa;
	}

	.thumbnailBottom {
		width: 100%;
		height: 200px;
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
			<!-- 레시피 글 블록 (9개 생성) -->
			<div class="thumbnailContariner">
			
				<!-- 상단 이미지부분 -->
				<div class="thumbnailTop">
					<img rsc="">
				</div>
				
				<!-- 하단 레시피정보부분 -->
				<div class="thumbNailBottom">
					<div class="thumnailLeftBottom">
						<div>
							<p>레시피 제목</p>
						</div>
						<div>
							<p>셰프이름</p>
						</div>
					</div>
					<!-- 조회수 / 하트 -->
					<div class="thumbnailRightBottom">
						<div>
							<p>Views</p>
							<img rsc="">
						</div>
						<div>
							<p>Likes</p>
							<img rsc="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 레시피 글 블록 wrap 끝 -->

		<!-- 레시피들을 띄울 영역 -->
		
		<!-- 페이징 영역 -->
		<div>
			
		</div>
	</div>
	<!-- 전체를 감싸는 div -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 푸터 -->
	<%@ include file="/views/common/footer.jspf" %>
</body>
</html>