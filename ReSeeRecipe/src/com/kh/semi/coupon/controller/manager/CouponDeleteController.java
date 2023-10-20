package com.kh.semi.coupon.controller.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.coupon.model.service.manager.CouponService;
import com.kh.semi.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponDeleteController
 */
@WebServlet("/jhdelete.cp")
public class CouponDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CouponService couponService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponDeleteController() {
        super();
        couponService = new CouponService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1)
		// 2)
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		// 3)
		// 4)
		int result = couponService.deleteCoupon(categoryNo);
		
		if(result > 0) {
			request.getSession().setAttribute("successMsg", "쿠폰 삭제가 완료되었습니다!");
		} else {
			request.getSession().setAttribute("failMsg", "쿠폰 삭제에 실패했습니다! 다시 시도해주세요");
		}
		response.sendRedirect(request.getContextPath() + "/jhselect.cp?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
