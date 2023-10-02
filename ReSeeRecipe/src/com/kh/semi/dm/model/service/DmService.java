package com.kh.semi.dm.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.dm.model.dao.DmDao;
import com.kh.semi.dm.model.vo.Dm;

public class DmService {
	
	/**
	 * 쪽지함 리스트 조회를 요청하는 method
	 * @return 쪽지리스트 전체 내용
	 * @author JH
	 * @Date : 2023. 09. 30.
	 */
	public ArrayList<Dm> selectDmList() {
		
		Connection conn = getConnection();
		
		ArrayList<Dm> list = new DmDao().selectDmList(conn);
		
		close(conn);
		
		return list;
	}	// selectDmList
	
	
	/**
	 * 쪽지 미답변 개수 카운트 method
	 * @param list 전체 쪽지 목록
	 * @return 미답변 쪽지 개수
	 * @author JH
	 * @Date : 2023. 10. 1.
	 */
	public int getWaitingCount(ArrayList<Dm> list) {
		int result = 0;
		if(list == null || list.size() == 0)
			return result;
		
		for(Dm dm : list) {
			if(dm.getDmStatus().equals("N"))
				result++;
		}
		
		return result;
	}	// getWaitingCount
	
	
	
}	// end class
