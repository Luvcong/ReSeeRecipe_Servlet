package com.kh.semi.board.unsaved_recipe.model.vo;

public class UnIngredient {

	
	/*
	UN_INGREDIENT_NO	NUMBER
	UN_INGREDIENT	VARCHAR2(40 BYTE)
	UN_RECIPE_NO	NUMBER
	INGREDIENT_MEASURE_NO	NUMBER
	*/
	
	private int unIngredientNo;
	private String ingredient;
	private int recipeNo;
	private int ingredientMeasureNo;
	
	
	public UnIngredient() {
		super();
	}
	public UnIngredient(int unIngredientNo, String ingredient, int recipeNo, int ingredientMeasureNo) {
		super();
		this.unIngredientNo = unIngredientNo;
		this.ingredient = ingredient;
		this.recipeNo = recipeNo;
		this.ingredientMeasureNo = ingredientMeasureNo;
	}
	
	
	public int getUnIngredientNo() {
		return unIngredientNo;
	}
	public void setUnIngredientNo(int unIngredientNo) {
		this.unIngredientNo = unIngredientNo;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getIngredientMeasureNo() {
		return ingredientMeasureNo;
	}
	public void setIngredientMeasureNo(int ingredientMeasureNo) {
		this.ingredientMeasureNo = ingredientMeasureNo;
	}
	
	
	@Override
	public String toString() {
		return "UnIngredient [unIngredientNo=" + unIngredientNo + ", ingredient=" + ingredient + ", recipeNo="
				+ recipeNo + ", ingredientMeasureNo=" + ingredientMeasureNo + "]";
	}
	
	
}//class.end
