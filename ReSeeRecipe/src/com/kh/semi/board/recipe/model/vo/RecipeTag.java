package com.kh.semi.board.recipe.model.vo;

public class RecipeTag {
	
	/*
	TAG_NO	NUMBER
	TAG_RECIPE_NO	NUMBER
	*/
	
	private int tagNo;
	private int recipeNo;
	
	
	public RecipeTag() {
		super();
	}
	public RecipeTag(int tagNo, int recipeNo) {
		super();
		this.tagNo = tagNo;
		this.recipeNo = recipeNo;
	}
	
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	
	
	@Override
	public String toString() {
		return "RecipeTag [tagNo=" + tagNo + ", recipeNo=" + recipeNo + "]";
	}
	
	
}//class.end