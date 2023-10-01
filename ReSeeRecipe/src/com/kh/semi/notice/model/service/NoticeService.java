package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.semi.common.JDBCTemplate.*;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		
		return list;
	}
	
	
}
