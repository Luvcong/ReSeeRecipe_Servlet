package com.kh.semi.board.recipe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;

public class RecipeController {
	
	public String selectLatestList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		//ArrayList<Recipe> list = new RecipeService().selectLatestList();
		//request.setAttribute("list", list);
		// 최신순으로 게시글 조회 (currentPage따라 9개씩)
		
		// 게시판 사진 조회하기
		//
		
		
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