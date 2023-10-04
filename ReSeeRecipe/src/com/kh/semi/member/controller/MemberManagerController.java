package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberManagerController
 */
@WebServlet("/hlmembermanage.ma")
public class MemberManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 인코딩 a태그 -> GET방식
		
		// 2) request 값 뽑을게 없음
		
		request.setCharacterEncoding("UTF-8");
		// 3) Service 호출 전체 회원 정보 SELECT
		ArrayList<Member> list = new MemberService().selectMemberAll();
		
		
		// 5) 형식, 인코딩 지정
		response.setContentType("application/json; charset=UTF-8");
		
		// JSON ArrayList 생성
		/*
		JSONArray jArr = new JSONArray();
		
		JSONObject jObj1 = new JSONObject();
		
		for(Member m : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("memNo", m.getMemNo());
			jObj.put("memName", m.getMemName());
			jObj.put("memId", m.getMemId());
			jObj.put("memNickname", m.getMemNickname());
			jObj.put("memEmail", m.getMemEmail());
			jObj.put("enrollDate", m.getEnrollDate());
			jObj.put("memReward", m.getMemReward());
			
			jArr.add(jObj);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
		*/
		// Gson객체 생성
		//Gson gson = new Gson();
		new Gson().toJson(list, response.getWriter());
		//request.getRequestDispatcher("views/member/memberManager.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath() + );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
