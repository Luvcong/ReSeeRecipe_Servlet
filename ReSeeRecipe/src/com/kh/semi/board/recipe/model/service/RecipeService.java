package com.kh.semi.board.recipe.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.recipe.model.dao.RecipeDao;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeService {
	
	
	public int selectRecipeListCount() {
		
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectRecipeListCount(conn);
		close(conn);
		return listCount;
	}
	
	
	public ArrayList<Recipe> selectRecipeListLt(PageInfo pi){
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class.end