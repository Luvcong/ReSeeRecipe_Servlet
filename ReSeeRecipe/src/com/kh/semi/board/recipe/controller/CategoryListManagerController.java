package com.kh.semi.board.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.CategoryManagerService;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;

/**
 * Servlet implementation class CategoryListController
 */
@WebServlet("/jhselect.ct")
public class CategoryListManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryManagerService categoryService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryListManagerController() {
        super();
        categoryService = new CategoryManagerService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) get - 인코딩x
		// 2) 전달값 뽑기 - select문으로 없음
		// 3) 데이터가공 xx
		// 4) service 호출
		ArrayList<RecipeCategory> list = categoryService.selectCategoryList();
		// 5) 응답화면 지정 (ajax사용)
		// 5-1) 인코딩과 형식 지정해주기
		response.setContentType("application/json; charset=UTF-8");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
