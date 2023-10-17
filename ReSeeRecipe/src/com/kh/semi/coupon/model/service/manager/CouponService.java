package com.kh.semi.coupon.model.service.manager;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.coupon.model.dao.manager.CouponDao;
import com.kh.semi.coupon.model.vo.Coupon;

public class CouponService {

	private CouponDao couponDao;
	
	public CouponService() {
		super();
		couponDao = new CouponDao();
	}	// CouponService
	
	
	/**
	 * 관리자 쿠폰함 리스트 조회 요청
	 * @param pi
	 * @return 등록되어 있는 쿠폰함 리스트
	 * @author JH
	 * @Date : 2023. 10. 17.
	 */
	public ArrayList<Coupon> selectCouponList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> list = couponDao.selectCouponList(conn, pi);
		
		close(conn);
		
		return list;
		
	}	// selectCouponList
	
	
	/**
	 * 관리자 쿠폰함 리스트 카운트 행 수 조회 요청
	 * @return DB에 저장되어 있는 쿠폰함 리스트 수
	 * @author JH
	 * @Date : 2023. 10. 17.
	 */
	public int selectCouponListCount(){
		
		Connection conn = getConnection();
		
		int couponListCount = couponDao.selectCouponListCount(conn);
		
		close(conn);
		
		return couponListCount; 
		
	}	// selectCouponListCount
	
	
	
	
}	// end class
