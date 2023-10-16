package com.kh.semi.board.recipe.model.vo;

import java.util.List;

public class RecipeAllList {
	
	private List<CookSteps> csList;
	private List<Ingredient> ingList;
	
	public RecipeAllList() {
		super();
	}

	public RecipeAllList(List<Ingredient> ingList) {
		super();
		this.ingList = ingList;
	}

	
	public List<Ingredient> getIngList() {
		return ingList;
	}

	public void setIngList(List<Ingredient> ingList) {
		this.ingList = ingList;
	}

	
	@Override
	public String toString() {
		return "IngredientList [ingList=" + ingList + "]";
	}

	
}//class.end