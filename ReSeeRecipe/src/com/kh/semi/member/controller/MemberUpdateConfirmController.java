package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdateConfirmController
 */
@WebServlet("/yrmemberUpdateConfirm.me")
public class MemberUpdateConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 회원이 입력한 비밀번호
		String checkPwd = request.getParameter("checkPwd");
		// 로그인되어있는 회원정보
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberPwd = request.getParameter("memberPwd");
		
		// String memberPwd = new MemberService().memberUpdateConfirm(memberNo);
		
		// 비밀번호가 일치한다면
		if(checkPwd.equals(memberPwd)) {
			request.getRequestDispatcher("views/member/memberUpdateForm.jsp").forward(request, response);
			// ★★★★★★★★★여기서 response로 보내도 로그인 유지가 되나?
			// response.sendRedirect("views/member/memberUpdateForm");
		// 비밀번호 불일치
		} else { 
			// 바로 jsp때리는거랑 컨트롤러 통해가는거랑 차이? => 컨트롤러를 통해서는 못가네?
			// request.getRequestDispatcher(request.getContextPath() + "/yrmemberUpdateConfirmForm.me").forward(request, response);
			// DB에서 조회된 회원 비밀번호
			request.setAttribute("memberPwd", memberPwd);
			// 사용자가 입력한 비밀번호
			request.setAttribute("checkPwd", checkPwd);
			request.getRequestDispatcher("views/member/memberUpdateConfirm.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
