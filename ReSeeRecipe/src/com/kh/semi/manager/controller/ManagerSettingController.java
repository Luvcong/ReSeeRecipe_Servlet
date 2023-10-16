  package com.kh.semi.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.manager.model.service.ManagerService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class ManagerSettingController
 */
@WebServlet("/hlsettingmanager.ma")
public class ManagerSettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSettingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 관리자 정보 설정 서블릿
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 인코딩 생략
		
		// 2) 값뽑기 - 관리자 식별 번호 input 태그 hidden의 value
		String adminNo = request.getParameter("HL_managerNo");
		
		Member m = new ManagerService().managerSetting(adminNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
