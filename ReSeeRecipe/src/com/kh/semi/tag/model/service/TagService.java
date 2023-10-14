package com.kh.semi.tag.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.tag.model.dao.TagDao;
import com.kh.semi.tag.model.vo.Tag;

/**
 * @author LIM
 * 등록된 해시태그 명 조회 => whitelist 배열에 추가 => 등록된 해시태그만 이용할 수 있는 기능
 */
public class TagService {
	
	public ArrayList<Tag> selectALlTagname(){
		
		Connection conn = getConnection();
		
		ArrayList<Tag> list = new TagDao().selectAllTagname(conn);
		
		close(conn);
		
		return list;
	}

}
