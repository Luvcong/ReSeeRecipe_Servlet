package com.kh.semi.board.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeDao {
	
	private Properties prop = new Properties();
	
	public RecipeDao() {
		String filePath = RecipeDao.class.getResource("/sql/board/recipe/recipe-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	public int selectRecipeListCount(Connection conn) {
		
		int listCount = 0;
		String sql = prop.getProperty("selectRecipeListCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()) {
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return listCount;
	}
	
	
	public ArrayList<Recipe> selectRecipeListLt(Connection conn, PageInfo pi) {
		
		ArrayList<Recipe> list = new ArrayList();
		String sql = prop.getProperty("selectRecipeListLt");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setInt(1, pi.getStartRow());
			pstmt.setInt(2, pi.getEndRow());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Recipe r = new Recipe();
					r.setRecipeNo(rset.getInt("RECIPE_NO"));
					r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
					r.setRecipeCount(rset.getInt("RECIPE_COUNT"));
					r.setTitleImg(rset.getString("TITLEIMG"));
					r.setMemNickName(rset.getString("MEM_NICKNAME"));
					list.add(r);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}//class.end