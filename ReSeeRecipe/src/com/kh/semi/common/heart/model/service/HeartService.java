package com.kh.semi.common.heart.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.heart.model.dao.HeartDao;
import com.kh.semi.common.heart.model.vo.Heart;
import com.kh.semi.common.heart.model.vo.NoticeHeart;


public class HeartService {
	
	
	public String ajaxHeartCount(Heart ht) {
		
		String result = "";
		HeartDao hd = new HeartDao();
		Connection conn = getConnection();
		
		// Dao의 메소드 호출 분배
		switch(ht.getHtKind()) {
			case "RECIPE" :
			case "BOOKMARK" :
			case "NOTICE" : result = String.valueOf(hd.heartCountGeneralBoard(ht, conn)); break;
			case "SUBSC" : result = String.valueOf(hd.heartCountSubsc(ht, conn)); break;
			case "REPLY" : result = String.valueOf(hd.heartCountReply(ht, conn)); break;
			default : break;
		}
		close(conn);
		return result;
	}
	/****************************************************************************/
	
	
	public boolean ajaxHeartAddCancel(Heart ht) {
		
		boolean result = false;
		HeartDao hd = new HeartDao();
		Connection conn = getConnection();
		
		// Dao의 메소드 호출 분배
		switch(ht.getHtKind()) {
			case "RECIPE" :
			case "BOOKMARK" :
			case "NOTICE" : result = hd.isHeartGeneralBoard(ht, conn); break;
			case "SUBSC" : result = hd.isHeartSubsc(ht, conn); break;
			case "REPLY" : result = hd.isHeartReply(ht, conn); break;
			default : break;
		}
		
		
		if(!result) { // 좋아요 내역 없을 경우 (result false일 경우)
			if(hd.insertHeart(ht, conn) > 0) { // insert구문 수행 후 성공 시 true
				result = true;
				commit(conn);
			}
		} else if(result) { // 좋아요 내역 있을 경우 (result true일 경우)
			if(hd.deleteHeart(ht, conn) > 0) { // delete구문 수행 후 성공 시 true
				result = true;
				commit(conn);
			}
		} else {
			rollback(conn);
		}
		
		
		
		
		if((!result && (hd.insertHeart(ht, conn) > 0))
		 || (result && (hd.deleteHeart(ht, conn) > 0))) { 
			result = true;
			commit(conn);
		} else {
			rollback(conn);
		}
		
		switch(result) {
		case !result: break;
		case result : break;
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
