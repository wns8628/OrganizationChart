package com.douzone.quicksilver.vo;

public class AdminConnectDeptEmpVo {

	private String compSeq; 
	private String workingStatus; 
	private String kwd; 
	private String langCode;
	
	//로그인아디 이름결과받기 
	private String loginId;
	private String empName;
	
	//사원클릭시 결과받기 
	private String compName;
	private String deptName;
	private String mainDeptYn;
	private String positionCode;
	
	//디테일결과받기 
	private String empSeq;
	private String dutyCode;
	private String telNum;
	private String faxNum;
	private String checkWorkYn;
	private String workStatus;
	private String deptSeq;
	
	//직급,직책이름받기
	private String positionName;
	private String dutyName;
	
	private String bizName;
	
	//업데이트문안에 넣어야함 
	private String bizSeq;

	public String getCompSeq() {
		return compSeq;
	}

	public String getWorkingStatus() {
		return workingStatus;
	}

	public String getKwd() {
		return kwd;
	}

	public String getLangCode() {
		return langCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public String getEmpName() {
		return empName;
	}

	public String getCompName() {
		return compName;
	}

	public String getDeptName() {
		return deptName;
	}

	public String getMainDeptYn() {
		return mainDeptYn;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public String getEmpSeq() {
		return empSeq;
	}

	public String getDutyCode() {
		return dutyCode;
	}

	public String getTelNum() {
		return telNum;
	}

	public String getFaxNum() {
		return faxNum;
	}

	public String getCheckWorkYn() {
		return checkWorkYn;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public String getDeptSeq() {
		return deptSeq;
	}

	public String getPositionName() {
		return positionName;
	}

	public String getDutyName() {
		return dutyName;
	}

	public String getBizName() {
		return bizName;
	}

	public String getBizSeq() {
		return bizSeq;
	}

	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}

	public void setWorkingStatus(String workingStatus) {
		this.workingStatus = workingStatus;
	}

	public void setKwd(String kwd) {
		this.kwd = kwd;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public void setMainDeptYn(String mainDeptYn) {
		this.mainDeptYn = mainDeptYn;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}

	public void setDutyCode(String dutyCode) {
		this.dutyCode = dutyCode;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public void setFaxNum(String faxNum) {
		this.faxNum = faxNum;
	}

	public void setCheckWorkYn(String checkWorkYn) {
		this.checkWorkYn = checkWorkYn;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	public void setDeptSeq(String deptSeq) {
		this.deptSeq = deptSeq;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public void setBizSeq(String bizSeq) {
		this.bizSeq = bizSeq;
	}

	@Override
	public String toString() {
		return "AdminConnectDeptEmpVo [compSeq=" + compSeq + ", workingStatus=" + workingStatus + ", kwd=" + kwd
				+ ", langCode=" + langCode + ", loginId=" + loginId + ", empName=" + empName + ", compName=" + compName
				+ ", deptName=" + deptName + ", mainDeptYn=" + mainDeptYn + ", positionCode=" + positionCode
				+ ", empSeq=" + empSeq + ", dutyCode=" + dutyCode + ", telNum=" + telNum + ", faxNum=" + faxNum
				+ ", checkWorkYn=" + checkWorkYn + ", workStatus=" + workStatus + ", deptSeq=" + deptSeq
				+ ", positionName=" + positionName + ", dutyName=" + dutyName + ", bizName=" + bizName + ", bizSeq="
				+ bizSeq + "]";
	}

	
	
}
