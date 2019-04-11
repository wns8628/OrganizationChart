package com.douzone.quicksilver.vo;

public class DeptManagerVo {
	
	private Long no;
	private Long empNo;
	private Long departmentsNo;
	private String fromDate;
	private String toDate;
	
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getEmpNo() {
		return empNo;
	}
	public void setEmpNo(Long empNo) {
		this.empNo = empNo;
	}
	public Long getDepartmentsNo() {
		return departmentsNo;
	}
	public void setDepartmentsNo(Long departmentsNo) {
		this.departmentsNo = departmentsNo;
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
		return "DeptManagerVo [no=" + no + ", empNo=" + empNo + ", departmentsNo=" + departmentsNo + ", fromDate="
				+ fromDate + ", toDate=" + toDate + ", name=" + name + "]";
	}

	
	
	

}
