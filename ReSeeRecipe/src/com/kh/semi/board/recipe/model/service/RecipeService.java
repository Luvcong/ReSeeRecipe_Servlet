package com.kh.semi.board.recipe.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.board_common.model.vo.IngredientMeasure;
import com.kh.semi.board.recipe.model.dao.RecipeDao;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.un_recipe.model.vo.UnRecipe;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeService {
	
	
	/**
	 * 글과 작성자의 STATUS가 유효한 레시피 개수 조회
	 * @return
	 */
	public int selectRecipeListCount() {
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectRecipeListCount(conn);
		close(conn);
		return listCount;
	}
	
	
	/**
	 * 레시피 메인 보기 기능, 페이지네이션 처리 된 레시피목록을 최신순(레시피 PK번호순)으로 조회한 후<br>
	 * 목록과 PageInfo객체를 RecipeMainView로 포워딩함
	 * @param pi : 페이지네이션 처리를 위한 정보가 담긴 PageInfo객체<br>
	 * PageInfo필드 : listCount(현재 게시글 총 개수), currentPage(요청온 페이지 번호),<br>
	 * pageLimit(한 페이지에 보일 페이징 바의 최대 개수), boardLimit(한 페이지에 보일 게시글 최대 개수)<br>
	 * @return
	 * > ArrayList<Recipe> rList : 페이지네이션 처리되어 조회된 레시피 글 정보를 Recipe객체로 만든 후 ArrayList에 담음<br>
	 * 	 Recipe필드 :  recipeNo, recipeTitle, recipeCount, titleImg, memNickName, htCount<br>
	 */
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 * 레시피 카테고리 목록을 조회해 반환
	 * @return : 레시피 카테고리 목록이 담긴 ArrayList배열
	 */
	public ArrayList<RecipeCategory> selectRecipeCategoryList() {
		Connection conn = getConnection();
		ArrayList<RecipeCategory> cList = new RecipeDao().selectRecipeCategoryList(conn);
		close(conn);
		return cList;
	}

	
	public HashMap<String, Object> recipeEnrollForm(int memNo) {
		Connection conn = getConnection();
		HashMap<String, Object> enMap = new HashMap();
		
		// 카테고리, 계량단위, 임시저장글(번호, 제목) 조회
		ArrayList<RecipeCategory> cList = new RecipeDao().selectRecipeCategoryList(conn);
		ArrayList<IngredientMeasure> iList = new RecipeDao().selectIngredientMeasureList(conn);
		ArrayList<UnRecipe> uList = new RecipeDao().selectUnRecipeForModal(conn, memNo);
		
		// 자원반납
		close(conn);
		
		// map에 담기
		if(!cList.isEmpty() && !iList.isEmpty()) {
			enMap.put("cList", cList);
			enMap.put("iList", iList);
			if(!uList.isEmpty()) {
				enMap.put("uList", uList);
			}
		}
		return enMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class.end