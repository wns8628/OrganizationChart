package com.douzone.quicksilver.vo;

public class PaginationVo {

	private int totalboardcount;
	private int totalpage;
	private int startboard;
	private int pageNo; //url 페이지번호
	private int startPage;
	private int endPage;
	private int manyboard; //한페이지당 보여줄 게시글 
	private int limitcount; //게시글이 많아도 몇개의 페이지번호를 보여줄것인지
	private String kwd; //검색했을때 페이징위해
	
	private String type; //부서 ,사업장 ,회사 타입나눌떄

	public int getTotalboardcount() {
		return totalboardcount;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public int getStartboard() {
		return startboard;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getManyboard() {
		return manyboard;
	}

	public int getLimitcount() {
		return limitcount;
	}

	public String getKwd() {
		return kwd;
	}

	public String getType() {
		return type;
	}

	public void setTotalboardcount(int totalboardcount) {
		this.totalboardcount = totalboardcount;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public void setStartboard(int startboard) {
		this.startboard = startboard;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setManyboard(int manyboard) {
		this.manyboard = manyboard;
	}

	public void setLimitcount(int limitcount) {
		this.limitcount = limitcount;
	}

	public void setKwd(String kwd) {
		this.kwd = kwd;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "PaginationVo [totalboardcount=" + totalboardcount + ", totalpage=" + totalpage + ", startboard="
				+ startboard + ", pageNo=" + pageNo + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", manyboard=" + manyboard + ", limitcount=" + limitcount + ", kwd=" + kwd + ", type=" + type + "]";
	}
	
}
