package com.kh.semi.manager.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.manager.model.dao.ManagerDao;
import com.kh.semi.member.model.vo.Member;

public class ManagerService {
	
	
	public Member managerSetting(int adminNo) {
		
		Connection conn =  getConnection();
		
		Member m = new ManagerDao().managerSetting(conn, adminNo);
		
		close(conn);
		
		return m;
	}
}
