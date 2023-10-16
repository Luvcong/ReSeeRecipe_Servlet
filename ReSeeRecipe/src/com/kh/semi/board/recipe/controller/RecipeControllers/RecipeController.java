package com.kh.semi.board.recipe.controller.RecipeControllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.semi.board.recipe.model.service.RecipeService;
import com.kh.semi.board.recipe.model.service.UnRecipeService;
import com.kh.semi.board.recipe.model.vo.Recipe;
import com.kh.semi.board.recipe.model.vo.RecipeCategory;
import com.kh.semi.board.recipe.model.vo.UnRecipe;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.common.SendError;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.tag.model.service.TagService;
import com.kh.semi.tag.model.vo.Tag;
import com.oreilly.servlet.MultipartRequest;

public class RecipeController {
	
	

	/**
	 * 레시피 서블릿(RecipeServlet)에 예상하지 못한 매핑값으로 요청이 들어왔을 때 디폴트 에러메세지와 함께 에러페이지로 포워딩
	 * @return 디폴트 에러메세지
	 */
	public String errorDefault(HttpServletRequest request, HttpServletResponse response) {
		return new SendError().sendError(request, "??? 알 수 없는 요청입니다 ???");
	}
	
	
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
			return new SendError().sendError(request, "카테고리 조회에 실패했습니다");
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
		
		if(!rList.isEmpty()) {
			// 넘길 값 지정
			request.setAttribute("rList", rList);
			request.setAttribute("pi", pi);
			// 응답화면지정 (페이징적용 / 최신순 레시피 조회)
			viewPath = "/views/board/recipe/recipeMainView.jsp";
		} else {
			return new SendError().sendError(request, "조회된 게시글이 없습니다");
		}
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
		System.out.println("레시피 컨트롤러 recipeEnrollForm 편의상 null 번호 3해둠");
		if(null == loginMember) {
			// 임시저장글 받아오기
			ArrayList<UnRecipe> unReList = new UnRecipeService().selectUnRecipeList(3/*loginMember.getMemNo()*/);
			
			request.setAttribute("unReList", unReList);
			
			System.out.println(unReList);
			viewPath = "/views/board/recipe/recipeEnrollFormView.jsp";
		} else {
			return new SendError().sendError(request, "임시저장글 조회에 실패했습니다");
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
	public String insertRecipe(HttpServletRequest request, HttpServletResponse response, Member loginMember) {
		
		// 인코딩은 Servlet에서 완료
		
		// multipartContent가 있는지 체크 => 체크 후 서버올리기
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1) Multipart객체 생성 시 => 서버에 파일 올라감
			// 1_1. 전송용량 제한 (10Mbytes)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2. 파일 저장할 경로 getServletContext.getRealPath() => 경로 매핑해줌
			String fileSavePath = request.getServletContext().getRealPath("/resources/recipe_upfiles/recipe_pics/");
			
			// 1_3. MultipartRequest객체 생성 하면서 파일 이름 새로 생성
			MultipartRequest multiRequest =
			new MultipartRequest(request, fileSavePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2) multiRequest로부터 값 뽑기 => getParameter()이용
			int memNo = loginMember.getMemNo();
			
			int recipeCategoryNo = Integer.parseInt(multiRequest.getParameter("recipeCategoryNo"));
			int tagNo = Integer.parseInt(multiRequest.getParameter(""));
			
			
			// 3) VO가공
		}
		
		
		
		/*
		String viewPath = "";
		if(loginMember != null) {
			
			int memNo = loginMember.getMemNo();
			request.getParameter("recipeCategoryNo");
			request.getParameter("tagNo");
			request.getParameter("recipeTitle");
			// 썸네일 이미지 받아야함
			
			//
			HashMap<String, Object> mapEnrollForm = new RecipeService().insertRecipe(memNo);
			/*
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
		*/
		return viewPath;
	}
	
	
	
	
	
}//class.end