package com.kh.semi.board.recipe.controller.RecipeControllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecipeErrorController {
	
	private String viewPath = "/views/common/errorPage.jsp";
	
	/**
	 * 레시피 전체조회 결과가 없을 시 에러메세지와 함께 에러페이지로 포워딩
	 * @return 레시피 전체조회 결과 없을 시 에러 메세지
	 */
	public String errorNoRecipeList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("errorMsg", "조회된 게시글이 존재하지 않습니다");
		return viewPath;
	}
	
	
	/**
	 * 레시피 서블릿(RecipeServlet)에 예상하지 못한 매핑값으로 요청이 들어왔을 때 디폴트 에러메세지와 함께 에러페이지로 포워딩
	 * @return 디폴트 에러메세지
	 */
	public String errorDefault(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("errorMsg", "??? 알 수 없는 요청입니다 ???");
		return viewPath;
	}

}
