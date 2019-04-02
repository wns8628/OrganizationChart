package com.douzone.quicksilver.vo;

public class MasterGroupVo {

	private int no;
	private String name;
	
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
	
	@Override
	public String toString() {
		return "MasterGroupVo [no=" + no + ", name=" + name + "]";
	}

}
