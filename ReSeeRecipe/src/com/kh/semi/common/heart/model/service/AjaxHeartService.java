package com.kh.semi.common.heart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.heart.model.dao.AjaxHeartDao;
import com.kh.semi.common.heart.model.vo.Heart;
import com.kh.semi.common.heart.model.vo.NoticeHeart;

import static com.kh.semi.common.JDBCTemplate.*;

public class AjaxHeartService {
	
	/****************************************************************************/
	
	
	
	
	
	/****************************************************************************/
	public int htChangeRecipe(Heart ht) {
		// 기본 변수 세팅
		boolean flag = false;
		int result = 0;
		AjaxHeartDao ahd = new AjaxHeartDao();
		Connection conn = getConnection();
		
		// Dao의 좋아요여부 체크하는 메소드 호출
		flag = ahd.isHeartRecipe(ht, conn);
	
		// false(좋아요내역 없을 경우) : 좋아요 INSERT메소드 호출 result에 int결과 받음
		// true(좋아요 내역 있을 경우) : 좋아요 DELETE메소드 호출 result에 int결과 받음
		if(!flag && (ahd.insertHeartRecipe(ht, conn) > 0)) {
			result = 1;
			commit(conn);
		} else if(flag && (ahd.deleteHeartRecipe(ht, conn) > 0)) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int htChangeBookmark(Heart ht) {

		boolean flag = false;
		int result = 0;
		AjaxHeartDao ahd = new AjaxHeartDao();
		Connection conn = getConnection();
		
		flag = ahd.isHeartBookmark(ht, conn);
	
		if(!flag && (ahd.insertHeartBookmark(ht, conn) > 0)) {
			result = 1;
			commit(conn);
		} else if(flag && (ahd.deleteHeartBookmark(ht, conn) > 0)) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int htChangeNotice(Heart ht) {

		boolean flag = false;
		int result = 0;
		AjaxHeartDao ahd = new AjaxHeartDao();
		Connection conn = getConnection();
		
		flag = ahd.isHeartNotice(ht, conn);
	
		if(!flag && (ahd.insertHeartRecipe(ht, conn) > 0)) {
			result = 1;
			commit(conn);
		} else if(flag && (ahd.deleteHeartRecipe(ht, conn) > 0)) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int htChangeRecipe(Heart ht) {

		boolean flag = false;
		int result = 0;
		AjaxHeartDao ahd = new AjaxHeartDao();
		Connection conn = getConnection();
		
		flag = ahd.isHeartRecipe(ht, conn);
	
		if(!flag && (ahd.insertHeartRecipe(ht, conn) > 0)) {
			result = 1;
			commit(conn);
		} else if(flag && (ahd.deleteHeartRecipe(ht, conn) > 0)) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int htChangeRecipe(Heart ht) {

		boolean flag = false;
		int result = 0;
		AjaxHeartDao ahd = new AjaxHeartDao();
		Connection conn = getConnection();
		
		flag = ahd.isHeartRecipe(ht, conn);
	
		if(!flag && (ahd.insertHeartRecipe(ht, conn) > 0)) {
			result = 1;
			commit(conn);
		} else if(flag && (ahd.deleteHeartRecipe(ht, conn) > 0)) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
