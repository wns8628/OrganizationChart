package com.douzone.quicksilver.vo;

public class CompanyVo {

	private int no;
	private String name;
	private int groupNo;
	
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
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	
	@Override
	public String toString() {
		return "CompanyVo [no=" + no + ", name=" + name + ", groupNo=" + groupNo + "]";
	}

}
