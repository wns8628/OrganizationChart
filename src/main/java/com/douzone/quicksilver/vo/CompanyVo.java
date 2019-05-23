package com.douzone.quicksilver.vo;

import java.math.BigDecimal;

public class CompanyVo {

	private String compSeq;
	private String groupSeq;
	private String compCd;
	private String parentCompSeq;
	private String loginType;
	private String compRegistNum;
	private String compNum;
	private String standardCode;
	private String erpUse;
	private String telNum;
	private String faxNum;
	private String homepgAddr;
	private String CompMailUrl;
	private String compDomain;
	private String emailAddr;
	private String emailDomain;
	private String zipCode;
	private String smsUse;
	private String smsId;
	private String smsPasswd;
	private String nativeLangCode;
	private BigDecimal orderNum;
	private String useYn;
	private String eaType;
	private String createSeq;
	private String createDate;
	private String modifySeq;
	private String modifyDate;
	private String compEmailYn;
	private String erpUseYn;
	private String smsUseYn;
	private String langCode;
	private String compName;
	private String ownerName;
	private String senderName;
	private String bizCondition;
	private String item;
	private String addr;
	private String detailAddr;
	private String compNameEn;
	private String compNickname;
	private String opCode;
	
	private int compEmpCount;

	//
	//회사에 대한 정보들
	private String totalEmp;
	private String totalBiz;
	private String totalDept;
	private int age10;
	private int age20;
	private int age30;
	private int age40;
	private int age50;
	private int age60;
	//
	
	//
	private String positionCode;
	private String positionCodeName;
	
	
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getPositionCodeName() {
		return positionCodeName;
	}
	public void setPositionCodeName(String positionCodeName) {
		this.positionCodeName = positionCodeName;
	}
	public String getCompSeq() {
		return compSeq;
	}
	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}
	public String getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(String groupSeq) {
		this.groupSeq = groupSeq;
	}
	public String getCompCd() {
		return compCd;
	}
	public void setCompCd(String compCd) {
		this.compCd = compCd;
	}
	public String getParentCompSeq() {
		return parentCompSeq;
	}
	public void setParentCompSeq(String parentCompSeq) {
		this.parentCompSeq = parentCompSeq;
	}
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	public String getCompRegistNum() {
		return compRegistNum;
	}
	public void setCompRegistNum(String compRegistNum) {
		this.compRegistNum = compRegistNum;
	}
	public String getCompNum() {
		return compNum;
	}
	public void setCompNum(String compNum) {
		this.compNum = compNum;
	}
	public String getStandardCode() {
		return standardCode;
	}
	public void setStandardCode(String standardCode) {
		this.standardCode = standardCode;
	}
	public String getErpUse() {
		return erpUse;
	}
	public void setErpUse(String erpUse) {
		this.erpUse = erpUse;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public String getFaxNum() {
		return faxNum;
	}
	public void setFaxNum(String faxNum) {
		this.faxNum = faxNum;
	}
	public String getHomepgAddr() {
		return homepgAddr;
	}
	public void setHomepgAddr(String homepgAddr) {
		this.homepgAddr = homepgAddr;
	}
	public String getCompMailUrl() {
		return CompMailUrl;
	}
	public void setCompMailUrl(String compMailUrl) {
		CompMailUrl = compMailUrl;
	}
	public String getCompDomain() {
		return compDomain;
	}
	public void setCompDomain(String compDomain) {
		this.compDomain = compDomain;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getSmsUse() {
		return smsUse;
	}
	public void setSmsUse(String smsUse) {
		this.smsUse = smsUse;
	}
	public String getSmsId() {
		return smsId;
	}
	public void setSmsId(String smsId) {
		this.smsId = smsId;
	}
	public String getSmsPasswd() {
		return smsPasswd;
	}
	public void setSmsPasswd(String smsPasswd) {
		this.smsPasswd = smsPasswd;
	}
	public String getNativeLangCode() {
		return nativeLangCode;
	}
	public void setNativeLangCode(String nativeLangCode) {
		this.nativeLangCode = nativeLangCode;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getEaType() {
		return eaType;
	}
	public void setEaType(String eaType) {
		this.eaType = eaType;
	}
	public String getCreateSeq() {
		return createSeq;
	}
	public void setCreateSeq(String createSeq) {
		this.createSeq = createSeq;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getCompEmailYn() {
		return compEmailYn;
	}
	public void setCompEmailYn(String compEmailYn) {
		this.compEmailYn = compEmailYn;
	}
	public String getErpUseYn() {
		return erpUseYn;
	}
	public void setErpUseYn(String erpUseYn) {
		this.erpUseYn = erpUseYn;
	}
	public String getSmsUseYn() {
		return smsUseYn;
	}
	public void setSmsUseYn(String smsUseYn) {
		this.smsUseYn = smsUseYn;
	}
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getBizCondition() {
		return bizCondition;
	}
	public void setBizCondition(String bizCondition) {
		this.bizCondition = bizCondition;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
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
	public String getCompNameEn() {
		return compNameEn;
	}
	public void setCompNameEn(String compNameEn) {
		this.compNameEn = compNameEn;
	}
	public int getCompEmpCount() {
		return compEmpCount;
	}
	public void setCompEmpCount(int compEmpCount) {
		this.compEmpCount = compEmpCount;
	}
	public String getTotalEmp() {
		return totalEmp;
	}
	public void setTotalEmp(String totalEmp) {
		this.totalEmp = totalEmp;
	}
	public String getTotalBiz() {
		return totalBiz;
	}
	public void setTotalBiz(String totalBiz) {
		this.totalBiz = totalBiz;
	}
	public String getTotalDept() {
		return totalDept;
	}
	public void setTotalDept(String totalDept) {
		this.totalDept = totalDept;
	}
	public int getAge10() {
		return age10;
	}
	public void setAge10(int age10) {
		this.age10 = age10;
	}
	public int getAge20() {
		return age20;
	}
	public void setAge20(int age20) {
		this.age20 = age20;
	}
	public int getAge30() {
		return age30;
	}
	public void setAge30(int age30) {
		this.age30 = age30;
	}
	public int getAge40() {
		return age40;
	}
	public void setAge40(int age40) {
		this.age40 = age40;
	}
	public int getAge50() {
		return age50;
	}
	public void setAge50(int age50) {
		this.age50 = age50;
	}
	public int getAge60() {
		return age60;
	}
	public void setAge60(int age60) {
		this.age60 = age60;
	}
	public BigDecimal getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(BigDecimal orderNum) {
		this.orderNum = orderNum;
	}
	
	public String getCompNickname() {
		return compNickname;
	}
	public void setCompNickname(String compNickname) {
		this.compNickname = compNickname;
	}
	public String getOpCode() {
		return opCode;
	}
	public void setOpCode(String opCode) {
		this.opCode = opCode;
	}
	
	public String getModifySeq() {
		return modifySeq;
	}
	public void setModifySeq(String modifySeq) {
		this.modifySeq = modifySeq;
	}
	@Override
	public String toString() {
		return "CompanyVo [compSeq=" + compSeq + ", groupSeq=" + groupSeq + ", compCd=" + compCd + ", parentCompSeq="
				+ parentCompSeq + ", loginType=" + loginType + ", compRegistNum=" + compRegistNum + ", compNum="
				+ compNum + ", standardCode=" + standardCode + ", erpUse=" + erpUse + ", telNum=" + telNum + ", faxNum="
				+ faxNum + ", homepgAddr=" + homepgAddr + ", CompMailUrl=" + CompMailUrl + ", compDomain=" + compDomain
				+ ", emailAddr=" + emailAddr + ", emailDomain=" + emailDomain + ", zipCode=" + zipCode + ", smsUse="
				+ smsUse + ", smsId=" + smsId + ", smsPasswd=" + smsPasswd + ", nativeLangCode=" + nativeLangCode
				+ ", orderNum=" + orderNum + ", useYn=" + useYn + ", eaType=" + eaType + ", createSeq=" + createSeq
				+ ", createDate=" + createDate + ", modifySeq=" + modifySeq + ", modifyDate=" + modifyDate
				+ ", compEmailYn=" + compEmailYn + ", erpUseYn=" + erpUseYn + ", smsUseYn=" + smsUseYn + ", langCode="
				+ langCode + ", compName=" + compName + ", ownerName=" + ownerName + ", senderName=" + senderName
				+ ", bizCondition=" + bizCondition + ", item=" + item + ", addr=" + addr + ", detailAddr=" + detailAddr
				+ ", compNameEn=" + compNameEn + ", compNickname=" + compNickname + ", opCode=" + opCode
				+ ", compEmpCount=" + compEmpCount + ", totalEmp=" + totalEmp + ", totalBiz=" + totalBiz
				+ ", totalDept=" + totalDept + ", age10=" + age10 + ", age20=" + age20 + ", age30=" + age30 + ", age40="
				+ age40 + ", age50=" + age50 + ", age60=" + age60 + ", positionCode=" + positionCode
				+ ", positionCodeName=" + positionCodeName + "]";
	}

	
	
}