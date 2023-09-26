package sql.common.model.vo;

public class PageInfo {
	
	
	int listCount;
	int currentPage;
	int pageLimit;
	int boardLimit;
	int maxPage;
	int startPage;
	int endPage;
	
	
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
	
	
}//class.end