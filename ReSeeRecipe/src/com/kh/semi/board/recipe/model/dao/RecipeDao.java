package com.kh.semi.board.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.board_common.model.vo.IngredientMeasure;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.un_recipe.model.vo.UnRecipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeDao {
	
	private Properties prop = new Properties();
	
	public RecipeDao() {
		String filePath = RecipeDao.class.getResource("/sql/board/recipe-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/****************************************************************************/
	
	
	/**
	 * 글과 작성자의 STATUS가 유효한 레시피 개수 조회
	 * @param conn
	 * @return
	 */
	public int selectRecipeListCount(Connection conn) {
		
		int listCount = 0;
		String sql = prop.getProperty("selectRecipeListCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()) {
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCount;
	}
	
	
	/**
	 * 페이지네이션 처리된 레시피 목록 조회 (최신순)
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi) {
		
		ArrayList<Recipe> list = new ArrayList();
		String sql = prop.getProperty("selectRecipeList");
		
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
					r.setHtCount(rset.getInt("HT_COUNT"));
					list.add(r);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<RecipeCategory> selectRecipeCategoryList(Connection conn) {
		
		ArrayList<RecipeCategory> cList = new ArrayList();
		String sql = prop.getProperty("selectRecipeCategoryList");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()) {
			while(rset.next()) {
				RecipeCategory rc = new RecipeCategory();
				rc.setRecipeCategoryNo(rset.getInt("RECIPE_CATEGORY_NO"));
				rc.setRecipeCategoryName(rset.getString("RECIPE_CATEGORY_NAME"));
				cList.add(rc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	
	public ArrayList<IngredientMeasure> selectIngredientMeasureList(Connection conn) {
		
		ArrayList<IngredientMeasure> iList = new ArrayList();
		String sql = prop.getProperty("selectIngredientMeasureList");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()) {
			while(rset.next()) {
				IngredientMeasure im = new IngredientMeasure();
				im.setIngredientMeasureNo(rset.getInt("INGREDIENT_MEASURE_NO"));
				im.setIngredientMeasure(rset.getString("INGREDIENT_MEASURE"));
				iList.add(im);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return iList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<UnRecipe> selectUnRecipeForModal(Connection conn, int memNo) {
		
		ArrayList<UnRecipe> uList = new ArrayList();
		String sql = prop.getProperty("selectUnRecipeForModal");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, memNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					UnRecipe ur = new UnRecipe();
					ur.setUnRecipeNo(rset.getInt("UN_RECIPE_NO"));
					ur.setUnRecipeTitle(rset.getString("UN_RECIPE_TITLE"));
					uList.add(ur);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uList;
	}
	
	
	
	
	
	
	
	
	
	
}//class.end