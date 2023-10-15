package com.kh.semi.notice.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;
import com.kh.semi.notice.model.vo.NoticePic;
import com.kh.semi.tag.model.dao.TagDao;
import com.kh.semi.tag.model.vo.Tag;

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
	
	public Notice selectNoticeInfo(int ManageNoticeNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNoticeInfo(conn, ManageNoticeNo);
		
		close(conn);
		
		return n;
	}
	
	public int insertNotice(Notice n, NoticePic np, List<String> extractedValues) {
		
		Connection conn = getConnection();
		
		// 반드시 수행되어야하는 구문
		// Notice 테이블에 INSERT 하나의 DAO 는 하나의 SQL문만 수행
		int result1 = new NoticeDao().insertNotice(conn, n);
		
		int result2 = 1;
		int result3 = 1;
		if(np != null || extractedValues != null) {
			result2 = new NoticeDao().insertNoticePic(conn, np);
			
			ArrayList<Tag> list = new TagDao().selectTagNo(conn, extractedValues);
			
			// 가장 마지막 공지사항 번호 DB에서 조회해오기 -- 할 필요 없을거 같기도.... 
			
			result3 = new NoticeDao().insertNoticeTag(conn, list);
		}
	}
}
