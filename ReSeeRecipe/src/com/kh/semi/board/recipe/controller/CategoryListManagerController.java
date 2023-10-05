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
		ArrayList<RecipeCategory> list = 
		// 5) 응답화면 지정 (ajax사용)
		// 5-1) 인코딩과 형식 지정해주기
		response.setContentType("application/json; charset=UTF-8");
		
		/* 헬로!
		 * 오늘도 새벽 1:25분이라... 너무 늦어 여기에 편지를 남깁니다,,,,,,
		 * 읽고 지워줘요...,,,
		 * 
		 * 개인적인 의견인데 관리자 기능들을 관리자 폴더에 정리해두면 유지보수하기가 편하지 않을까 해서요
		 * 
		 * 예를들어 폴더 이름이 ABC라고 치면 ABC 내에 member, notice, board, tag, product 등 폴더 두고
		 * ABC > member 내에는 member관리 관련 기능들(controller/model=dao/service/vo)
		 * ABC > notice 내에는 notice관리 관련 기능들 . . .
		 * 이런 식으로요
		 * 
		 * + 화면jsp파일들도 저런 식으로 분류하고요
		 * 그러면 화면쪽 폴더들 / src내 폴더들에 관리자기능만 다 정리되고
		 * 각각 한 폴더 내에는 매핑값 끝 (어쩌고저쩌고.ct)도 한가지로 통일되고
		 * 서로 구조가 매칭되어서 찾기 편함! 한 군데에서 찾으면 됨! 작업이 즐거워짐! 신남!
		 * 
		 * 그래서개인적으로 ABC폴더같은거 하나 만들고 하위 구조를 나눠 정리하는게 좋지않나 싶습니다
		 * 두분 작업할때도 아마 훨씬 편하지 않을까 해요 그럼.....안녕..... 내일봐요........
		 * 
		 * - MJY
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
