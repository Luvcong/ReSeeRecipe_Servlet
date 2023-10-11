package com.kh.semi.board.un_recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class UnRecipeDao {
	
	private Properties prop = new Properties();
	
	public UnRecipeDao() {
		String filePath = UnRecipeDao.class.getResource("/sql/board/unrecipe-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
}// class.end