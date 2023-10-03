package com.kh.semi.heart.model.vo;

/**
 * @author JY
 * 
 * Heart기능들 공통 VO
 * 특정 레시피글, 댓글, 북마크, 공지사항글, 셰프구독의 하트(좋아요)
 * 
 * memNo 	  : 하트 누른 회원 PK번호
 * htTargetNo : 하트 대상 PK번호 (RECIPE_NO, REPLY_NO 등)
 * htDate 	  : 하트 누른 날짜 (정렬기준용)
 * htCount    : 하트 개수
 */
public class Heart {

	
	private int memNo;
	private int htTargetNo;
	private String htDate;
	private int htCount;
	
	
	public Heart() {
		super();
	}
	public Heart(int memNo, int htTargetNo, String htDate, int htCount) {
		super();
		this.memNo = memNo;
		this.htTargetNo = htTargetNo;
		this.htDate = htDate;
		this.htCount = htCount;
	}
	
	
	public int getMemNo() {
		return memNo;
	}
	public int getHtTargetNo() {
		return htTargetNo;
	}
	public String getHtDate() {
		return htDate;
	}
	public int getHtCount() {
		return htCount;
	}
	
	
	@Override
	public String toString() {
		return "Heart [memNo=" + memNo + ", htTargetNo=" + htTargetNo + ", htDate=" + htDate + ", htCount=" + htCount
				+ "]";
	}
	
	
}//end