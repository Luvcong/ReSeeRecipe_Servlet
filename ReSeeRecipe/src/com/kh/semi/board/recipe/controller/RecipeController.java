package com.kh.semi.board.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.common.model.vo.PageInfo;


public class RecipeController {
	
	
	
	public String selectRecipeCategoryList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		ArrayList<RecipeCategory> cList = new RecipeService().selectRecipeCategoryList();
		
		if(!cList.isEmpty()) {
			request.setAttribute("cList", cList);
		}
		
		viewPath = "/views/board/recipe_frag/recipeCategoryBar.jsp";
		
		return viewPath;
	}
	
	
	
	
	
	public String recipeEnrollForm(HttpServletRequest request, HttpServletResponse response) {
		

		String viewPath = "";
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		HashMap<String, Object> mapEnrollForm = new RecipeService().recipeEnrollForm(memNo);
		
		if(!mapEnrollForm.isEmpty()) {
			// map내용이  있을 때 viewPath
			request.setAttribute("mapEnrollForm", mapEnrollForm);
			viewPath = "/views/board/recipe/recipeEnrollForm.jsp";
		} else {
			// map내용이 없을 때 viewPath
			request.setAttribute("errorMsg", "게시글 입력요청 실패");
			viewPath = "/views/common/errorPage.jsp";
		}
		
		return viewPath;
	}
	
	
	public String selectRecipeList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		// 레시피 전체 리스트 조회
		// 값뽑기
		// 데이터가공
		// 서비스호출
		// 응답화면지정
		
		
		
		// 페이징 관련 설정
		int listCount = new RecipeService().selectRecipeListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		PageInfo pi = new PageInfo(listCount, currentPage, 10, 9);
		
		// 레시피 게시글 조회 (페이징적용)
		ArrayList<Recipe> list = new RecipeService().selectRecipeListLt(pi);
		
		viewPath = "/views/board/recipe/recipeMain.jsp";
		
		
		return viewPath;
	}
	
	
	
	
	
	
	
	
	
	
}//class.end