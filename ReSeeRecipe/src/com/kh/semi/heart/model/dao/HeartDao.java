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
	
	public ArrayList<NoticeHeart> countnoticeHeart(Connection conn, ArrayList<NoticeHeart> noticeNolist){
		
		ArrayList<NoticeHeart> noticeHeartList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countnoticeHeart");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				NoticeHeart nh = new NoticeHeart();
				for(int i = 0; i < noticeNolist.size(); i++) {
					//Integer a = i;
					nh.setNoticeNo(rset.getInt(1, noticeNolist[i]));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
