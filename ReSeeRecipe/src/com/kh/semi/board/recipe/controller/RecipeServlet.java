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
		String viewPath = "";
		boolean flag = true;
		RecipeController rc = new RecipeController();
		
		// 인코딩 세팅
		request.setCharacterEncoding("UTF-8");	
		
		// uri 매핑문자열 추출
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		
		// Controller로 분배
		switch(mapping) {
			/* 홈페이지 메인 -> 레시피화면 메인으로 */
			// 최신순 selectRecipeListLt : viewPath = rc.selectRecipeListLt(request, response); break;
			case "selectRecipeListLt" : System.out.println(mapping); break;
			
			// 좋아요순 selectRecipeListHt
			case "selectRecipeListHt" : System.out.println(mapping); break;
			
			// 조회수순 selectRecipeListVw
			case "selectRecipeListVw" : System.out.println(mapping); break;
			
			// 인기셰프순 selectRecipeListPo
			case "selectRecipeListPo" : System.out.println(mapping); break;
			
			// 글작성하기 insertRecipe
			case "insertRecipe" : System.out.println(mapping); break;
			
			// 레시피 키워드 검색하기 searchKeyWord (제목 / 작성자)
			case "searchKeyWord" : System.out.println(mapping); break;
			
			default : System.out.println("잘못된 요청입니다 이전 화면으로 돌아갑니다");
			
		}
		
		// forward or sendRedirect ( flag = false
		//if(flag) { request.getRequestDispatcher(viewPath).forward(request,response); }
		//else 	 { response.sendRedirect(viewPath); }
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
