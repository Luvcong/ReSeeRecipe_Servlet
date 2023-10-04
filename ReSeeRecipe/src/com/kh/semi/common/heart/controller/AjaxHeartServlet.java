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
		
		// 기본변수 / POST용 Encoding 세팅
		Object result = "";
	
		// loginMember 검사
		// 로그인유저만 요청 가능 (테스트 위해 잠시 블러처리)
		//if((request.getSession().getAttribute("loginMember")) != null) {
			AjaxHeartController htc = new AjaxHeartController();
			request.setCharacterEncoding("UTF-8");

			// 매핑문자열 키워드 추출
			String uri = request.getRequestURI();
			String mapping = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
			
			// Controller 분배 구문
			switch(mapping) {
			
				/* 
				 * - ajax요청 시 인스트럭션
				 * - heartCount : 단일 대상이 받은 총 하트 개수 카운트
				 * - heartCheck : 해당 유저가 해당 대상에 하트를 눌렀는지 체크 후 하트추가/삭제
				 * 
				 * type : 'post'
				 * url  : switch-case의 매핑값이름.ht
				 * data : 필요한 data들 아래 키값으로 넘김
				 * 	{
				 * 	  htTargetNo : 하트 받은 대상(게시글/유저)의 PK
				 * }
				 * 
				 * p.s. success, error등의 경우 화면단에서 각자 자유롭게 구현			
				 */
			
				// 성공 시 하트 카운트 수(0 ~ 의 숫자) or 혹시라도 뭔가 일이있어 실패 시 빈문자열
				/* 단일 대상에 하트가 몇개인지 count : String반환
				case "ajHtCountRecipe" : result = htc.ajaxHeartCount(request, response); break;
				case "ajHtCountBookmark" : break;
				case "ajHtCountNotice" : break;
				case "ajHtCountSubsc" : break;
				case "ajHtCountReply" : break;*/
				
				/* 하트 추가 or 삭제 : 1 or 0반환 (SELECT + IN/DEL) */
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
		//}
			
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
