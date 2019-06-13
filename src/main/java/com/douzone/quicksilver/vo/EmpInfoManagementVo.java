package com.douzone.quicksilver.vo;

public class EmpInfoManagementVo {

	private String compName;
	private String deptName;
	private String position;
	private String duty;
	private String empName;
	private String workStatus;
	private String useYn;
	private String license;
	private String kwd;
	private String emailAddr;
	
	
	
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getKwd() {
		return kwd;
	}
	public void setKwd(String kwd) {
		this.kwd = kwd;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	
	@Override
	public String toString() {
		return "EmpInfoManagementVo [compName=" + compName + ", deptName=" + deptName + ", position=" + position
				+ ", duty=" + duty + ", empName=" + empName + ", workStatus=" + workStatus + ", useYn=" + useYn
				+ ", license=" + license + ", kwd=" + kwd + ", emailAddr=" + emailAddr + "]";
	}
	
}
