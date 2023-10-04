package com.kh.semi.common.heart.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.heart.model.service.AjaxHeartService;
import com.kh.semi.common.heart.model.vo.Heart;
import com.kh.semi.member.model.vo.Member;

public class AjaxHeartController {
	
	
	private boolean isNumber(String htTargetNoStr) {
		boolean validation = Pattern.matches("^[0-9]*$", htTargetNoStr);
		System.out.println(htTargetNoStr);
		System.out.println(validation);
		return validation;
	}
	/****************************************************************************/
	
	
	/****************************************************************************/
	public int htChangeRecipe(HttpServletRequest request, HttpServletResponse response) {
		// 변수세팅
		int result = 0;
		
		// 값 추출
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		String htTargetNoStr = request.getParameter("htTargetNo");
		
		// Controller단 입력값 검사
		if(isNumber(htTargetNoStr)) {
			// 자료형 검사 통과 후 ht객체에 담기
			Heart ht = new Heart(memNo, Integer.parseInt(htTargetNoStr));
			result = new AjaxHeartService().htChangeRecipe(ht);
		}
		return result;
	}
	
	
	public int htChangeBookmark(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		String htTargetNoStr = request.getParameter("htTargetNo");
		
		if(isNumber(htTargetNoStr)) {
			Heart ht = new Heart(memNo, Integer.parseInt(htTargetNoStr));
			result = new AjaxHeartService().htChangeBookmark(ht);
		}
		return result;
	}
	
	
	public int htChangeNotice(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		String htTargetNoStr = request.getParameter("htTargetNo");
		
		if(isNumber(htTargetNoStr)) {
			Heart ht = new Heart(memNo, Integer.parseInt(htTargetNoStr));
			result = new AjaxHeartService().htChangeNotice(ht);
		}
		return result;
	}
	
	
	public int htChangeSubsc(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		String htTargetNoStr = request.getParameter("htTargetNo");
		
		if(isNumber(htTargetNoStr)) {
			Heart ht = new Heart(memNo, Integer.parseInt(htTargetNoStr));
			result = new AjaxHeartService().htChangeSubsc(ht);
		}
		return result;
	}
	
	
	public int htChangeReply(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
		String htTargetNoStr = request.getParameter("htTargetNo");
		
		if(isNumber(htTargetNoStr)) {
			Heart ht = new Heart(memNo, Integer.parseInt(htTargetNoStr));
			result = new AjaxHeartService().htChangeReply(ht);
		}
		return result;
	}
	/****************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String ajaxHeartCount(HttpServletRequest request, HttpServletResponse response) {
		
		// 변수세팅
		String result = "";
		
		// 값 추출
		String htTargetStr = request.getParameter("htTargetNo").trim();
		String htKind = request.getParameter("htKind").trim().toUpperCase();
		
		// Controller단 입력값 검사
		if(isNumber(htTargetStr)) {

			// 자료형 검사 통과 후
			int htTargetNo = Integer.parseInt(htTargetStr);
			
			Heart ht = new Heart();
			ht.setHtTargetNo(htTargetNo);
			ht.setHtKind(htKind);
			
			// Service의 메소드 호출
			result = new HeartService().ajaxHeartCount(ht);
		}
		
		return result;
	}
	
	
	public boolean ajaxHeartAddCancel(HttpServletRequest request, HttpServletResponse response) {
		
		// 변수세팅
		boolean result = false;
		
		// 값 추출
		String memNoStr = request.getParameter("memNo");
		String htTargetNoStr = request.getParameter("htTargetNo");
		String htKind = request.getParameter("htKind");
		
		// Controller단 입력값 검사
		if(isNumber(memNoStr) && isNumber(htTargetNoStr)) {
			
			// 자료형 검사 통과 후
			int memNo = Integer.parseInt(memNoStr);
			int htTargetNo = Integer.parseInt(htTargetNoStr);
			
			Heart ht = new Heart();
			ht.setMemNo(memNo);
			ht.setHtTargetNo(htTargetNo);
			ht.setHtKind(htKind);
			
			result = new AjaxHeartController().ajaxHeartAddCancel(ht);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}//end