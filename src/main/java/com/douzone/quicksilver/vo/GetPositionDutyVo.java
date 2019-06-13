package com.douzone.quicksilver.vo;

public class GetPositionDutyVo {

	private String positionSeq;
	private String positionName;
	private String dutySeq;
	private String dutyName;
	
	public String getPositionSeq() {
		return positionSeq;
	}
	public void setPositionSeq(String positionSeq) {
		this.positionSeq = positionSeq;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getDutySeq() {
		return dutySeq;
	}
	public void setDutySeq(String dutySeq) {
		this.dutySeq = dutySeq;
	}
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	@Override
	public String toString() {
		return "GetPositionDutyVo [positionSeq=" + positionSeq + ", positionName=" + positionName + ", dutySeq="
				+ dutySeq + ", dutyName=" + dutyName + "]";
	}
	
	
}
