package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/yrmemberUpdate.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 크기 10MB
			int maxSize = 1024 * 1024 * 10;
			
			// 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("resources/profile_upfiles");
			
			// HttpServletRequest request 객체를 MultipartRequest 변환
			// MyFileRenamePolicy()는 
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 값 가져오기
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			String memberName = multiRequest.getParameter("memberName");
			String memberNickname = multiRequest.getParameter("memberNickname");
			String memberEmail = multiRequest.getParameter("memberEmail");
			
			// 가져온 값들 객체로 Service 넘길 것
			Member m = new Member();
			m.setMemNo(memberNo);
			m.setMemName(memberName);
			m.setMemNickname(memberNickname);
			m.setMemEmail(memberEmail);
			
			// 첨부파일이 있다면
			if(multiRequest.getOriginalFileName("profileInput") != null) {
				
				// 파일경로 + 파일수정명을 넘겨줄거임
				String memberPicture = savePath + multiRequest.getOriginalFileName("profileInput");
			}
			
			// Service로 수정할 회원 정보와 파일정보를 넘겨 요청
			int result = new MemberService().memberUpdate(m, memberPicture);
			
			
			
			
			
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
