package com.kh.semi.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.heart.model.service.HeartService;
import com.kh.semi.heart.model.vo.NoticeHeart;
import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeManageController
 */
@WebServlet("/hlnoticemanage.no")
public class NoticeManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 인코딩
		// 2) 값뽑기
		// 3) VO가공
		// 4) 서비스 호출 -> SELECT 공지사항 리스트 조회
		ArrayList<Notice> list = new NoticeService().selectList();
		int NoticeNo = n.getNoticeNo();
		int cnh = new HeartService().countnoticeHeart();
		//request.setAttribute("list", list);
		// 5) 응답할 뷰 지정 -- Ajax 처리 해야함 
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(list);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
