package com.douzone.quicksilver.vo;

public class EmployeeDeptInfoVo {

	/*
	 * t_co_emp_dept
	 */
	
	private String deptSeq;				// 부서 시퀀스
	private String empSeq;				// 사용자 시퀀스
	private String groupSeq;			// 그룹 시퀀스
	private String compSeq;				// 회사 시퀀스
	private String bizSeq;				// 사업장 시퀀스
	private String mainDeptYn;			// 주 부서 여부
	private String dutyCode;			// 직책
	private String positionCode;		// 직급
	private String telNum;				// 사무실 전화
	private String faxNum;				// 팩스 번호
	private String zipCode;				// 우편 번호
	private String orgchartDisplayYn;	// 조직도 표시여부
	private String messengerDisplayYn;	// 메신저 표시여부
	private Long orderNum;				// 정렬 순서
	private String orderText;			// 사용자 정렬 텍스트
	private String useYn;				// 사용 여부
	private String createSeq;			// 등록자 시퀀스
	private String createDate;			// 등록일
	private String modifySeq;			// 수정자 시퀀스
	private String modifyDate;			// 수정일
	
	/*
	 * t_co_emp_dept_multi
	 */
	
	private String langCode;			// 언어 코드
	private String addr;				// 우편주소
	private String detailAddr;			// 상세주소
	
	public String getDeptSeq() {
		return deptSeq;
	}
	public void setDeptSeq(String deptSeq) {
		this.deptSeq = deptSeq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(String groupSeq) {
		this.groupSeq = groupSeq;
	}
	public String getCompSeq() {
		return compSeq;
	}
	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}
	public String getBizSeq() {
		return bizSeq;
	}
	public void setBizSeq(String bizSeq) {
		this.bizSeq = bizSeq;
	}
	public String getMainDeptYn() {
		return mainDeptYn;
	}
	public void setMainDeptYn(String mainDeptYn) {
		this.mainDeptYn = mainDeptYn;
	}
	public String getDutyCode() {
		return dutyCode;
	}
	public void setDutyCode(String dutyCode) {
		this.dutyCode = dutyCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
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
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getOrgchartDisplayYn() {
		return orgchartDisplayYn;
	}
	public void setOrgchartDisplayYn(String orgchartDisplayYn) {
		this.orgchartDisplayYn = orgchartDisplayYn;
	}
	public String getMessengerDisplayYn() {
		return messengerDisplayYn;
	}
	public void setMessengerDisplayYn(String messengerDisplayYn) {
		this.messengerDisplayYn = messengerDisplayYn;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderText() {
		return orderText;
	}
	public void setOrderText(String orderText) {
		this.orderText = orderText;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getModifySeq() {
		return modifySeq;
	}
	public void setModifySeq(String modifySeq) {
		this.modifySeq = modifySeq;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
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
	@Override
	public String toString() {
		return "EmployeeDeptInfoVo [deptSeq=" + deptSeq + ", empSeq=" + empSeq + ", groupSeq=" + groupSeq + ", compSeq="
				+ compSeq + ", bizSeq=" + bizSeq + ", mainDeptYn=" + mainDeptYn + ", dutyCode=" + dutyCode
				+ ", positionCode=" + positionCode + ", telNum=" + telNum + ", faxNum=" + faxNum + ", zipCode="
				+ zipCode + ", orgchartDisplayYn=" + orgchartDisplayYn + ", messengerDisplayYn=" + messengerDisplayYn
				+ ", orderNum=" + orderNum + ", orderText=" + orderText + ", useYn=" + useYn + ", createSeq="
				+ createSeq + ", createDate=" + createDate + ", modifySeq=" + modifySeq + ", modifyDate=" + modifyDate
				+ ", langCode=" + langCode + ", addr=" + addr + ", detailAddr=" + detailAddr + "]";
	}
	
	
	
}
