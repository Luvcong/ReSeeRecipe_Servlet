package com.kh.semi.board.recipe.model.vo;

public class Reply {
	
	/*
	REPLY_NO	NUMBER
	REPLY_CONTENT	VARCHAR2(900 BYTE)
	REPLY_DATE	DATE
	REPLY_MODIFIED	DATE
	REPLY_WRITER_NO	NUMBER
	RECIPE_NO	NUMBER
	*/
	
	private int replyNo;
	private String replyContent;
	private String replyDate;
	private String replyModified;
	private int replyWriterNo;
	private int recipeNo;
	
	
	public Reply() {
		super();
	}
	public Reply(int replyNo, String replyContent, String replyDate, String replyModified, int replyWriterNo,
			int recipeNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyModified = replyModified;
		this.replyWriterNo = replyWriterNo;
		this.recipeNo = recipeNo;
	}
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyModified() {
		return replyModified;
	}
	public void setReplyModified(String replyModified) {
		this.replyModified = replyModified;
	}
	public int getReplyWriterNo() {
		return replyWriterNo;
	}
	public void setReplyWriterNo(int replyWriterNo) {
		this.replyWriterNo = replyWriterNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", replyModified=" + replyModified + ", replyWriterNo=" + replyWriterNo + ", recipeNo=" + recipeNo
				+ "]";
	}
	
	
}//class.end