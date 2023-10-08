package com.kh.semi.board.recipe.model.vo;

public class Ingredient {
	
	/*
	INGREDIENT_NO	NUMBER
	INGREDIENT	VARCHAR2(40 BYTE)
	RECIPE_NO	NUMBER
	INGREDIENT_MEASURE_NO	NUMBER
	*/
	
	private int ingredientNo;
	private String ingredient;
	private int recipeNo;
	private int ingredientMeasureNo;
	
	
	public Ingredient() {
		super();
	}
	public Ingredient(int ingredientNo, String ingredient, int recipeNo, int ingredientMeasureNo) {
		super();
		this.ingredientNo = ingredientNo;
		this.ingredient = ingredient;
		this.recipeNo = recipeNo;
		this.ingredientMeasureNo = ingredientMeasureNo;
	}
	
	
	public int getIngredientNo() {
		return ingredientNo;
	}
	public void setIngredientNo(int ingredientNo) {
		this.ingredientNo = ingredientNo;
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
		return "Ingredient [ingredientNo=" + ingredientNo + ", ingredient=" + ingredient + ", recipeNo=" + recipeNo
				+ ", ingredientMeasureNo=" + ingredientMeasureNo + "]";
	}
	
	
}//class.end