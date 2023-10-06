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
	
	
	

}	// end class
