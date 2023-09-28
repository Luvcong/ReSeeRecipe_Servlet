package com.kh.semi.member.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;

public class MemberService {
	
	public void loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate().getConnection();
	}

}
