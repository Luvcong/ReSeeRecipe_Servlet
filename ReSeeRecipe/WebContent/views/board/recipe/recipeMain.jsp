<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.kh.semi.board.recipe.model.vo.Recipe, com.kh.semi.common.model.vo.PageInfo" %>
<%	
	// 조회된 글 정보
	ArrayList<Recipe> list = (ArrayList)request.getAttribute("list");
	
	// 페이지처리용 변수
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 메인</title>
<style>
	#board-outer{
		width: 1000px;
		height: 1000px;
		margin: auto;
		color: white;
	}
	

</style>

</head>
<body>
	<%@ include file="/views/common/header.jspf" %>
	
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jsp" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jsp" %>

	<section>
	<!-- 레시피 전체조회 + 페이징바 / 레시피 상세조회 + 댓글영역 -->
	<div>

		<% if(list.isEmpty()) { %>
			<p>조회 결과가 없습니다</p>
		<% } else { %>
			<!-- 9개씩 출력 -->
			<% for(int i = 0; i < 9; i++) { %>
				<div class="recipeThumbnail" align="center">
					<input type="hidden" value="<%= list.get(i).getRecipeNo() %>">


				</div>
			<% } %>

		<% } %>
		<!-- 레시피 조회결과 첫 3개 -->
		<div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<!-- 레시피 조회결과 중간 3개 -->
		<div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<!-- 레시피 조회결과 마지막 3개 -->
		<div>
			<div></div>
			<div></div>
			<div></div>
		</div>




	</div>
	
	
	
	
	
	
	<!-- 페이징바 -->
	
	
	
	
			
		
	</section>


	<%@ include file="/views/common/footer.jspf" %>
</body>
</html>