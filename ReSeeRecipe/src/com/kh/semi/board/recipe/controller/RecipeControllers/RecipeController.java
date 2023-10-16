package com.kh.semi.board.recipe.controller.RecipeControllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.service.UnRecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.recipe.model.vo.UnRecipe;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.tag.model.service.TagService;
import com.kh.semi.tag.model.vo.Tag;

public class RecipeController {
	
	
	/**
	 * 카테고리 목록을 조회해 반환
	 * @return : 레시피 카테고리 목록이 담긴 어레이리스트 ArrayList<RecipeCategory>
	 */
	public String selectRecipeCategoryList(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "";
		ArrayList<RecipeCategory> cList = new RecipeService().selectRecipeCategoryList();
		
		if(!cList.isEmpty()) {
			request.setAttribute("cList", cList);
		} else {
			request.setAttribute("errorMsg", "에러가 발생했습니다");
			return "/views/common/errorPage.jsp";
		}
		viewPath = "/views/board/recipe_frag/recipeCategoryBar.jsp";
		return viewPath;
	}
	
	
	/**
	 * 레시피 메인 보기 기능, 페이지네이션 처리 된 레시피목록을 최신순(레시피 PK번호순)으로 조회한 후<br>
	 * 목록과 PageInfo객체를 RecipeMainView로 포워딩함
	 * @param request : 요청 온 페이지 번호(페이지 바의 현재 페이지)
	 * @return :
	 * > ArrayList<Recipe> rList : 페이지네이션 처리되어 조회된 레시피 글 정보를 Recipe객체로 만든 후 ArrayList에 담음<br>
	 * 	 Recipe필드 :  recipeNo, recipeTitle, recipeCount, titleImg, memNickName, htCount<br>
	 * > PageInfo pi : 페이지네이션 처리를 위한 정보가 담긴 PageInfo객체<br>
	 * 	 PageInfo필드 : listCount(현재 게시글 총 개수), currentPage(요청온 페이지 번호),<br>
	 * 	 pageLimit(한 페이지에 보일 페이징 바의 최대 개수), boardLimit(한 페이지에 보일 게시글 최대 개수)<br>
	 */
	public String selectRecipeList(HttpServletRequest request, HttpServletResponse response) {
		
		// 변수세팅
		String viewPath = "";
		RecipeService rs = new RecipeService();
		
		int listCount = rs.selectRecipeListCount(); // 레시피 개수 조회
		int currentPage = request.getParameter("currentPage") != null ?
						  Integer.parseInt(request.getParameter("currentPage"))
						  : 1;
		int pageLimit = 10; // 페이징 바 개수
		int boardLimit = 9; // 한 페이지에 보일 게시글 수
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 페이지네이션을 위한 정보를 넘기며 서비스호출
		ArrayList<Recipe> rList = rs.selectRecipeList(pi);
		
		// 넘길 값 지정
		request.setAttribute("rList", rList);
		request.setAttribute("pi", pi);
		
		// 응답화면지정 (페이징적용 / 최신순 레시피 조회)
		viewPath = "/views/board/recipe/recipeMainView.jsp";
		
		return viewPath;
	}
	
	
	/**
	 * 레시피 글작성 요청을 받은 후 Session에 로그인한 멤버가 존재한다면<br>
	 * 해당 유저의 임시저장 글 조회 후 정보와 함께<br>
	 * 레시피를 작성할 수 있는 폼 화면으로 포워딩해주는 기능<br>
	 */
	public String recipeEnrollForm(HttpServletRequest request, HttpServletResponse response, Member loginMember) {
		
		String viewPath = "";
		
		//@@@@@@@@@@@@편의를 위해 잠시 null
		System.out.println("레시피 컨트롤러 recipeEnrollForm 편의상 null해둠");
		if(null == loginMember) {
			ArrayList<UnRecipe> unReList = new UnRecipeService().selectUnRecipeList();
			viewPath = "/views/board/recipe/recipeEnrollFormView.jsp";
		}
		return viewPath;
	}
	
	
	/**
	 * ajax요청을 받아 해시태그의 정보(번호, 이름, 날짜)를 조회해 반환
	 * @param response : 해시태그 정보가 담긴 ArrayList를 Gson객체로 변환해 응답<br>
	 * > Tag의 필드 : tagNo, tagName, tagDate
	 * @throws IOException 
	 * @throws JsonIOException 
	 */
	public void ajaxSelectTag(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException {
		
		// 해시태그 정보 조회
		ArrayList<Tag> tagList = new TagService().selectALlTagname();
		
		// 형식 + 인코딩 설정 / Gson 응답
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(tagList, response.getWriter());
	}
	
	
	/**
	 * 레시피 글을 작성하는 기능
	 * @param request : memNo : 로그인 멤버의 정보
	 * @param response
	 * @return
	 */
	/*
	public String insertRecipe(HttpServletRequest request, HttpServletResponse response, Member loginMember) {

		String viewPath = "";
		
		if((request.getSession().getAttribute("loginMember")) != null) {
			
			int memNo = loginMember.getMemNo();
			int recipeWriterNo = memNo;
			request.getParameter("recipeCategoryNo");
			request.getParameter("recipeTitle");
			
			
			HashMap<String, Object> mapEnrollForm = new RecipeService().insertRecipe(memNo);
			
			if(!mapEnrollForm.isEmpty()) { /* enrollForm데이터가 있을 때
				// map내용이  있을 때 viewPath
				request.setAttribute("mapEnrollForm", mapEnrollForm);
				viewPath = "/views/board/recipe/recipeEnrollFormView.jsp";
			} else {
				// map내용이 없을 때 viewPath
				request.setAttribute("errorMsg", "게시글 입력요청 실패");
				viewPath = "/views/common/errorPage.jsp";
			}
		} else { // 로그인 유저 정보가 없을 때 @@@@@@@(테스트위해 코드 O 나중에 지우고 error페이지나 recipemain으로 포워딩)
			
		}
		return viewPath;
	}
	*/
	
	
	
	
}//class.end