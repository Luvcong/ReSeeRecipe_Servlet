package com.kh.semi.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.heart.model.dao.HeartDao;
import com.kh.semi.heart.model.vo.Heart;
import com.kh.semi.heart.model.vo.NoticeHeart;

public class HeartService {
	
	public String heartCount(Heart ht) {
		
		String result = "";
		Connection conn = getConnection();
		
		// Dao의 메소드 호출 분배
		switch(ht.getHtKind()) {
			case "RECIPE" :
			case "BOOKMARK" :
			case "NOTICE" : result = new HeartDao().heartCountGeneralBoard(ht, conn); break;
			case "SUBSC" : result = new HeartDao().heartCountSubsc(ht, conn); break;
			case "REPLY" : result = new HeartDao().heartCountReply(ht, conn); break;
			default : break;
		}
		
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	/****************************************************************************/
	
	public ArrayList<NoticeHeart> countnoticeHeart(ArrayList<NoticeHeart> heartNoticeNo){
		
		Connection conn = getConnection();
		
		ArrayList<NoticeHeart> noticeHeartList = new HeartDao().countnoticeHeart(conn, heartNoticeNo);
		
		close(conn);
		
		return noticeHeartList;
	}
	
	public ArrayList<NoticeHeart> selectnoticeHeartList(){
		
		Connection conn = getConnection();
		
		ArrayList<NoticeHeart> selectnoticeHeartList = new HeartDao().selectnoticeHeartList(conn);
		
		close(conn);
		
		return selectnoticeHeartList;
		
	}
	
	
}
