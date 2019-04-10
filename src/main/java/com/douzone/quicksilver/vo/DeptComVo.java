package com.douzone.quicksilver.vo;

public class DeptComVo {

	private Long no;
	private Long departmentsNo;
	private Long companyNo;
	private String fromDate;
	private String toDate;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getDepartmentsNo() {
		return departmentsNo;
	}
	public void setDepartmentsNo(Long departmentsNo) {
		this.departmentsNo = departmentsNo;
	}
	public Long getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(Long companyNo) {
		this.companyNo = companyNo;
	}
	
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	
	@Override
	public String toString() {
		return "DeptComVo [no=" + no + ", departmentsNo=" + departmentsNo + ", companyNo=" + companyNo + ", fromDate="
				+ fromDate + ", toDate=" + toDate + "]";
	}
	
	
}
