package com.kh.semi.heart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.heart.model.service.HeartService;
import com.kh.semi.heart.model.vo.Heart;

public class HeartController {
	
	public String heartCount(HttpServletRequest request, HttpServletResponse response) {
		
		/* 
		 * 단일 대상 하트 개수 카운트 기능 ajax요청 시 인스트럭션
		 * type : 'post'
		 * url  : heartCount.ht
		 * data :
		 * 	{ htTargetNo : 하트 받은 대상(게시글/유저)의 PK
		 * 	  htKind     : 레시피의 경우 RECIPE
		 * 				      북마크의 경우 BOOKMARK
		 * 				      노티스의 경우 NOTICE
		 * 				      구독의 경우    SUBSC
		 * 				      리플의 경우    REPLY }
		 * 
		 * p.s. success, error등의 경우 화면단에서 각자 자유롭게 구현			
		 */
		
		// 값 추출 + 가공
		int htTargetNo = Integer.parseInt(request.getParameter("htTargetNo"));
		String htKind = request.getParameter("htKind").toUpperCase();
		
		Heart ht = new Heart(htTargetNo, htKind);
		
		// Service의 메소드 호출
		String result = new HeartService().heartCount(ht);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}//end