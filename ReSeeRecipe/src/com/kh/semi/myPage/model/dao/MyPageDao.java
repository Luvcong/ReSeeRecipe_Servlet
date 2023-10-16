package com.kh.semi.myPage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.myPage.model.vo.MemberCoupon;
import static com.kh.semi.common.JDBCTemplate.*;

public class MyPageDao {
	
	private Properties prop = new Properties();
	
	public MyPageDao() {
		
		String file = MyPageDao.class.getResource("/sql/myPage/myPage-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public ArrayList<MemberCoupon> selectMemberCouponList(Connection conn, int memberNo){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberCoupon> list = new ArrayList();
		String sql = prop.getProperty("selectMemberCouponList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				System.out.println("응?");
				list.add(new MemberCoupon(rset.getInt("COUPON_EXPIRE"),
										  rset.getInt("COUPON_RATIO"),
										  rset.getString("COUPON_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
