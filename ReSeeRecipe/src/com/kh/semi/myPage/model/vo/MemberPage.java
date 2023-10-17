package com.kh.semi.myPage.model.vo;

public class MemberPage {
	
	
	private int visitantNum;
	private int reward;
	private String memberPic;
	private String nickName;
	private String grade;
	
	
	public MemberPage() {
		super();
	}


	public MemberPage(int visitantNum, int reward, String memberPic, String nickName, String grade) {
		super();
		this.visitantNum = visitantNum;
		this.reward = reward;
		this.memberPic = memberPic;
		this.nickName = nickName;
		this.grade = grade;
	}


	public int getVisitantNum() {
		return visitantNum;
	}


	public void setVisitantNum(int visitantNum) {
		this.visitantNum = visitantNum;
	}


	public int getReward() {
		return reward;
	}


	public void setReward(int reward) {
		this.reward = reward;
	}


	public String getMemberPoc() {
		return memberPic;
	}


	public void setMemberPoc(String memberPoc) {
		this.memberPic = memberPoc;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	@Override
	public String toString() {
		return "MemberPage [visitantNum=" + visitantNum + ", reward=" + reward + ", memberPic=" + memberPic
				+ ", nickName=" + nickName + ", grade=" + grade + "]";
	}
	
	
	
	
	
	
}
