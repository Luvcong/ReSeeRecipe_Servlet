package com.kh.semi.myPage.model.service;

import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.myPage.model.dao.MyPageDao;
import com.kh.semi.myPage.model.vo.MemberCoupon;
import static com.kh.semi.common.JDBCTemplate.*;

public class MyPageService {
	
	public ArrayList<MemberCoupon> selectMemberCouponList(int memberNo, String selected){
		
		Connection conn = getConnection();
		
		ArrayList<MemberCoupon> list = new MyPageDao().selectMemberCouponList(conn, memberNo, selected);
		
		close(conn);
		
		return list;
	}

}
