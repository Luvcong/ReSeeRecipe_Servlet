package com.kh.semi.coupon.model.dao.manager;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.coupon.model.vo.Coupon;

public class CouponDao {
	
	private Properties prop = new Properties();
	
	public CouponDao() {
		String file = CouponDao.class.getResource("/sql/report/coupon-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	// CouponDao
	
	
	/**
	 * 관리자 쿠폰함 리스트 조회 요청건 처리
	 * @param conn
	 * @param pi PageInfo
	 * @return 등록되어 있는 쿠폰함 리스트 
	 * @author JH
	 * @Date : 2023. 10. 17.
	 */
	public ArrayList<Coupon> selectCouponList(Connection conn, PageInfo pi){
		
		ArrayList<Coupon> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCouponList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}	// selectCouponList
	
	
	/**
	 * 쿠폰함 리스트 카운트 행 수 조회 요청건 처리
	 * @return DB에 저장되어 있는 쿠폰함 리스트 수
	 * @author JH
	 * @Date : 2023. 10. 17.
	 */
	public int selectCouponListCount(Connection conn) {
		
		int couponListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCouponListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				couponListCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return couponListCount;
		
	}	// selectCouponListCount
	
	
}	// end class
