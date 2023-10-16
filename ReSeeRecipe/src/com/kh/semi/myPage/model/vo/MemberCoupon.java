package com.kh.semi.myPage.model.vo;

import java.sql.Date;

public class MemberCoupon {
	
//	MEM_NO	NUMBER
//	COUPON_NO	NUMBER
//	MEMBER_COUPON_DATE	DATE
//	MEMBER_COUPON_STATUS	VARCHAR2(1 BYTE)
	
	private int memNo; // FK
	private int couponNo; // PK
	private Date memberCouponDate; // 지급일 (최근순)
	private String memberCouponStatus; // 사용여부
	
	private int couponRatio; // 할인율(할인순)
	private int memberCouponCount; // 쿠폰개수
	private String couponName; // 쿠폰이름
	private Date couponEnddate; // 만료기한(만료기한순)
	
	

}
