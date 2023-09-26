package com.kh.semi.common.model.vo;

public class PageInfo {
	
	
	int listCount; // 페이지 개수는 게시글 총 개수에 영향을 받음
				   // => 현재 일반게시판의 게시글 총 개수
		   		   // => BOARD테이블로부터 COUNT(*)활용 (STATUS = 'Y')해서 조회
	int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("cpage")
	int pageLimit; // 한 페이지에 보여질 페이징 바의 최대 개수 (페이지 하단에 보여질 페이징바의 최대 개수) => 10개로 고정
	int boardLimit; // 한 페이지에 최대 몇개의 게시글을 보여줄건지 (한 페이지에 보여질 게시글의 최대 개수) => 10개로 고정
	
	int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
	int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
	int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
	
	public PageInfo() {
		super();
	}
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public int getListCount() {
		return listCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}