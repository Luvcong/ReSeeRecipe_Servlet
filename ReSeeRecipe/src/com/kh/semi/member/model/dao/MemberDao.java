package com.kh.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String file = MemberDao.class.getResource("sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
