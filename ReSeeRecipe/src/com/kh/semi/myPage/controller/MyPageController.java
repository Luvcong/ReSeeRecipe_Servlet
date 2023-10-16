package com.kh.semi.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.semi.myPage.model.service.MyPageService;
import com.kh.semi.myPage.model.vo.MemberCoupon;

public class MyPageController {
	
	// 회원 controller 너무 많아서 마이페이지는 controller 합쳤습니다. 쓰실분 쓰세요 - yr
	
	// 회원 쿠폰 조회로 이동
	public String MemberCouponList(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		// 1. 값 뽑기
		int memberNo = Integer.parseInt(request.getParameter("memNo"));
		String selected = request.getParameter("selected");
		
		System.out.println(selected);
		// 2. 데이터가공

		// 3. 서비스 호출
		ArrayList<MemberCoupon> list = new MyPageService().selectMemberCouponList(memberNo, selected);
		
		if(list != null) {
			request.setAttribute("memberCouponList", list);
		}
		
		// 4. 응답화면 지정
		String view = "views/myPage/memberCouponList.jsp"; //views/myPage/memberCouponList.jsp
		
		return view;
	}
	
	


}
