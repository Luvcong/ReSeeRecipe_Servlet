package com.kh.semi.dm.model.vo;

import java.sql.Date;

public class Dm {

	//	TB_DM TABLE COLUMN
	//	DM_NO	NUMBER
	//	RECEIVE_MEM	VARCHAR2(15 BYTE)
	//	SEND_MEM	VARCHAR2(15 BYTE)
	//	DM_CONTENT	VARCHAR2(500 BYTE)
	//	SEND_DATE	DATE
	//	DM_STATUS	VARCHAR2(1 BYTE)
	
	private int dmNo;
	private String receiveMem;
	private String sendMem;
	private String dmContent;
	private Date sendDate;
	private String dmStatus;
	
	// 기본생성자
	public Dm() {
		super();
	}
	
	// 매개변수 생성자
	public Dm(int dmNo, String receiveMem, String sendMem, String dmContent, Date sendDate, String dmStatus) {
		super();
		this.dmNo = dmNo;
		this.receiveMem = receiveMem;
		this.sendMem = sendMem;
		this.dmContent = dmContent;
		this.sendDate = sendDate;
		this.dmStatus = dmStatus;
	}
	
	
	// getter, setter
	public int getDmNo() {
		return dmNo;
	}

	public void setDmNo(int dmNo) {
		this.dmNo = dmNo;
	}

	public String getReceiveMem() {
		return receiveMem;
	}

	public void setReceiveMem(String receiveMem) {
		this.receiveMem = receiveMem;
	}

	public String getSendMem() {
		return sendMem;
	}

	public void setSendMem(String sendMem) {
		this.sendMem = sendMem;
	}

	public String getDmContent() {
		return dmContent;
	}

	public void setDmContent(String dmContent) {
		this.dmContent = dmContent;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getDmStatus() {
		return dmStatus;
	}

	public void setDmStatus(String dmStatus) {
		this.dmStatus = dmStatus;
	}

	@Override
	public String toString() {
		return "MemberDm [dmNo=" + dmNo + ", receiveMem=" + receiveMem + ", sendMem=" + sendMem + ", dmContent="
				+ dmContent + ", sendDate=" + sendDate + ", dmStatus=" + dmStatus + "]";
	}
	
}	// end class
