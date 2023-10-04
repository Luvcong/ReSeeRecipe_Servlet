package com.kh.semi.dm.model.dao;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.dm.model.vo.Dm;

public class DmDao {

	// SQL문 파일 Properties 객체를 이용해서 출력
	private Properties prop = new Properties();
	
	public DmDao() {
		
		String file = DmDao.class.getResource("/sql/dm/dm-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	// DmDao
	

	/**
	 * 쪽지함 리스트 조회를 처리해주는 method
	 * @param conn
	 * @return 쪽지리스트 전체 내용
	 * @author JH
	 * @Date : 2023. 09. 30.
	 */
	public ArrayList<Dm> selectDmList(Connection conn){
		
		ArrayList<Dm> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDmList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Dm dm = new Dm();
				
				dm.setDmNo(rset.getInt("DM_NO"));
				dm.setMemId(rset.getString("MEM_ID"));
				dm.setMemNickname(rset.getString("MEM_NICKNAME"));
				dm.setDmContent(rset.getString("DM_CONTENT"));
				dm.setSendDate(rset.getDate("SEND_DATE"));
				dm.setDmStatus(rset.getString("DM_STATUS"));
				dm.setDmReply(rset.getString("DM_REPLY"));
				
				list.add(dm);
				
				// System.out.println(list);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}	// selectDmList
	
	
	/**
	 * 쪽지답변 업데이트를 처리해주는 method
	 * @param conn
	 * @param dm 답변내용 / 쪽지seqNo(식별값)
	 * @return TB_DM - DM_REPLY 컬럼 INSERT 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 3.
	 */
	public int updateReply(Connection conn, Dm dm) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dm.getDmReply());
			pstmt.setInt(2, dm.getDmNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
		
	}	// updateReply
	
	
	
	/**
	 * 쪽지 삭제 요청을 처리해주는 method
	 * @param conn
	 * @param dmNo 쪽지를 삭제하기 위한 식별값
	 * @return 삭제 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 3.
	 */
	public int deleteDm(Connection conn, int dmNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteDm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dmNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	// deleteDm
	
	
	
	
	
//	public Dm selectDm(Connection conn, int dmNo) {
//		
//		Dm dm = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String sql = prop.getProperty("selectDm");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,  dmNo);
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				dm = new Dm();
//				dm.setDmNo(rset.getInt("DM_NO"));
//				dm.setMemId(rset.getString("MEM_ID"));
//				dm.setMemNickname(rset.getString("MEM_NICKNAME"));
//				dm.setDmContent(rset.getString("DM_CONTENT"));
//				dm.setSendDate(rset.getDate("SEND_DATE"));
//				dm.setDmStatus(rset.getString("DM_STATUS"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		return dm;
//		
//	}	// selectDm
	
	
	
	
	
	
	
}	// end class
