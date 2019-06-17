package com.douzone.quicksilver.vo;

public class RemoveEmpInfoVo {
	
	private String empName;
	private String loginId;
	private String table;
	
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	@Override
	public String toString() {
		return "RemoveEmpInfoVo [empName=" + empName + ", loginId=" + loginId + ", table=" + table + "]";
	}
	
	
}
