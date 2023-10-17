package com.kh.semi.myPage.model.vo;

public class MemberRecipeBook {
	
	private String mainPic;
	private String title;
	private String chefID;
	
	
	public MemberRecipeBook() {
		super();
	}


	public MemberRecipeBook(String mainPic, String title, String chefID) {
		super();
		this.mainPic = mainPic;
		this.title = title;
		this.chefID = chefID;
	}


	public String getMainPic() {
		return mainPic;
	}


	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getChefID() {
		return chefID;
	}


	public void setChefID(String chefID) {
		this.chefID = chefID;
	}


	@Override
	public String toString() {
		return "RecipeBook [mainPic=" + mainPic + ", title=" + title + ", chefID=" + chefID + "]";
	}
	

	
	
}
