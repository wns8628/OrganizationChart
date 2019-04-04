package com.douzone.quicksilver.vo;

public class DepartmentsVo {
	
	private Long no;
	private String name;
	private Long gNo;
	private Long oNo;
	private Long depth;
	private Long companyNo;
	private Long parents;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getgNo() {
		return gNo;
	}
	public void setgNo(Long gNo) {
		this.gNo = gNo;
	}
	public Long getoNo() {
		return oNo;
	}
	public void setoNo(Long oNo) {
		this.oNo = oNo;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	public Long getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(Long companyNo) {
		this.companyNo = companyNo;
	}
	public Long getParents() {
		return parents;
	}
	public void setParents(Long parents) {
		this.parents = parents;
	}
	@Override
	public String toString() {
		return "DepartmentsVo [no=" + no + ", name=" + name + ", gNo=" + gNo + ", oNo=" + oNo + ", depth=" + depth
				+ ", companyNo=" + companyNo + ", parents=" + parents + "]";
	}
	

	
}
