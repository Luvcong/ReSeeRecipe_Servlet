package com.kh.semi.board.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeController {
	
	/*
	RECIPE_NO               SEQ_RECIPE 레시피PK
	RECIPE_TITLE            NN
	RECIPE_DATE           NN
	RECIPE_MODIFIED   기본SYSDATE
	RECIPE_STATUS     기본SYSDATE
	RECIPE_COUNT      기본0
	RECIPE_WRITER_NO  NN작성회원PK
	RECIPE_CATEGORY_NO  카테고리번호PK
	
	
	
	
	
	*/
	// 레시피 글 작성
	//public String insertRecipe {
		
	//}
	
	public String selectRecipeListLt(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		
		// 페이징 관련 설정
		int listCount = new RecipeService().selectRecipeListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		PageInfo pi = new PageInfo(listCount, currentPage, 10, 9);
		
		// 레시피 게시글 조회 (페이징적용)
		ArrayList<Recipe> list = new RecipeService().selectRecipeListLt(pi);
		
		
		
		
		return viewPath;
	}
	
	public String selectRecipeList(HttpServletRequest request, HttpServletResponse response) {
		// 레시피 전체 리스트 조회
		// 값뽑기
		// 데이터가공
		// 서비스호출
		// 응답화면지정
		String viewPath = "";
		return viewPath;
	}
	
	
	
	
	
	
	
	
	
	
	
}//class.end