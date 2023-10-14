package com.kh.semi.tag.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.tag.model.vo.Tag;
import static com.kh.semi.common.JDBCTemplate.*;

public class TagDao {
	
	private Properties prop = new Properties();
	
	public TagDao() {
		
		String fileName = TagDao.class.getResource("/sql/tag/tag-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<Tag> selectAllTagname(Connection conn){
		
		ArrayList<Tag> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllTagname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Tag t = new Tag();
				t.setTagName(rset.getString("TAG_NAME"));
				
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
