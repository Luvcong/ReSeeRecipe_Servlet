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
	
	
	/**
	 * 페이지네이션 처리 된 레시피목록을 조회해옴 (레시피 전체조회)
	 * @param request
	 * @param response
	 * @return
	 */
	public String selectRecipeList(HttpServletRequest request, HttpServletResponse response) {
		
		// 변수세팅
		String viewPath = "";
		RecipeService rs = new RecipeService();
		
		int listCount = rs.selectRecipeListCount();
		int currentPage = request.getParameter("currentPage") != null ?
						  Integer.parseInt(request.getParameter("currentPage"))
						  : 1;
		int pageLimit = 10; // 페이징 바 개수
		int boardLimit = 9; // 한 페이지에 보일 게시글 수
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 페이지네이션을 위한 정보를 넘기며 서비스호출
		ArrayList<Recipe> rList = rs.selectRecipeList(pi);
		
		// 넘길 값 지정
		request.setAttribute("rList", rList);
		
		System.out.println("A Starting Row : " + pi.getStartRow());
		System.out.println("A End Row : " + pi.getEndRow());
		int i = 1;
		for(Recipe r : rList) {
			System.out.println(i + "컨트롤단ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + r);
			i++;
		}
		
		// 응답화면지정 (페이징적용 / 최신순 레시피 조회)
		//ArrayList<Recipe> list = new RecipeService().selectRecipeListLt(pi);
		viewPath = "/views/board/recipe/recipeMainView.jsp";
		
		return viewPath;
	}
	
	
	
	
	/**
	 * 카테고리 목록을 조회해 반환
	 * @param request : HttpServletRequest객체
	 * @param response : HttpServletResponse객체
	 * @return : 레시피 카테고리 목록이 담긴 ArrayList배열
	 */
	public String selectRecipeCategoryList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		ArrayList<RecipeCategory> cList = new RecipeService().selectRecipeCategoryList();
		
		if(!cList.isEmpty()) {
			request.setAttribute("cList", cList);
		} else {
			request.setAttribute("errorMsg", "에러가 발생했습니다");
			return "/views/common/errorPage.jsp";
		}
		viewPath = "/views/board/recipe_frag/recipeCategoryBar.jsp";
		return viewPath;
	}
	
	
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
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
	
	
	
	
	
	
	
	
	
	
	
}//class.end