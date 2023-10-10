package com.kh.semi.board.recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.recipe.model.dao.CategoryDao;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import static com.kh.semi.common.JDBCTemplate.*;

public class CategoryService {
	
	private CategoryDao categoryDao;
	
	public CategoryService() {
		super();
		categoryDao = new CategoryDao();
	}
	
	/**
	 * 등록되어 있는 카테고리 리스트 조회를 요청하는 method
	 * @return 등록되어 있는 카테고리 리스트
	 * @author JH
	 * @Date : 2023. 10. 6.
	 */
	public ArrayList<RecipeCategory> selectCategoryList(){
		
		Connection conn = getConnection();
		
		ArrayList<RecipeCategory> list = categoryDao.selectCategoryList(conn);
		
		close(conn);
		
		return list;
		
	}	// selectCategoryList
	
	
	
	/**
	 * 카테고리 추가를 요청하는 method
	 * @param recipeCategoryName - 추가 카테고리명
	 * @return 카테고리 추가 성공여부
	 * @author JH
	 * @Date : 2023. 10. 6.
	 */
	public int insertCategory(String recipeCategoryName) {
		
		Connection conn = getConnection();
		
		int result = categoryDao.insertCategory(conn, recipeCategoryName);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}	// insertCategory
	
	
	
	/**
	 * 카테고리 삭제 및 해당 레시피글 업데이트를 요청하는 method
	 * @param categoryNo 카테고리 SEQ_NO 식별값
	 * @return 카테고리 삭제 및 레시피글 업데이트성공여부
	 * @author JH
	 * @Date : 2023. 10. 9.
	 */
	public int deleteCategory(int categoryNo) {
		
		Connection conn = getConnection();
		
		// 사용자가 삭제 요청한 카테고리의 레시피글 상태(STATUS = N && RECIPE_CATEGORY_NO = 0) 변경
		int resultRecipe = categoryDao.updateRecipeStatus(conn, categoryNo);
		
		// 사용자가 요청한 카테고리 삭제
		int resultCategory = categoryDao.deleteCategory(conn, categoryNo);
		
		if(resultRecipe * resultCategory > 0) commit(conn);
		else rollback(conn);
		
//		if((resultCategory > 0) || (resultRecipe > 0) ) commit(conn);
//		else rollback(conn);
		
		close(conn);
		
		return (resultRecipe * resultCategory);
	}	// deleteCategory
	
	
	
	
	

}	// end class
