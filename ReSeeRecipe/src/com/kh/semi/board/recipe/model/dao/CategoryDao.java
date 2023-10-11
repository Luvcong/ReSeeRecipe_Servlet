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
		
		String file = CategoryDao.class.getResource("/sql/board/recipe-mapper.xml").getPath();
		
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
		String sql = prop.getProperty("selectCategoryListManager");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RecipeCategory recipeCategory = new RecipeCategory();
				
				recipeCategory.setRecipeCategoryNo(rset.getInt("RECIPE_CATEGORY_NO"));
				recipeCategory.setRecipeCategoryName(rset.getString("RECIPE_CATEGORY_NAME"));
				recipeCategory.setRecipeCategoryCount(rset.getInt("RECIPE_CATEGORY_CNT"));
				
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
	
	
	
	/**
	 * 카테고리 추가 요청을 처리해주는 method
	 * @param conn
	 * @param recipeCategoryName - 추가 카테고리명
	 * @return 카테고리 추가 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 6.
	 */
	public int insertCategory(Connection conn, String recipeCategoryName) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, recipeCategoryName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}	// insertCategory
	
	
	
	/**
	 * 카테고리 삭제 요청을 처리해주는 method
	 * @param conn
	 * @param categoryNo 카테고리 SEQ_NO
	 * @return 카테고리 삭제 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 9.
	 */
	public int deleteCategory(Connection conn, int categoryNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, categoryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	// deleteCategory
	
	
	/**
	 * 카테고리 삭제 요청시 해당 카테고리에 포함되어 있는 레시피 글 카테고리유형/글상태 업데이트
	 * @param conn
	 * @param categoryNo 카테고리 SEQ_NO 식별값
	 * @return 레시피글 업데이트 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 10.
	 */
	public int updateRecipeStatus(Connection conn, int categoryNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRecipeStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, categoryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	// updateRecipeStatus
	
	
	
	/**
	 * 카테고리명 변경을 처리해주는 method
	 * @param conn
	 * @param categoryName 기존 카테고리명
	 * @param categoryUpdateName 변경 카테고리명
	 * @return 카테고리명 변경 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 11.
	 */
	public int updateCategory(Connection conn, String categoryName, String categoryUpdateName) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, categoryUpdateName);
			pstmt.setString(2, categoryName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	// updateCategory
	
	
	/**
	 * 카테고리명 중복여부 체크 method
	 * @param conn
	 * @param categoryName 기존 카테고리명
	 * @return 기존 카테고리명 존재 여부 (1이면 존재 / 0이면 없음)
	 * @author JH
	 * @Date : 2023. 10. 11.
	 */
	public int categoryNameCheck(Connection conn, String categoryUpdateName) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("categoryNameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, categoryUpdateName);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
			System.out.println("dao : " + count);	// 존재하지 않는 경우로 test >> 1 나옴
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}	// categoryNameCheck
	
	
	
	
	
	
	
	
	
	
	
	
	

}	// end class
