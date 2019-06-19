package com.douzone.quicksilver.vo;

public class UserVo {
	private String empSeq;
	private String id;
	private String password;
	private String role;
	
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserVo [empSeq=" + empSeq + ", id=" + id + ", password=" + password + ", role=" + role + "]";
	}
	
}
