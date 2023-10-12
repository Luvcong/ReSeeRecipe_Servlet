package com.kh.semi.reward.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.reward.model.vo.Reward;

public class RewardDao {
	
	// sql properties
	private Properties prop = new Properties();
	
	public RewardDao() {
		
		String file = RewardDao.class.getResource("/sql/reward/reward-mapper.xml").getPath();
		
		// 파일 읽기
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	// RewardDao
	
	
	/**
	 * 등록되어 있는 리워드 리스트를 조회 처리
	 * @param conn
	 * @return 등록되어 있는 리워드 리스트
	 * @author JH
	 * @Date : 2023. 10. 12.
	 */
	public ArrayList<Reward> selectRewardList(Connection conn, PageInfo pi){
		
		ArrayList<Reward> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRewardList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reward reward = new Reward();
				reward.setRewardNo(rset.getInt("REWARD_NO"));
				reward.setMemId(rset.getString("MEM_ID"));
				reward.setMemNickname(rset.getString("MEM_NICKNAME"));
				reward.setMemGradeName(rset.getString("MEM_GRADE_NAME"));
				reward.setRewardDate(rset.getDate("REWARD_DATE"));
				reward.setRewardReason(rset.getString("REWARD_REASON"));
				reward.setRewardScore(rset.getInt("REWARD_SCORE"));
				reward.setSumRewardScore(rset.getInt("REWARD_SUM"));
				
				list.add(reward);
				// System.out.println(list);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}	// selectRewardList

	
	
	/**
	 * 리워드 리스트 카운트 행 수 조회 요청
	 * @param conn
	 * @return DB에 저장되어 있는 리워드 리스트 수
	 * @author JH
	 * @Date : 2023. 10. 12.
	 */
	public int selectRewardListCount(Connection conn) {
		
		int rewardListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRewardListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rewardListCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rewardListCount;
		
		
	}	// selectRewardListCount
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}	// end class
