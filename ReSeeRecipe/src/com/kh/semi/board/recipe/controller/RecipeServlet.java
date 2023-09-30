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
			case "selectRecipeListLt" : viewPath = rc.selectRecipeListLt(request, response); break;
			
			
			
		}
		
		// forward or sendRedirect ( flag = false
		if(flag) { request.getRequestDispatcher(viewPath).forward(request,response); }
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
