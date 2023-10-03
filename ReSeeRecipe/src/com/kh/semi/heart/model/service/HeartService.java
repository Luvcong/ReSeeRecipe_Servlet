package com.kh.semi.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.heart.model.dao.HeartDao;
import com.kh.semi.heart.model.vo.NoticeHeart;

public class HeartService {
	
	public int countnoticeHeart(){
		
		Connection conn = getConnection();
		
		int cnh = new HeartDao().countnoticeHeart(conn);
		
		close(conn);
		
		return cnh;
	}
	
	
}
