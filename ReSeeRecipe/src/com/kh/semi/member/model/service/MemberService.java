package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		close(conn);
		
		return m;
	}
	
	public int selectMemlistCount() {
		
		Connection conn = getConnection();
		
		int memlistCount = new MemberDao().selectMemlistCount(conn);
		
		close(conn);
		
		return memlistCount;
	}
	
	
	
	
	public ArrayList<Member> selectMemberAll(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberAll(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Member selectMemInfo(int memNo){
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMemInfo(conn, memNo);
		
		close(conn);
		
		return m;
	}
	
	public Member updateMemInfo(Member m) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().updateMemInfo(conn, m);
	}
}
