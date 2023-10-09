package com.kh.semi.dm.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.dm.model.dao.DmDao;
import com.kh.semi.dm.model.vo.Dm;

public class DmService {
	
	private DmDao dmDao;
	
	public DmService() {
		super();
		dmDao = new DmDao();
	}
	
	/**
	 * 쪽지함 리스트 조회를 요청하는 method
	 * @return 쪽지리스트 전체 내용
	 * @author JH
	 * @Date : 2023. 09. 30.
	 */
	public ArrayList<Dm> selectDmList() {
		
		Connection conn = getConnection();
		
		ArrayList<Dm> list = dmDao.selectDmList(conn);
		
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
	

	/**
	 * 쪽지 답변 method
	 * @param dm 답변내용 / 쪽지seqNo(식별값)
	 * @return TB_DM - DM_REPLY 컬럼 INSERT 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 3.
	 */
	public int updateReply(Dm dm) {
		
		Connection conn = getConnection();
		
		int result = dmDao.updateReply(conn, dm);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}	// updateReply
	
	
	/**
	 * 쪽지 삭제를 요청하는 method
	 * @param dmNo 쪽지를 삭제하기 위한 식별값
	 * @return 삭제 성공 여부
	 * @author JH
	 * @Date : 2023. 10. 3.
	 */
	public int deleteDm(int dmNo) {
		
		Connection conn = getConnection();
		
		int result = dmDao.deleteDm(conn, dmNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
//	public Dm selectDm(int dmNo) {
//		
//		Connection conn = getConnection();
//		
//		Dm dm = dmDao.selectDm(conn, dmNo);
//		
//		close(conn);
//		
//		return dm;
//	}
//	
	
}	// end class
