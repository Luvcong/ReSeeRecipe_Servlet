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
	 * @Date : 2023. 10. 11.
	 */
	public int deleteCategory(int categoryNo, int categoryCount) {
		
		Connection conn = getConnection();
		
		if(categoryCount > 0) {
			// 사용자가 삭제 요청한 카테고리의 레시피글 상태(STATUS = N && RECIPE_CATEGORY_NO = 0) 변경
			int resultUpdate = categoryDao.updateRecipeStatus(conn, categoryNo);
		}
		
		// 사용자가 요청한 카테고리 삭제
		int resultDelete = categoryDao.deleteCategory(conn, categoryNo);
		
		// 게시글 수가 있던 없던간에 삭제된 결과에 따라 트랜잭션 처리를 진행
		// > resultDelete 기준으로 커밋	
		if(resultDelete > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return resultDelete;
	}	// deleteCategory
	
	
	
	/**
	 * 카테고리명 변경 요청 및 중복체크를 요청하는 method 
	 * @param categoryName 기존 카테고리명
	 * @param categoryUpdateName 변경 카테고리명
	 * @return 카테고리명 변경 성공 여부 및 중복체크
	 * @author JH
	 * @Date : 2023. 10. 11.
	 */
	public int updateCategory(String categoryName, String categoryUpdateName) {
		
		Connection conn = getConnection();
		
		// 중복확인 method >> 0이 돌아오면 updateCategory 실행해야함 1이 돌아오면 롤백
		
		int resultUpdate = 0;
		int resultCheck = categoryDao.categoryNameCheck(conn, categoryUpdateName);
		System.out.println("resultCheck : " + resultCheck );	// 존재하는 경우 1	, 존재하지 않는데도 현재 1 출력
		
		if(resultCheck == 0) {
			resultUpdate = categoryDao.updateCategory(conn, categoryName, categoryUpdateName);
		}
		
		if(resultUpdate > 0) commit(conn);
			else rollback(conn);
		
		System.out.println("resultUpdate : " + resultUpdate );		// check : 1 / update : 0
		
		close(conn);
		
		return resultUpdate;
	}	// updateCategory
	
	
	
	
	
	
	
	
	
	
	

}	// end class
