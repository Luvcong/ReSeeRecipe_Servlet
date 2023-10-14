package com.kh.semi.tag.model.vo;

import java.sql.Date;

public class Tag {
	
	private int tagNo; //TAG_NO SEQ_TAG 해시태그 번호
	private String tagName; //TAG_NAME 해시태그 이름
	private Date tagDate; //TAG_DATE 해시태그 등록날짜
	
	public Tag() {
		super();
	}

	public Tag(int tagNo, String tagName, Date tagDate) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagDate = tagDate;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Date getTagDate() {
		return tagDate;
	}

	public void setTagDate(Date tagDate) {
		this.tagDate = tagDate;
	}

	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + ", tagDate=" + tagDate + "]";
	}
	
}
