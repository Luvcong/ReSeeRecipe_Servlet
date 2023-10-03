package com.kh.semi.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.heart.model.dao.HeartDao;
import com.kh.semi.heart.model.vo.NoticeHeart;

public class HeartService {
	
	public ArrayList<NoticeHeart> selectHeartCount(){
		
		Connection conn = getConnection();
		
		ArrayList<NoticeHeart> list = new HeartDao().selectHeartCount(conn);
		
		close(conn);
		
		return list;
	}
	
	
}
