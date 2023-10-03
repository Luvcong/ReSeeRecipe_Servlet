package com.kh.semi.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.heart.model.dao.HeartDao;
import com.kh.semi.heart.model.vo.NoticeHeart;
import com.kh.semi.notice.model.vo.Notice;

public class HeartService {
	
	public ArrayList<NoticeHeart> countnoticeHeart(ArrayList<NoticeHeart> noticeNolist){
		
		Connection conn = getConnection();
		
		ArrayList<NoticeHeart> noticeHeartList = new HeartDao().countnoticeHeart(conn, noticeNolist);
		
		close(conn);
		
		return noticeHeartList;
	}
	
	
}
