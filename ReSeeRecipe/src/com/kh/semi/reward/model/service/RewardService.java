package com.kh.semi.reward.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.reward.model.dao.RewardDao;
import com.kh.semi.reward.model.vo.Reward;

public class RewardService {

	private RewardDao rewardDao;
	
	public RewardService() {
		super();
		rewardDao = new RewardDao();
	}
	
	
	/**
	 * 등록되어 있는 리워드 리스트 조회 요청
	 * @return 등록되어 있는 리워드 리스트
	 * @author JH
	 * @Date : 2023. 10. 12.
	 */
	public ArrayList<Reward> selectRewardList(PageInfo pi){
	
		Connection conn = getConnection();
		
		ArrayList<Reward> list = rewardDao.selectRewardList(conn, pi);
		
		close(conn);
		
		return list;
		
	}	// selectRewardList
	
	
	/**
	 * 리워드 리스트 카운트 행 수 조회 요청
	 * @return DB에 저장되어 있는 리워드 리스트 수
	 * @author JH
	 * @Date : 2023. 10. 12.
	 */
	public int selectRewardListCount() {
		
		Connection conn = getConnection();
		
		int rewardListCount = rewardDao.selectRewardListCount(conn);
		
		close(conn);
		
		return rewardListCount;
		
	}	// selectRewardListCount
	
	
}	// end class
