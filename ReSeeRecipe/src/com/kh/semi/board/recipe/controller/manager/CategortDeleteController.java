package com.kh.semi.board.recipe.controller.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.kh.semi.board.recipe.model.service.CategoryService;

/**
 * Servlet implementation class CategortDeleteController
 */
@WebServlet("/jhdelete.ct")
public class CategortDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategortDeleteController() {
        super();
        categoryService = new CategoryService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) get 인코딩xx
		// 1-1) 형식지정
		// 2) 전달값뽑기 - 배열
		String[] categoryArr = request.getParameterValues("categoryNo");
		System.out.println(categoryArr);
		
		// 3) 데이터가공 xx
		// 4) Service호출
		JSONArray jArr = new JSONArray();
		for(String arr : categoryArr) {
			int categoryNo = Integer.parseInt(arr);
			int result = categoryService.deleteCategory(categoryNo);
			if(result > 0) {
				jArr.add(categoryNo);
			}
		}
		
		// 5) 형식 및 인코딩 / 화면
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(jArr, response.getWriter());
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
