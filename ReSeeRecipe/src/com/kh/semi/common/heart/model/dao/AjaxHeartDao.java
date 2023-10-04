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
	
	
	/****************************************************************************/
	// 레시피 좋아요여부
	public boolean isHeartRecipe(Heart ht, Connection conn) {
		// 특정 멤버가 특정 대상에 좋아요를 했는지 확인 후 했다면 true반환
		boolean flag = false;
		String sql = prop.getProperty("isHeartRecipe");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			pstmt.setInt(2, ht.getMemNo());
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
	
	
	// 북마크여부
	public boolean isHeartBookmark(Heart ht, Connection conn) {
		boolean flag = false;
		String sql = prop.getProperty("isHeartBookmark");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			pstmt.setInt(2, ht.getMemNo());
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
	
	
	// 공지사항 좋아요여부
	public boolean isHeartNotice(Heart ht, Connection conn) {
		boolean flag = false;
		String sql = prop.getProperty("isHeartNotice");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			pstmt.setInt(2, ht.getMemNo());
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
	
	
	// 구독여부
	public boolean isHeartSubsc(Heart ht, Connection conn) {
		boolean flag = false;
		String sql = prop.getProperty("isHeartSubsc");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			pstmt.setInt(2, ht.getMemNo());
			
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
	
	
	// 리플 좋아요여부
	public boolean isHeartReply(Heart ht, Connection conn) {
		boolean result = false;
		String sql = prop.getProperty("isHeartReply");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getHtTargetNo());
			pstmt.setInt(2,ht.getMemNo());
			
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
	
	
	/****************************************************************************/
	public int insertHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int deleteHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int insertHeartBookMark(Heart ht, Connection conn) {
		int result = 0;
		String sql = prop.getProperty("insertHeartBookMark");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteHeartBookmark(Heart ht, Connection conn) {
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
	
	
	public int insertHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int deleteHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int insertHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int deleteHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int insertHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int deleteHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int insertHeartRecipe(Heart ht, Connection conn) {
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
	
	
	public int deleteHeartRecipe(Heart ht, Connection conn) {
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
		System.out.println();
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
	
	
	public int insertHt(Heart ht, Connection conn) {
		// 현재 유저 STATUS = 'Y', 타겟의 STATUS = 'Y'
		
		int resultProceed = false;
		String sql = prop.getProperty("insertHeart");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int deleteHt(Heart ht, Connection conn) {
		// heartCheck종류 메소드 선행했을 시 현재 유저 STATUS = 'Y', 타겟의 STATUS = 'Y'
		
		int result = 0;
		boolean result = false;
		String sql = prop.getProperty("deleteHeart").replace("$BASEKEY", ht.getHtKind());
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, ht.getMemNo());
			pstmt.setInt(2, ht.getHtTargetNo());
			
			proceed = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
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
				System.out.println("get >> " + n.getNoticeNo());
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
			 System.out.println("noticeHeartList >> " + noticeHeartList);
			 System.out.println("count >> " + nh.getNoticeHeartCount());
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
