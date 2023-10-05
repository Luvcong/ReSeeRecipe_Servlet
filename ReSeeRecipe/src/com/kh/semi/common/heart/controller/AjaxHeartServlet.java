package com.kh.semi.common.heart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class HeartServlet
 * 
 * 하트관련 모든 요청을 받아주는 Servlet입니다
 * 매핑값은 *.ht입니다
 * 
 */
@WebServlet("*.ht")
public class AjaxHeartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHeartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST용 Encoding 세팅
		request.setCharacterEncoding("UTF-8");
		
		// 기본 변수 세팅
		Object result = "";
		AjaxHeartController htc = new AjaxHeartController();
		
		// 매핑문자열 키워드 추출
		String uri = request.getRequestURI();
		String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		// loginMember 검사
		// 로그인유저만 요청 가능 (테스트 위해 잠시 블러처리)
		if((request.getSession().getAttribute("loginMember")) == null) {
			switch(mapping) {
				// 성공 시 하트 카운트 수(0 ~ 의 숫자) or 혹시라도 뭔가 일이있어 실패 시 빈문자열
				/* 단일 대상에 하트가 몇개인지 count : String반환 */
				case "htCountRecipe" : result = htc.htCountRecipe(request, response); break;
				/*
				case "htCountBookmark" : result = htc.htCountBookmark(request, response); break;
				case "htCountNotice" : result = htc.htCountNotice(request, response); break;
				case "htCountSubsc" : result = htc.htCountSubsc(request, response); break;
				case "htCountReply" : result = htc.htCountReply(request, response); break;
				*/
		
			}
		} else {

			// Controller 분배 구문
			switch(mapping) {
			
				/* 
				 * - ajax요청 시 인스트럭션
				 * - heartCount*  : 단일 대상이 받은 총 하트 개수 카운트
				 * - heartChange* : 해당 유저가 해당 대상에 하트를 눌렀는지 체크 후 하트추가/삭제
				 * 
				 * type : 'post'
				 * url  : switch-case의 매핑값이름.ht
				 * data : { htTargetNo : 하트 받은 대상(게시글/유저)의 PK를 같이 넘겨야함 }
				 * 
				 */
			
				
				/* 하트 추가/삭제 : 1이나 0반환 (SELECT + IN/DEL) */
				case "htChangeRecipe" : result = htc.htChangeRecipe(request, response); break;
				case "htChangeBookmark" : result = htc.htChangeBookmark(request, response); break;
				case "htChangeNotice" : result = htc.htChangeNotice(request, response); break;
				case "htChangeSubsc" : result = htc.htChangeSubsc(request, response); break;
				case "htChangeReply" : result = htc.htChangeReply(request, response); break;

				/* 하트 추가 전 체크, Ajax요청
				case "heartAddCancel" : result = htc.ajaxHeartAddCancel(request, response); break;
				*/
				
				
				
				
				
				default : break; // 뭔가 실패 시 빈문자열 반환
			}
		}
			
		// 응답 전 세팅 및 응답 (키값은 전부 result)
			
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
