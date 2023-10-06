package com.kh.semi.board.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import static com.kh.semi.common.JDBCTemplate.*;

public class CategoryDao {
	
	// sql properties
	private Properties prop = new Properties();
	
	public CategoryDao() {
		
		String file = CategoryDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		// 파일 읽기
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	// CategoryDao
	
	/**
	 * 등록되어 있는 카테고리 리스트 조회를 처리해주는 method
	 * @param conn
	 * @return 등록되어 있는 카테고리 리스트
	 * @author JH
	 * @Date : 2023. 10. 6.
	 */
	public ArrayList<RecipeCategory> selectCategoryList(Connection conn){
		
		ArrayList<RecipeCategory> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipeCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RecipeCategory recipeCategory = new RecipeCategory();
				
				recipeCategory.setRecipeCategoryNo(rset.getInt("RECIPE_CATEGORY_NO"));
				recipeCategory.setRecipeCategoryName(rset.getString("RECIPE_CATEGORY_NAME"));
				
				list.add(recipeCategory);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}	// selectCategoryList
	
	
	
	
	
	
	
	

}	// end class
