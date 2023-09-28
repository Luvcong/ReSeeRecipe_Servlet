package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;

public class MemberService {
	
	public void loginMember(String memberId, String memberPwd) {
		
		// Connection 객체 생성
		Connection conn = getConnection();
		
		// DAO호출
		new MemberDao().loginMember(conn, memberId, memberPwd);
		
		
		
	}

}
