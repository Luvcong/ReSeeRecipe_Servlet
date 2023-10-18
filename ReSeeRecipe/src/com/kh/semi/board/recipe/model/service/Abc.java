package com.kh.semi.board.recipe.model.service;

import javax.servlet.http.HttpServletResponse;

public class Abc {
		
	private HttpServletResponse res;
	private String str;
	
	
	public Abc() {
		super();
	}
	public Abc(HttpServletResponse res, String str) {
		super();
		this.res = res;
		this.str = str;
	}
	
	
	public HttpServletResponse getRes() {
		return res;
	}
	public void setRes(HttpServletResponse res) {
		this.res = res;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	
	@Override
	public String toString() {
		return "Abc [res=" + res + ", str=" + str + "]";
	}

	
}
