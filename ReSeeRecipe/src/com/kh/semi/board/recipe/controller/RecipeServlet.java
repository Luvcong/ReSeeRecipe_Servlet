package com.kh.semi.board.recipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RecipeServletController
 */
@WebServlet("*.re")
public class RecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 기본변수 세팅
		boolean flag = true;
		String viewPath = "";
		
		RecipeController rc = new RecipeController();
		
		// 인코딩 세팅
		request.setCharacterEncoding("UTF-8");	
		
		// uri 매핑문자열 추출
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		System.out.println(mapping);
		// Controller로 분배
		switch(mapping) {
			/* 레시피보기 기본 (최신순) */
			case "selectRecipeList" : viewPath = rc.selectRecipeList(request, response); break;
			
			// 레시피보기 좋아요순 selectRecipeListHt
			//case "selectRecipeListHt" : System.out.println(mapping); break;
			
			// 레시피보기 조회수순 selectRecipeListVw
			//case "selectRecipeListVw" : System.out.println(mapping); break;
			
			// 레시피보기 인기셰프순 selectRecipeListPo
			//case "selectRecipeListPo" : System.out.println(mapping); break;
			
			
			
			/* 카테고리 리스트 조회 */
			case "selectRecipeCategoryList" : viewPath = rc.selectRecipeCategoryList(request, response); break;
			
			// 글작성하기 양식 요청 recipeEnrollForm => 카테고리 재료계량단위 임시저장글정보 조회 필요 // 해시태그는 Ajax => 이후 forward
			case "recipeEnrollForm" : viewPath = rc.recipeEnrollForm(request, response); break;
			
			
			// 글작성양식에 입력된 값 받아 서버에 insert(작성) => 이후 redirect
			//case "insertRecipe" : break;
			
			// 레시피 키워드 검색하기 searchKeyWord (제목 / 작성자)
			//case "searchKeyWord" : System.out.println(mapping); break;
			
			
			
			case "errorNoRecipeList" : viewPath = rc.errorNoRecipeList(request, response); break;
			default : System.out.println("잘못된 요청입니다 이전 화면으로 돌아갑니다"); break;
		}
		
		// forward or sendRedirect ( flag = false로 만들면 redrect)
		if(flag) { request.getRequestDispatcher(viewPath).forward(request, response); }
		else 	 { response.sendRedirect(viewPath); }
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
