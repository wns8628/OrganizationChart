package com.douzone.quicksilver.vo;

public class CompanyVo {

	private long no;
	private String name;
	private long groupNo;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(long groupNo) {
		this.groupNo = groupNo;
	}
	
	@Override
	public String toString() {
		return "CompanyVo [no=" + no + ", name=" + name + ", groupNo=" + groupNo + "]";
	}

}
