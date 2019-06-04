package com.douzone.quicksilver.vo;


public class MovePersonnelStatusVo {

	 private String	regDate;
	 private String compName;
	 private String empName;
	 private String workStatus;
	 private String nextDeptName;
	 private String nextDutyName;
	 private String nextPositionName;
	 private String previousDeptName;
	 private String previousDutyName;
	 private String previousPositionName;
	 private String mainDeptYn;
	 private String startDate;
	 private String endDate;
	 
	 
	@Override
	public String toString() {
		return "movePersonnelStatusVo [regDate=" + regDate + ", compName=" + compName + ", empName=" + empName
				+ ", workStatus=" + workStatus + ", nextDeptName=" + nextDeptName + ", nextDutyName=" + nextDutyName
				+ ", nextPositionName=" + nextPositionName + ", previousDeptName=" + previousDeptName
				+ ", previousDutyName=" + previousDutyName + ", previousPositionName=" + previousPositionName
				+ ", mainDeptYn=" + mainDeptYn + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	public String getNextDeptName() {
		return nextDeptName;
	}
	public void setNextDeptName(String nextDeptName) {
		this.nextDeptName = nextDeptName;
	}
	public String getNextDutyName() {
		return nextDutyName;
	}
	public void setNextDutyName(String nextDutyName) {
		this.nextDutyName = nextDutyName;
	}
	public String getNextPositionName() {
		return nextPositionName;
	}
	public void setNextPositionName(String nextPositionName) {
		this.nextPositionName = nextPositionName;
	}
	public String getPreviousDeptName() {
		return previousDeptName;
	}
	public void setPreviousDeptName(String previousDeptName) {
		this.previousDeptName = previousDeptName;
	}
	public String getPreviousDutyName() {
		return previousDutyName;
	}
	public void setPreviousDutyName(String previousDutyName) {
		this.previousDutyName = previousDutyName;
	}
	public String getPreviousPositionName() {
		return previousPositionName;
	}
	public void setPreviousPositionName(String previousPositionName) {
		this.previousPositionName = previousPositionName;
	}
	public String getMainDeptYn() {
		return mainDeptYn;
	}
	public void setMainDeptYn(String mainDeptYn) {
		this.mainDeptYn = mainDeptYn;
	}
	 
	 
}
