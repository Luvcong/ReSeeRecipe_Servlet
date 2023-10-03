package com.kh.semi.heart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HeartServlet
 * 
 * 하트관련 모든 요청을 받아주는 Servlet입니다
 * 매핑값은 *.ht입니다
 * 
 */
@WebServlet("*.ht")
public class HeartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 기본변수 / POST용 Encoding 세팅
		boolean flag = true;
		String viewPath = "";
		HeartController htc = new HeartController();
		request.setCharacterEncoding("UTF-8");
		
		// 매핑문자열 키워드 추출
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		
		// Controller 분배 구문
		switch(mapping) {
			/* 하트 개수 카운트 기능 ajax요청 시 인스트럭션
			 * type : 'post'
			 * url  : heartCount.ht
			 * data :
			 * 	{ memNo 	    : 하트누른 멤버 PK
			 * 		 htTargetNo : 하트 받은 게시글/유저의 PK
			 * 		 htKind	    : 레시피의 경우 RECIPE
			 * 					    북마크의 경우 BOOKMARK
			 * 					    노티스의 경우 NOTICE
			 * 					    구독의 경우    SUBSC
			 * 					    리플의 경우    REPLY }
			 * 			
			 *  
			 */
			case "heartCount" : htc.heartCount(request, response);
		
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
