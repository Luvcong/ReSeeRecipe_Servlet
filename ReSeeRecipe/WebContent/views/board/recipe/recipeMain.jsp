<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.recipe-thumbnail{
	}

</style>

</head>
<body>
	<%@ include file="/views/common/header.jspf" %>
	
	<%@ include file="/views/board/recipe_frag/recipeCategoryBar.jsp" %>
	<%@ include file="/views/board/recipe_frag/recipeSortBar.jsp" %>

	<section>
	<!-- 레시피 전체조회 + 페이징바 / 레시피 상세조회 + 댓글영역 -->
	<!-- 레시피 전체조회 -->
	<div id="board-outer">
	
		<div class="recipe-thumbnail">
		d
		</div>
	
	
		<!--
		<br>
		<!-- 로그인 유저면 글작성 활성화
		<%-- if(loginMember != null) { %>
			<a href="<%= contextPath %>/recipeEnrollForm.re">글작성</a>
		<% } %>
		<br>
		<div class="recipe-list-area">
			<% if(list.isEmpty()) { %><!-- 게시글이 없을경우
				등록된 게시글이 없습니다 <br>
			<% } else { %><!-- 게시글이 있을 경우
				<!-- 9개 영역에 출력
				<div>
					<img src="" alt=""><!-- 레시피 사진

				</div>

			<% } %>

		</div>
			<% if(list.isEmpty()) { %>
				등록된 게시글이 없습니다 <br>
			<% else { %>

				<% for(recipe r : list) { %>
					<div class="recipe-thumbnail">
						<img src="" alt="">레시피썸네일사진
					</div>
					<div class="recipe-summary">
						
					</div>
				<% } %>
			<% } --%>
		</table>-->



	</div>


	
	
	
	
			
		
	</section>


	<%@ include file="/views/common/footer.jspf" %>
</body>
</html>