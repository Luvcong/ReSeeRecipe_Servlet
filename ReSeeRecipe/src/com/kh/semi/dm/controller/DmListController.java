package com.kh.semi.dm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.dm.model.service.DmService;
import com.kh.semi.dm.model.vo.Dm;

/**
 * Servlet implementation class DmListController
 */
@WebServlet("/jhselect.dm")
public class DmListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DmService dmService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DmListController() {
        super();
        dmService = new DmService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) get방식 - 인코딩x
		// 2) 전달값 뽑기 - select문으로 x
		// 3) 데이터가공 xx
		// 4) Service요청
		ArrayList<Dm> list = dmService.selectDmList();
		request.setAttribute("list", list);
		request.setAttribute("waitingCount", dmService.getWaitingCount(list));
		
		// 5) 응답화면 지정
		request.getRequestDispatcher("views/dm/dmListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
