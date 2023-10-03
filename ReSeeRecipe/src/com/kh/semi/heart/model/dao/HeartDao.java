package com.kh.semi.heart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.heart.model.vo.NoticeHeart;

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
	
	public ArrayList<NoticeHeart> selectHeartCount(Connection conn){
		
		
	}

}
