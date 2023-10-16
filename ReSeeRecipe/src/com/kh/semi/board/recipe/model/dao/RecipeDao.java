package com.kh.semi.board.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.recipe.model.vo.CookSteps;
import com.kh.semi.board.recipe.model.vo.Ingredient;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.recipe.model.vo.RecipePic;
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
	
	
	
	/* ************************** INSERT종류 ************************** */
	/**
	 * 레시피 제목, 작성자 이름, 레시피 카테고리 정보를 받아 레시피를 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * RECIPE_DATE(SYSDATE), REICPE_MODIFIED(SYSDATE), RECIPE_STATUS('Y'), RECIPE_COUNT(0)
	 * @param conn : Connection객체
	 * @param recipe : Recipe객체<br>
	 * recipeTitle, recipeWriterNo, recipeCategoryNo필드들이 초기화 된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipe(Connection conn, Recipe recipe) {
		int result = 0;
		String sql = prop.getProperty("insertRecipe");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, recipe.getRecipeTitle());
			pstmt.setInt(2, recipe.getRecipeWriterNo());
			pstmt.setInt(3, recipe.getRecipeCategoryNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 레시피 사진 원본명, 수정본명, 경로, 레벨(순서넘버링) 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * RECIPE_PIC_DATE(SYSDATE), RECIPE_PIC_STATUS('Y')
	 * @param conn : Connection객체
	 * @param recipePicList : RecipePic리터럴의 ArrayList<br>
	 * 내부 각 객체의 recipePicNameOrigin, recipePicNameUpload, recipePicPath, recipePicLev필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipePic(Connection conn, ArrayList<RecipePic> recipePicList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertRecipePic");
		
		for(RecipePic recipePic : recipePicList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, recipePic.getRecipePicNameOrigin());
				pstmt.setString(2, recipePic.getRecipePicNameUpload());
				pstmt.setString(3, recipePic.getRecipePicPath());
				pstmt.setInt(4, recipePic.getRecipePicLev());
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	
	/**
	 * 레시피 재료, 재료량 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조됨<br>
	 * @param conn : Connection객체
	 * @param ingredientList : Ingredient리터럴의 ArrayList<br>
	 * 내부 각 객체의 ingredient, ingredientAmount 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertIngredient(Connection conn, ArrayList<Ingredient> ingredientList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertIngredient");
		
		for(Ingredient ingredient : ingredientList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, ingredient.getIngredient());
				pstmt.setString(1, ingredient.getIngredientAmount());
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	 
	 
	/**
	 * 요리 과정 타이틀, 과정 내용, 레벨(순서 넘버링) 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조되며 나머지 정보들에는 아래와 같이 테이블의 Default값이 들어감<br>
	 * COOK_STEPS_LEV(1)
	 * @param conn : Connection객체
	 * @param cookStepsList : CookSteps리터럴의 ArrayList<br>
	 * 내부 각 객체의 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertCookSteps(Connection conn, ArrayList<CookSteps> cookStepsList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertCookSteps");
		
		for(CookSteps cookSteps : cookStepsList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, cookSteps.getCookStepsTitle());
				pstmt.setString(2, cookSteps.getCookStepsContent());
				pstmt.setInt(3, cookSteps.getCookStepsLev());
				result *= pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	/**
	 * 레시피 태그 번호 정보가 담긴 ArrayList를 받아<br>
	 * ArrayList에 값이 존재하는 동안 반복하며 레시피 사진을 INSERT하는 기능<br>
	 * PK종류는 모두 시퀀스로 생성/참조됨<br>
	 * @param conn : Connection객체
	 * @param tagNoList : Integer리터럴의 ArrayList<br>
	 * 내부 각 객체의 필드들이 초기화된 상태
	 * @return :
	 * INSERT구문 수행이 성공한 행의 개수
	 */
	public int insertRecipeTag(Connection conn, ArrayList<Integer> tagNoList) {
		// 1로 초기화 후 executeUpdate결과를 곱함 => 하나라도 실패 시 0반환
		int result = 1;
		String sql = prop.getProperty("insertRecipeTag");
		
		for(int tagNo : tagNoList) {
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
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