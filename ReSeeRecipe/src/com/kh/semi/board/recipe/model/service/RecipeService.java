package com.kh.semi.board.recipe.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.board_common.model.vo.IngredientMeasure;
import com.kh.semi.board.recipe.model.dao.RecipeDao;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeService {
	
	
	public HashMap<String, Object> recipeEnrollForm() {
		
		Connection conn = getConnection();
		HashMap<String, Object> map = null;
		
		// 카테고리, 계량단위 조회
		ArrayList<RecipeCategory> cList = new RecipeService().selectRecipeCategoryList(conn);
		ArrayList<IngredientMeasure> iList = new RecipeService().selectIngredientMeasureList(conn);
		
		// 자원반납
		close(conn);
		
		// map에 담기
		if(cList != null && iList != null) {
			map.put("cList", cList);
			map.put("iList", iList);
		}
		return map;
	}
	
	
	
	
	
	public int selectRecipeListCount() {
		
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectRecipeListCount(conn);
		close(conn);
		return listCount;
	}
	
	
	public ArrayList<Recipe> selectRecipeListLt(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListLt(conn, pi);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class.end