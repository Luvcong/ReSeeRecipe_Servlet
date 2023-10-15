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
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.tag.model.vo.Tag;

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
	 * 레시피 카테고리 목록을 조회해 반환
	 * @param conn : Connection객체
	 * @return : 레시피 카테고리 목록이 담긴 ArrayList배열
	 */
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
	
	
	/**
	 * 레시피 개수 조회
	 * @param conn : Connection객체
	 * @return : 글과 작성자의 STATUS가 유효한 레시피글의 총 개수
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
	 * 레시피 메인 보기 기능, 페이지네이션 처리 된 레시피목록을 최신순(레시피 PK번호순)으로 조회한 후<br>
	 * 목록과 PageInfo객체를 RecipeMainView로 포워딩함
	 * @param conn : Connection객체
	 * @param pi : 페이지네이션 처리를 위한 정보가 담긴 PageInfo객체<br>
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

	

	
	
	
	/*
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
	*/
	
	
	
	
	
	
	
	
	
}//class.end