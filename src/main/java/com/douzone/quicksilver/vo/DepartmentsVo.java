package com.douzone.quicksilver.vo;

public class DepartmentsVo {
	
	private int no;
	private String name;
	private int gNo;
	private int oNo;
	private int depth;
	private int companyNo;
	private int parents;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public int getParents() {
		return parents;
	}
	public void setParents(int parents) {
		this.parents = parents;
	}
	@Override
	public String toString() {
		return "DepartmentsVo [no=" + no + ", name=" + name + ", gNo=" + gNo + ", oNo=" + oNo + ", depth=" + depth
				+ ", companyNo=" + companyNo + ", parents=" + parents + "]";
	}
	

	
}
