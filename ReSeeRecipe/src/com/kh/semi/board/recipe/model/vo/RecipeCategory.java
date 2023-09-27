package com.kh.semi.board.recipe.model.vo;

public class RecipeCategory {
	/*
	RECIPE_CATEGORY_NO	NUMBER
	RECIPE_CATEGORY_NAME	VARCHAR2(20 BYTE)
	*/
	
	private int recipeCategoryNo;
	private String recipeCategoryName;
	
	
	public RecipeCategory() {
		super();
	}
	public RecipeCategory(int recipeCategoryNo, String recipeCategoryName) {
		super();
		this.recipeCategoryNo = recipeCategoryNo;
		this.recipeCategoryName = recipeCategoryName;
	}
	
	
	public int getRecipeCategoryNo() {
		return recipeCategoryNo;
	}
	public void setRecipeCategoryNo(int recipeCategoryNo) {
		this.recipeCategoryNo = recipeCategoryNo;
	}
	public String getRecipeCategoryName() {
		return recipeCategoryName;
	}
	public void setRecipeCategoryName(String recipeCategoryName) {
		this.recipeCategoryName = recipeCategoryName;
	}
	
	
	@Override
	public String toString() {
		return "RecipeCategory [recipeCategoryNo=" + recipeCategoryNo + ", recipeCategoryName=" + recipeCategoryName
				+ "]";
	}
	
	
}//class.end