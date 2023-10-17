package com.kh.semi.board.recipe.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.recipe.model.dao.RecipeDao;
import com.kh.semi.board.recipe.model.vo.CookSteps;
import com.kh.semi.board.recipe.model.vo.Ingredient;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.recipe.model.vo.RecipePic;
import com.kh.semi.common.model.vo.PageInfo;

public class RecipeService {
	
	
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
	
	
	/**
	 * 레시피 개수 조회
	 * @return : 글과 작성자의 STATUS가 유효한 레시피글의 총 개수
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
	public ArrayList<Recipe> selectRecipeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> recipeList = new RecipeDao().selectRecipeList(conn, pi);
		close(conn);
		return recipeList;
	}
	
	
	
	public int insertRecipe(HashMap<String, Object> insertRecipeMap) {
		int returningResult = 0;
		int recipeResult = 0;
		int tagResult = 0;
		int picResult = 0;
		int cookStepsResult = 0;
		int ingredientResult = 0;
		RecipeDao rd = new RecipeDao();
		Connection conn = getConnection();
		// TB_RECIPE insert
		Recipe recipe = (Recipe)insertRecipeMap.get("recipe");
		recipeResult = rd.insertRecipe(conn, recipe);
		
		if(recipeResult > 0) {
			// TB_RECIPE_PIC insert
			ArrayList<RecipePic> recipePicList = (ArrayList<RecipePic>)insertRecipeMap.get("recipePicList");
			picResult = rd.insertRecipePic(conn, recipePicList);
			
			// TB_INGREDIENT insert
			ArrayList<Ingredient> ingredientList = (ArrayList<Ingredient>)insertRecipeMap.get("ingredientList");
			ingredientResult = rd.insertIngredient(conn, ingredientList);
			
			// TB_COOK_STEPS insert
			ArrayList<CookSteps> cookStepsList = (ArrayList<CookSteps>)insertRecipeMap.get("cookStepsList");
			cookStepsResult = rd.insertCookSteps(conn, cookStepsList);
			
			// TB_RECIPE_TAG insert
			ArrayList<Integer> tagNoList = (ArrayList<Integer>)insertRecipeMap.get("tagNoList");
			tagResult = rd.insertRecipeTag(conn, tagNoList);
			
			// 커넥션 닫기 전 transaction처리
			if( !(recipeResult == 0
			   || picResult * ingredientResult * cookStepsResult * tagResult == 0)) {
				returningResult = 1;
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		return returningResult;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class.end