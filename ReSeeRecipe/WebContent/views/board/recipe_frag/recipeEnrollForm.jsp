<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
			     java.util.HashMap,
			     com.kh.semi.board.recipe.model.vo.*,
			     com.kh.semi.board.board_common.model.vo.*,
			     com.kh.semi.common.model.vo.PageInfo" %>

<%
	//recipeEnrollForm용 카테고리, 계량단위 정보
	HashMap<String, Object> mapEnrollForm = (HashMap)request.getAttribute("mapEnrollForm");
	ArrayList<RecipeCategory> cList = (ArrayList)mapEnrollForm.get("cList");
	ArrayList<IngredientMeasure> iList = (ArrayList)mapEnrollForm.get("iList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇ입력폼</p>
</body>
</html>