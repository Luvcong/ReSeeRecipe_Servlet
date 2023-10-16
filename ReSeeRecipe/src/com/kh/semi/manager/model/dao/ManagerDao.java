package com.kh.semi.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class ManagerDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	// 기본생성자 호출 시 manager-mapper.xml
	public ManagerDao() {
		
		String file = ManagerDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member managerSetting(Connection conn, int adminNo) {
		
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("managerSetting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adminNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setMemNo(rset.getInt("MEM_NO"));
				m.setMemId(rset.getString("MEM_ID"));
				m.setMemName(rset.getString("MEM_NAME"));
				m.setMemNickname(rset.getString("MEM_NICKNAME"));
				m.setMemEmail(rset.getString("MEM_EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
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
