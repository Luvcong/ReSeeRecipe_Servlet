package com.kh.semi.board.board_common.model.vo;

/**
 * @author MJY
 * 계량단위테이블 TB_INGREDIENT_MEASURE
 */
public class IngredientMeasure {
	
	/*
	INGREDIENT_MEASURE_NO	NUMBER
	INGREDIENT_MEASURE	VARCHAR2(30 BYTE)
	*/
	private int ingredientMeasureNo;
	private String ingredientMeasure;
	
	
	public IngredientMeasure() {
		super();
	}
	public IngredientMeasure(int ingredientMeasureNo, String ingredientMeasure) {
		super();
		this.ingredientMeasureNo = ingredientMeasureNo;
		this.ingredientMeasure = ingredientMeasure;
	}
	
	
	public int getIngredientMeasureNo() {
		return ingredientMeasureNo;
	}
	public void setIngredientMeasureNo(int ingredientMeasureNo) {
		this.ingredientMeasureNo = ingredientMeasureNo;
	}
	public String getIngredientMeasure() {
		return ingredientMeasure;
	}
	public void setIngredientMeasure(String ingredientMeasure) {
		this.ingredientMeasure = ingredientMeasure;
	}
	
	
	@Override
	public String toString() {
		return "IngredientMeasure [ingredientMeasureNo=" + ingredientMeasureNo + ", ingredientMeasure="
				+ ingredientMeasure + "]";
	}
	
	
}//class.end