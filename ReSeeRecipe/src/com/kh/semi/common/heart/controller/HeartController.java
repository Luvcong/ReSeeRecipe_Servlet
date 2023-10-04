package com.kh.semi.common.heart.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.heart.model.service.HeartService;
import com.kh.semi.common.heart.model.vo.Heart;


public class HeartController {
	
	
	private boolean isNumber(String target) {
		boolean validation = Pattern.matches("^[0-9]$", target);
		return validation;
	}
	
	
	public String heartCount(HttpServletRequest request, HttpServletResponse response) {
		
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
			result = new HeartService().heartCount(ht);
		}
		
		return result;
	}
	
	
	public boolean heartAddCancel(HttpServletRequest request, HttpServletResponse response) {
		
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
			
			result = new HeartController().heartAddCancel(ht);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}//end