package com.kh.semi.board.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeController {
	
	public String selectRecipeListLt(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		
		// 페이징 관련 설정
		int listCount = new RecipeService().selectRecipeListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		PageInfo pi = new PageInfo(listCount, currentPage, 10, 9);
		
		// 레시피 게시글 조회
		ArrayList<Recipe> list = new RecipeService().selectRecipeListLt(pi);
		
		// 게시판 조회
		// 사진 조회
		
		
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