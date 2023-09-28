package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		close(conn);
		
		return m;
	}

}
