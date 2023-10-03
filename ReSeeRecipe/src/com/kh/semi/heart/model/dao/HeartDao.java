package com.kh.semi.heart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.heart.model.vo.NoticeHeart;
import com.kh.semi.notice.model.vo.Notice;

public class HeartDao {
	
	
	private Properties prop = new Properties();
	
	public HeartDao() {
		
		String fileName = HeartDao.class.getResource("/sql/heart/noticeheart-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<NoticeHeart> countnoticeHeart(Connection conn, NoticeHeart heartNoticeNo){
		
		ArrayList<NoticeHeart> noticeHeartList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countnoticeHeart");
		//System.out.print("heartNo >> " + heartNoticeNo);
		
		 try {
			 pstmt = conn.prepareStatement(sql);
			 rset = pstmt.executeQuery();
		 while(rset.next()) { 
			 NoticeHeart nh = new NoticeHeart();
			 pstmt.setInt(1, heartNoticeNo.getNoticeNo());
			 noticeHeartList.add(nh);
			} 
		 System.out.print("noticeHeartList >> " + noticeHeartList);
		 } catch(SQLException e) { 
			 e.printStackTrace(); 
		}
		
		return noticeHeartList;
	}

}
