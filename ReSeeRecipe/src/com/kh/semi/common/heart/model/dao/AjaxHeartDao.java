package com.kh.semi.common.heart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.common.heart.model.vo.Heart;
import com.kh.semi.common.heart.model.vo.NoticeHeart;

public class AjaxHeartDao {
	
	
	private Properties prop = new Properties();
	
	public AjaxHeartDao() {
		
		String filePath = AjaxHeartDao.class.getResource("/sql/heart/heart-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/****************************************************************************/
	
	
	/*************** 특정 대상 하트 카운트 조회 기능 ***************************************/
	public int htCountRecipe(Connection conn, int htTargetNo) {
		
		// 기본 변수 세팅
		int result = 0;
		String sql = prop.getProperty("htCountRecipe");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, htTargetNo);
			
			try(ResultSet rset = pstmt.executeQuery()){
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int htCountBookmark(Connection conn, int htTargetNo) {
		
		int result = 0;
		String sql = prop.getProperty("htCountBookmark");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, htTargetNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int htCountNotice(Connection conn, int htTargetNo) {
		
		int result = 0;
		String sql = prop.getProperty("htCountNotice");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, htTargetNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
 		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public int htCountSubsc(Connection conn, int htTargetNo) {
		
		int result = 0;
		String sql = prop.getProperty("htCountSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, htTargetNo);
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int htCountReply(Connection conn, int htTargetNo) {
		
		int result = 0;
		String sql = prop.getProperty("htCountReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try(ResultSet rset = pstmt.executeQuery()) {
				pstmt.setInt(1, htTargetNo);
				
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/****************************************************************************/
	
	
	/*************** 좋아요 여부 체크 기능 *********************************************/
	public boolean isHeartRecipe(Connection conn, Heart ht) {
		// 특정 멤버가 특정 대상에 좋아요를 했는지 확인 후 했다면 true반환
		boolean flag = false;
		String sql = prop.getProperty("isHeartRecipe");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean isHeartBookmark(Connection conn, Heart ht) {
		
		boolean flag = false;
		String sql = prop.getProperty("isHeartBookmark");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
	
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean isHeartNotice(Connection conn, Heart ht) {
		
		boolean flag = false;
		String sql = prop.getProperty("isHeartNotice");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());

			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean isHeartSubsc(Connection conn, Heart ht) {
		
		boolean flag = false;
		String sql = prop.getProperty("isHeartSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean isHeartReply(Connection conn, Heart ht) {
		
		boolean result = false;
		String sql = prop.getProperty("isHeartReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1,ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/****************************************************************************/
	

	/*************** 좋아요 추가/삭제(INSERT/DELETE) 기능 ******************************/
	public int insertHeartRecipe(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("insertHeartRecipe");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartRecipe(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("deleteHeartRecipe");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int insertHeartBookmark(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("insertHeartBookmark");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartBookmark(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("deleteHeartBookmark");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int insertHeartNotice(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("insertHeartNotice");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartNotice(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("deleteHeartNotice");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int insertHeartSubsc(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("insertHeartSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
	
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartSubsc(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("deleteHeartSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int insertHeartReply(Connection conn, Heart ht) {
		
		int result = 0;
		String sql = prop.getProperty("insertHeartReply");
	
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
		
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartReply(Connection conn, Heart ht) {
	
		int result = 0;
		String sql = prop.getProperty("deleteHeartReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/****************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	case "RECIPE" :
	case "BOOKMARK" :
	case "NOTICE" : result = new HeartDao().heartCountGeneralBoard(ht, conn); break;
	case "SUBSC" : result = new HeartDao().heartCountSubsc(ht, conn); break;
	case "REPLY" : result = new HeartDao().heartCountReply(ht, conn); break;
	*/
	public int heartCountGeneralBoard(Heart ht, Connection conn) {
		int result = 0;
		String sql = prop.getProperty("heartCountGeneralBoard").replace("$BASEKEY", ht.getHtKind());
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int heartCountSubsc(Heart ht, Connection conn) {
		int result = 0;
		String sql = prop.getProperty("heartCountSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int heartCountReply(Heart ht, Connection conn) {
		int result = 0;
		String sql = prop.getProperty("heartCountReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, ht.getHtTargetNo());
			
			try(ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					result = rset.getInt("COUNT(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/****************************************************************************/
	/****************************************************************************/
	
	
	
	
	
	
	/****************************************************************************/
	
	public ArrayList<NoticeHeart> countnoticeHeart(Connection conn, ArrayList<NoticeHeart> heartNoticeNo){
		NoticeHeart nh = null;
		ArrayList<NoticeHeart> noticeHeartList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countnoticeHeart");
		//System.out.print("heartNo >> " + heartNoticeNo);
		
		 try {
			pstmt = conn.prepareStatement(sql);
			
			for(NoticeHeart n : heartNoticeNo) {
				pstmt.setInt(1, n.getNoticeNo());
				noticeHeartList.add(n);
			}
			
			 rset = pstmt.executeQuery();
			 //ArrayList<int> count = new ArrayList();
			 while(rset.next()) {
				nh = new NoticeHeart();
				//nh.setMemNo(rset.getInt("MEM_NO"));
				//nh.setNoticeNo(rset.getInt("NOTICE_NO"));
				//nh.setNoticeHtDate(rset.getDate("HT_NOTICE_DATE"));
				nh.setNoticeHeartCount(rset.getInt("COUNT(NOTICE_NO)"));
				noticeHeartList.add(nh);
			 }
		 } catch(SQLException e) { 
			 e.printStackTrace(); 
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeHeartList;
	}
	
	public ArrayList<NoticeHeart> selectnoticeHeartList(Connection conn){
		
		ArrayList<NoticeHeart> selectnoticeHeartList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectnoticeHeartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				NoticeHeart nh = new NoticeHeart();
				nh.setMemNo(rset.getInt("MEM_NO"));
				nh.setNoticeNo(rset.getInt("NOTICE_NO"));
				nh.setNoticeHtDate(rset.getDate("HT_NOTICE_DATE"));
				
				selectnoticeHeartList.add(nh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectnoticeHeartList;
	}

}
