package com.kh.semi.board.recipe.model.vo;

import java.util.List;

public class IngredientList {
	
	private List<Ingredient> ingList;

	
	public IngredientList() {
		super();
	}

	public IngredientList(List<Ingredient> ingList) {
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