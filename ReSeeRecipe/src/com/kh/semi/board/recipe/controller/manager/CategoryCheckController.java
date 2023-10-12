package com.kh.semi.board.recipe.controller.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.recipe.model.service.CategoryService;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;

/**
 * Servlet implementation class CategoryCheckController
 */
@WebServlet("/jhcheck.ct")
public class CategoryCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryCheckController() {
        super();
        categoryService = new CategoryService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) post
		request.setCharacterEncoding("UTF-8");
		// 2) 값
		String checkCategoryName = request.getParameter("checkCategoryName");
		System.out.println(checkCategoryName);
		// 3) 가공xx
		// 4) 요청
		ArrayList<RecipeCategory> list = categoryService.checkCategory(checkCategoryName);
		// 5) 응답하면
		System.out.println(list);
		request.setAttribute("list", list);
		response.sendRedirect(request.getContextPath() + "jhselect.ct?page=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
