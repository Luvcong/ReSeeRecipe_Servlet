package com.kh.semi.notice.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		
		close(conn); 
		
		return list;
	}
	
	public int selectNoticelistCount() {
		
		Connection conn =  getConnection();
		
		int noticelistCount = new NoticeDao().selectNoticelistCount(conn);
		
		close(conn);
		
		return noticelistCount;
	}
	
	public ArrayList<Notice> selectNoticeAll(PageInfo pg){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeAll(conn, pg);
		
		close(conn);
		
		return list;
	}
}
