package com.kh.semi.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageController {
	
	// 회원 controller 너무 많아서 마이페이지는 controller 합쳤습니다. 쓰실분 쓰세요 - yr
	
	// 회원 쿠폰 조회로 이동
	public String MemberCouponListForm(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 값 뽑기
		
		// 2. 데이터가공
		
		// 3. 서비스 호출
		
		// 4. 응답화면 지정
		String view = "views/myPage/memberCouponList.jsp"; //views/myPage/memberCouponList.jsp
		
		return view;
	}

}
