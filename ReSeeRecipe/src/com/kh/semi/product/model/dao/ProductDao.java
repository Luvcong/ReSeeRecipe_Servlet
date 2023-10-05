package com.kh.semi.product.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.product.model.vo.Product;
import com.kh.semi.product.model.vo.ProductPicture;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 상품의 총 개수 셀렉트해오는 메소드
	 * @return 개수
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	/**
	 * 상품리스트 카테고리 없이 페이징처리로 뿌려주는 메소드
	 * @return 페이징처리된 상품리스트
	 */
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi, String cate){
		
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			switch(cate) {
			case "best": cate = "PRODUCT_SCORE_AVG"; break;
			case "good": cate = "PRODUCT_NO"; break;
			case "new": cate = "PRODUCT_CREATE_DATE"; break;
			}
			
			pstmt.setString(1, cate);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Product p = new Product();
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setPrice(rset.getInt("PRODUCT_PRICE"));
				p.setProductScoreReviewAvg(rset.getDouble("PRODUCT_SCORE_AVG"));
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 상품리스트가져오는 메소드
	 * @return 상품리스트
	 */
	public ArrayList<Product> selectProductList(Connection conn){
		
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Product p = new Product();
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setPrice(rset.getInt("PRODUCT_PRICE"));
				p.setProductScoreReviewAvg(rset.getDouble("PRODUCT_SCORE_AVG"));
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	/**
	 * 상품번호로 디테일하게 가져오는 메소드
	 * @return 상품정보
	 */
	public Product selectProduct(Connection conn, int pno) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setProductSubname(rset.getString("PRODUCT_SUBNAME"));
				p.setPrice(rset.getInt("PRODUCT_PRICE"));
				p.setProductDetail(rset.getString("PRODUCT_DETAIL"));
				p.setDilivery(rset.getInt("PRODUCT_DILIVERY"));
				p.setOrigin(rset.getString("PRODUCT_ORIGIN"));
				p.setProductScoreReviewAvg(rset.getDouble("PRODUCT_SCORE_AVG"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	/**
	 * 상품번호로 사진 가져오는 메소드
	 * @return 상품정보의 사진
	 */
	public ArrayList<ProductPicture> selectPicture(Connection conn, int pno) {
		
		ArrayList<ProductPicture> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPicture");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductPicture pp = new ProductPicture();
				pp.setPictureNo(rset.getInt("PRODUCT_PICTURE_NO"));
				pp.setPictureOname(rset.getString("PRODUCT_PICTURE_ONAME"));
				pp.setPictureCname(rset.getString("PRODUCT_PICTURE_CNAME"));
				pp.setPicturePath(rset.getString("PRODUCT_PICTURE_PATH"));
				
				list.add(pp);
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
