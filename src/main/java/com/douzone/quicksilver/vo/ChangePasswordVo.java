package com.douzone.quicksilver.vo;

public class ChangePasswordVo {
	
	private String empName;
	private String loginId;
	private String newPassword;
	
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
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	@Override
	public String toString() {
		return "ChangePasswordVo [empName=" + empName + ", loginId=" + loginId + ", newPassword=" + newPassword + "]";
	}
	
	
}
