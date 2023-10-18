package com.kh.semi.board.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.controller.RecipeControllers.RecipeController;

/**
 * Servlet implementation class RecipeServletAjax
 */
@WebServlet("*.ar")
public class RecipeServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeServletAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 변수 세팅
		RecipeController rc = new RecipeController();
		System.out.println("Ajax서블릿 도착 RecipeServletAjax");
		
		// POST 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 문자열 추출
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		System.out.println("ajax매핑 : " + mapping);
		
		// Controller로 분배
		switch(mapping) {
			case "ajaxSelectTag" : rc.ajaxSelectTag(request, response); break;
			case "ajaxModifyRecipeReply" : rc.ajaxModifyRecipeReply(request, response); break;
			case "ajaxDeleteRecipeReply" : rc.ajaxDeleteRecipeReply(request, response); break;
			case "ajaxSelectRecipeReplyList" : rc.ajaxSelectRecipeReplyList(request, response); break;
			case "ajaxInsertRecipeReply" : rc.ajaxInsertRecipeReply(request, response); break;
			default : response.sendRedirect(rc.errorDefault(request, response)); break;
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
