package com.kh.semi.heart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;

public class HeartController {
	
	public Object heartCount(HttpServletRequest request, HttpServletResponse response) {
		
		Object result = null;
		
		// 컨트롤러단에서 필터링 필요 null을 보내진 않아야함
		
		
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
		 * p.s. success, error등의 경우 화면단에서 각자 자유롭게 구현하시면 됩니다		
		 * 
		 */
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		int htTargetNo = Integer.parseInt(request.getParameter("htTargetNo"));
		String htKind = request.getParameter("htKind");
		
		
		
		
		
		
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}//end