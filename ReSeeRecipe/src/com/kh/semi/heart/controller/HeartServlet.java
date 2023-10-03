package com.kh.semi.heart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
		Object result = null;
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
			 * 	{ htTargetNo : 하트 받은 게시글/유저의 PK
			 * 	  htKind     : 레시피의 경우 RECIPE
			 * 				      북마크의 경우 BOOKMARK
			 * 				      노티스의 경우 NOTICE
			 * 				      구독의 경우    SUBSC
			 * 				      리플의 경우    REPLY }
			 * 
			 * p.s. success, error등의 경우 화면단에서 각자 자유롭게 구현하시면 됩니다		
			 * 
			 */
			/* GSON으로 만들 응답객체or배열 만들기 */	
			case "heartCount" : result = htc.heartCount(request, response); break;
			default : result = ""; // 여기서 기본 리턴설정
		}
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(result, response.getWriter());
		
		
	
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
