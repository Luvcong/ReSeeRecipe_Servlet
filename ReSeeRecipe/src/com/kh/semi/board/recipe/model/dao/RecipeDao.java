package com.kh.semi.board.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	
	
	
}//class.end