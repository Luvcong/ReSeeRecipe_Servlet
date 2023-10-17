package com.kh.semi.coupon.model.vo;

import java.sql.Date;

public class Coupon {
	
//	COUPON_NO	NUMBER
//	COUPON_NAME	VARCHAR2(30 BYTE)
//	COUPON_RATIO	NUMBER
//	COUPON_AVAIL	VARCHAR2(1 BYTE)
//	COUPON_REASON	VARCHAR2(500 BYTE)
//	COUPON_STARTDATE	DATE
//	COUPON_ENDDATE	DATE
	
	private int couponNo;
	private String couponName;
	private int couponRatio;
	private String couponAval;
	private String couponReason;
	private Date couponStartdate;
	private Date EndDate;
	
	public Coupon() {
		super();
	}

	public Coupon(int couponNo, String couponName, int couponRatio, String couponAval, String couponReason,
			Date couponStartdate, Date endDate) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponRatio = couponRatio;
		this.couponAval = couponAval;
		this.couponReason = couponReason;
		this.couponStartdate = couponStartdate;
		EndDate = endDate;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getCouponRatio() {
		return couponRatio;
	}

	public void setCouponRatio(int couponRatio) {
		this.couponRatio = couponRatio;
	}

	public String getCouponAval() {
		return couponAval;
	}

	public void setCouponAval(String couponAval) {
		this.couponAval = couponAval;
	}

	public String getCouponReason() {
		return couponReason;
	}

	public void setCouponReason(String couponReason) {
		this.couponReason = couponReason;
	}

	public Date getCouponStartdate() {
		return couponStartdate;
	}

	public void setCouponStartdate(Date couponStartdate) {
		this.couponStartdate = couponStartdate;
	}

	public Date getEndDate() {
		return EndDate;
	}

	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
	
}	// end class
