package com.kh.semi.dm.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.dm.model.dao.DmDao;
import com.kh.semi.dm.model.vo.Dm;

public class DmService {
	
	
	/**
	 * 쪽지함 리스트 조회를 요청하는 method
	 * @return list
	 */
	public ArrayList<Dm> selectDmList() {
		
		Connection conn = getConnection();
		
		ArrayList<Dm> list = new DmDao().selectDmList(conn);
		
		close(conn);
		
		return list;
	}	// selectDmList
	
	
}	// end class
