package com.douzone.quicksilver.vo;

import org.springframework.web.multipart.MultipartFile;

public class AddEmpVo {
	
	private String compSeq;
	private String loginId;
	private String emailId;
	private String korea;
	private String english;
	private String loginPwd;
	private String dept;
	private String deptSeq;
	private String bizSeq;
	private String task;
	private String emailAddr;
	private String positionSeq;
	private String dutySeq;
	private String compPhone;
	private String homePhone;
	private String phone;
	private String faxPhone;
	private String postNumber;
	private String addr;
	private String detailAddr;
	private String compPostNumber;
	private String compAddr;
	private String compDetailAddr;
	private String empBirth;
	private String empWedding;
	private String userDate;
	private String useYn;
	private String gender;
	private String workStatus;
	private MultipartFile file;
	private String picPath;
	private String langCode;
	private String empSeq;
	private int check;
	private String table;
	
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getDeptSeq() {
		return deptSeq;
	}
	public void setDeptSeq(String deptSeq) {
		this.deptSeq = deptSeq;
	}
	public String getBizSeq() {
		return bizSeq;
	}
	public void setBizSeq(String bizSeq) {
		this.bizSeq = bizSeq;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCompSeq() {
		return compSeq;
	}
	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getKorea() {
		return korea;
	}
	public void setKorea(String korea) {
		this.korea = korea;
	}
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getPositionSeq() {
		return positionSeq;
	}
	public void setPositionSeq(String positionSeq) {
		this.positionSeq = positionSeq;
	}
	public String getDutySeq() {
		return dutySeq;
	}
	public void setDutySeq(String dutySeq) {
		this.dutySeq = dutySeq;
	}
	public String getCompPhone() {
		return compPhone;
	}
	public void setCompPhone(String compPhone) {
		this.compPhone = compPhone;
	}
	public String getHomePhone() {
		return homePhone;
	}
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFaxPhone() {
		return faxPhone;
	}
	public void setFaxPhone(String faxPhone) {
		this.faxPhone = faxPhone;
	}
	public String getPostNumber() {
		return postNumber;
	}
	public void setPostNumber(String postNumber) {
		this.postNumber = postNumber;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getCompPostNumber() {
		return compPostNumber;
	}
	public void setCompPostNumber(String compPostNumber) {
		this.compPostNumber = compPostNumber;
	}
	public String getCompAddr() {
		return compAddr;
	}
	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}
	public String getCompDetailAddr() {
		return compDetailAddr;
	}
	public void setCompDetailAddr(String compDetailAddr) {
		this.compDetailAddr = compDetailAddr;
	}
	public String getEmpBirth() {
		return empBirth;
	}
	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}
	public String getEmpWedding() {
		return empWedding;
	}
	public void setEmpWedding(String empWedding) {
		this.empWedding = empWedding;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	@Override
	public String toString() {
		return "AddEmpVo [compSeq=" + compSeq + ", loginId=" + loginId + ", emailId=" + emailId + ", korea=" + korea
				+ ", english=" + english + ", loginPwd=" + loginPwd + ", dept=" + dept + ", deptSeq=" + deptSeq
				+ ", bizSeq=" + bizSeq + ", task=" + task + ", emailAddr=" + emailAddr + ", positionSeq=" + positionSeq
				+ ", dutySeq=" + dutySeq + ", compPhone=" + compPhone + ", homePhone=" + homePhone + ", phone=" + phone
				+ ", faxPhone=" + faxPhone + ", postNumber=" + postNumber + ", addr=" + addr + ", detailAddr="
				+ detailAddr + ", compPostNumber=" + compPostNumber + ", compAddr=" + compAddr + ", compDetailAddr="
				+ compDetailAddr + ", empBirth=" + empBirth + ", empWedding=" + empWedding + ", userDate=" + userDate
				+ ", useYn=" + useYn + ", gender=" + gender + ", workStatus=" + workStatus + ", file=" + file
				+ ", picPath=" + picPath + ", langCode=" + langCode + ", empSeq=" + empSeq + ", check=" + check
				+ ", table=" + table + "]";
	}
	
	

}
