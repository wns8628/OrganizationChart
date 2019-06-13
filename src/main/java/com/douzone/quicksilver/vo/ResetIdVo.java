package com.douzone.quicksilver.vo;

public class ResetIdVo {

	private String previousLoginId;
	private String previousEmailAddr;
	private String nextLoginId;
	private String nextEmailAddr;
	
	public String getPreviousLoginId() {
		return previousLoginId;
	}
	public void setPreviousLoginId(String previousLoginId) {
		this.previousLoginId = previousLoginId;
	}
	public String getPreviousEmailAddr() {
		return previousEmailAddr;
	}
	public void setPreviousEmailAddr(String previousEmailAddr) {
		this.previousEmailAddr = previousEmailAddr;
	}
	public String getNextLoginId() {
		return nextLoginId;
	}
	public void setNextLoginId(String nextLoginId) {
		this.nextLoginId = nextLoginId;
	}
	public String getNextEmailAddr() {
		return nextEmailAddr;
	}
	public void setNextEmailAddr(String nextEmailAddr) {
		this.nextEmailAddr = nextEmailAddr;
	}
	@Override
	public String toString() {
		return "ResetIdVo [previousLoginId=" + previousLoginId + ", previousEmailAddr=" + previousEmailAddr
				+ ", nextLoginId=" + nextLoginId + ", nextEmailAddr=" + nextEmailAddr + "]";
	}
	
	
}
