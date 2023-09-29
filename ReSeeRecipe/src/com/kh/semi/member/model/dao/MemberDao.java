package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.member.model.vo.Member;

public class MemberDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	// 기본생성자 호출 시 member-mapper.xml파일 읽어오기
	public MemberDao() {
		
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인시 로그인 한 유저 DB정보 가져오기
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEM_NO"),
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
							   rset.getString("MEM_NAME"),
							   rset.getString("MEM_NICKNAME"),
							   rset.getString("MEM_EMAIL"),
							   rset.getString("MEM_STATUS"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getDate("DELETE_DATE"),
							   rset.getString("MEM_PICTURE"),
							   rset.getInt("MEM_GRADE"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	
	

}
