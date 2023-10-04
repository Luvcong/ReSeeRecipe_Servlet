package com.kh.semi.common.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.heart.model.dao.HeartDao;
import com.kh.semi.common.heart.model.vo.Heart;
import com.kh.semi.common.heart.model.vo.NoticeHeart;


public class HeartService {
	
	
	public String heartCount(Heart ht) {
		
		String result = "";
		HeartDao hd = new HeartDao();
		Connection conn = getConnection();
		
		// Dao의 메소드 호출 분배
		switch(ht.getHtKind()) {
			case "RECIPE" :
			case "BOOKMARK" :
			case "NOTICE" : result = hd.heartCountGeneralBoard(ht, conn); break;
			case "SUBSC" : result = hd.heartCountSubsc(ht, conn); break;
			case "REPLY" : result = hd.heartCountReply(ht, conn); break;
			default : break;
		}
		close(conn);
		return result;
	}
	
	
	public boolean heartAddCancel(Heart ht) {
		
		boolean result = false;
		HeartDao hd = new HeartDao();
		Connection conn = getConnection();
		
		// Dao의 메소드 호출 분배
		switch(ht.getHtKind()) {
			case "RECIPE" :
			case "BOOKMARK" :
			case "NOTICE" : result = hd.heartCheckGeneralBoard(ht, conn); break;
			case "SUBSC" : result = hd.heartCheckSubsc(ht, conn); break;
			case "REPLY" : result = hd.heartCheckReply(ht, conn); break;
			default : break;
		}
		
		if(result == false) {
			// 좋아요내역 없으면 insert구문 수행 후 성공 시 true / 실패 시 false 반환
			result = hd.insertHeart(ht, conn);
			
		} else {
			// 좋아요내역 있으면 delete구문 수행 후 성공 시 true / 실패 시 false 반환
			result = hd.deleteHeart(ht, conn);
			
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
