package com.kh.semi.category.model.vo;

public class RecipeCategory {

//	RECIPE_CATEGORY_NO		NUMBER
//	RECIPE_CATEGORY_NAME	VARCHAR2(20 BYTE)
	
	private int categoryNo;
	private String cateogryName;
	
	public RecipeCategory() {
		super();
	}

	public RecipeCategory(int categoryNo, String cateogryName) {
		super();
		this.categoryNo = categoryNo;
		this.cateogryName = cateogryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCateogryName() {
		return cateogryName;
	}

	public void setCateogryName(String cateogryName) {
		this.cateogryName = cateogryName;
	}

	@Override
	public String toString() {
		return "RecipeCategory [categoryNo=" + categoryNo + ", cateogryName=" + cateogryName + "]";
	}
	
}	// end class
