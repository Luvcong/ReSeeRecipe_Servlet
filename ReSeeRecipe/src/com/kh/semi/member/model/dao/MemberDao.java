package com.kh.semi.member.model.dao;

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
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.member.model.vo.MemberUpdate;

public class MemberDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	// 기본생성자 호출 시 member-mapper.xml파일 읽어오기
	public MemberDao() {
		
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인시 로그인 한 유저 DB정보 가져오기
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEM_NO"),
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
							   rset.getString("MEM_NAME"),
							   rset.getString("MEM_NICKNAME"),
							   rset.getString("MEM_EMAIL"),
							   rset.getString("MEM_STATUS"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getDate("DELETE_DATE"),
							   rset.getString("MEM_PICTURE"),
							   rset.getInt("MEM_GRADE"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	// 회원가입
	/**
	 * @param conn : Connection 객체
	 * @param m : 회원가입하는 Member객체
	 * @return : 회원insert 성공 여부에 따른 결과값(성공1 또는 실패0)
	 */
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemNickname());
			pstmt.setString(3, m.getMemId());
			pstmt.setString(4, m.getMemPwd());
			pstmt.setString(5, m.getMemEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원가입 시 nickname 중복체크
	/**
	 * @param conn : Connection 객체
	 * @param checkNickname : 회원가입에 쓸 사용자 nickname 입력값
	 * @return : 이미 존재하는 아이디 1 또는 사용가능 0
	 */
	public int nicknameCheck(Connection conn, String checkNickname) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nicknameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkNickname);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 회원가입시 id 중복체크
	/**
	 * @param conn : Connection 객체
	 * @param checkId : 회원가입에 쓸 사용자 id 입력값
	 * @return : 이미 존재하는 아이디 1 또는 사용가능 0
	 */
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 회원가입시 email 중복체크
	public int emailCheck(Connection conn, String checkEmail) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 아이디 찾기
	public Member searchMemberId(Connection conn, String memberName, String memberEmail) {

		Member searchMember = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				searchMember = new Member(rset.getInt("MEM_NO"),
										  rset.getString("MEM_ID"),
										  rset.getString("MEM_PWD"),
										  rset.getString("MEM_NAME"),
										  rset.getString("MEM_NICKNAME"),
										  rset.getString("MEM_EMAIL"),
										  rset.getString("MEM_STATUS"),
										  rset.getDate("ENROLL_DATE"),
										  rset.getDate("MODIFY_DATE"),
										  rset.getDate("DELETE_DATE"),
										  rset.getString("MEM_PICTURE"),
										  rset.getInt("MEM_GRADE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return searchMember;
	}

	
	public int selectMemlistCount(Connection conn) {
		
		int memlistCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemlistCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memlistCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memlistCount;
	}
	
	
	public ArrayList<Member> selectMemberAll(Connection conn, PageInfo pi){
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemNo(rset.getInt("MEM_NO"));
				m.setMemName(rset.getString("MEM_NAME"));
				m.setMemId(rset.getString("MEM_ID"));
				m.setMemNickname(rset.getString("MEM_NICKNAME"));
				m.setMemEmail(rset.getString("MEM_EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				//m.setMemReward(rset.getInt("MEM_REWARD"));
				m.setMemGrade(rset.getInt("MEM_GRADE"));
				m.setMemGradeName(rset.getString("MEM_GRADE_NAME"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public Member selectMemInfo(Connection conn, int memNo) {
		
		//ArrayList<Member> list = new ArrayList();
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemNo(rset.getInt("MEM_NO"));
				m.setMemName(rset.getString("MEM_NAME"));
				m.setMemId(rset.getString("MEM_ID"));
				m.setMemNickname(rset.getString("MEM_NICKNAME"));
				m.setMemEmail(rset.getString("MEM_EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setModifyDate(rset.getDate("MODIFY_DATE"));
				m.setMemGrade(rset.getInt("MEM_GRADE"));
				m.setMemGradeName(rset.getString("MEM_GRADE_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int updateMemInfo(Connection conn, Member m) {
		
		int result1 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemNickname());
			pstmt.setString(3, m.getMemEmail());
			//pstmt.setInt(4, m.getMemGrade());
			pstmt.setString(4, m.getMemGradeName());
			pstmt.setInt(5, m.getMemNo());
			
			result1 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1;
	}
	
	public int insertMemUpdate(Connection conn, MemberUpdate mu) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mu.getMemNo());
			pstmt.setString(2,mu.getMemUpdateCon());
			pstmt.setInt(3, mu.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMemUpdate(Connection conn, MemberUpdate mu) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mu.getMemUpdateCon());
			pstmt.setInt(2, mu.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
