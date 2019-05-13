package com.douzone.quicksilver.vo;

public class DepartmentsVo {
	
	/*
	 * t_co_dept
	 */
	
	private String deptSeq; 			// 부서 시퀀스
	private String deptCD; 				// 부서 코드
	private String groupSeq; 			// 그룹 시퀀스
	private String compSeq; 			// 회사 시퀀스
	private String bizSeq;				// 사업장 시퀀스
	private String parentDeptSeq; 		// 상위부서 시퀀스
	private String displayDeptSeq; 		// 상위부서 시퀀스(부서유형이 부서가 아닐경우)
	private String telNum; 				// 전화
	private String faxNum; 				// 팩스
	private String homepgAddr; 			// 홈페이지 주소
	private String zipCode; 			// 우편번호
	private String susinYn; 			// 수신여부
	private String virDeptYn; 			// 가상 부서여부
	private String teamYn; 				// 팀 부서여부
	private String nativeLangCode; 		// 주 사용언어
	private String path; 				// 부서 경로
	private Long pType; 				// 타입
	private Long deptLevel; 			// 부서 레벨
	private Long orderNum;				// 정렬 순서
	private String useYn;				// 사용 여부
	private String createSeq;			// 등록자 시퀀스
	private String dateTime;			// 등록일
	private String modifySeq;			// 수정자 시퀀스
	private String modifyDate;			// 수정일
	private String deptManager;			// 부서 관리자
	private String displayYn;			// 조직도 표시여부
	
	/*
	 * t_co_dept_multi
	 */
	
	private String langCode;			// 언어코드
	private String deptName;			// 부서명
	private String deptDisplayName;		// 부서 표시명
	private String senderName;			// 발신인명
	private String addr;				// 우편주소
	private String detail_addr;			// 상세주소
	private String pathName;			// 부서 경로명
	private String deptNickName;		// 부서 약칭
	
	private String bizName;		//전체부서보기할떄필요
	private int childCount;		// 자식 개수
	
	public String getDeptSeq() {
		return deptSeq;
	}

	public String getDeptCD() {
		return deptCD;
	}

	public String getGroupSeq() {
		return groupSeq;
	}

	public String getCompSeq() {
		return compSeq;
	}

	public String getBizSeq() {
		return bizSeq;
	}

	public String getParentDeptSeq() {
		return parentDeptSeq;
	}

	public String getDisplayDeptSeq() {
		return displayDeptSeq;
	}

	public String getTelNum() {
		return telNum;
	}

	public String getFaxNum() {
		return faxNum;
	}

	public String getHomepgAddr() {
		return homepgAddr;
	}

	public String getZipCode() {
		return zipCode;
	}

	public String getSusinYn() {
		return susinYn;
	}

	public String getVirDeptYn() {
		return virDeptYn;
	}

	public String getTeamYn() {
		return teamYn;
	}

	public String getNativeLangCode() {
		return nativeLangCode;
	}

	public String getPath() {
		return path;
	}

	public Long getpType() {
		return pType;
	}

	public Long getDeptLevel() {
		return deptLevel;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public String getUseYn() {
		return useYn;
	}

	public String getCreateSeq() {
		return createSeq;
	}

	public String getDateTime() {
		return dateTime;
	}

	public String getModifySeq() {
		return modifySeq;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public String getDeptManager() {
		return deptManager;
	}

	public String getDisplayYn() {
		return displayYn;
	}

	public String getLangCode() {
		return langCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public String getDeptDisplayName() {
		return deptDisplayName;
	}

	public String getSenderName() {
		return senderName;
	}

	public String getAddr() {
		return addr;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public String getPathName() {
		return pathName;
	}

	public String getDeptNickName() {
		return deptNickName;
	}

	public String getBizName() {
		return bizName;
	}

	public void setDeptSeq(String deptSeq) {
		this.deptSeq = deptSeq;
	}

	public void setDeptCD(String deptCD) {
		this.deptCD = deptCD;
	}

	public void setGroupSeq(String groupSeq) {
		this.groupSeq = groupSeq;
	}

	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}

	public void setBizSeq(String bizSeq) {
		this.bizSeq = bizSeq;
	}

	public void setParentDeptSeq(String parentDeptSeq) {
		this.parentDeptSeq = parentDeptSeq;
	}

	public void setDisplayDeptSeq(String displayDeptSeq) {
		this.displayDeptSeq = displayDeptSeq;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public void setFaxNum(String faxNum) {
		this.faxNum = faxNum;
	}

	public void setHomepgAddr(String homepgAddr) {
		this.homepgAddr = homepgAddr;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public void setSusinYn(String susinYn) {
		this.susinYn = susinYn;
	}

	public void setVirDeptYn(String virDeptYn) {
		this.virDeptYn = virDeptYn;
	}

	public void setTeamYn(String teamYn) {
		this.teamYn = teamYn;
	}

	public void setNativeLangCode(String nativeLangCode) {
		this.nativeLangCode = nativeLangCode;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setpType(Long pType) {
		this.pType = pType;
	}

	public void setDeptLevel(Long deptLevel) {
		this.deptLevel = deptLevel;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public void setCreateSeq(String createSeq) {
		this.createSeq = createSeq;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public void setModifySeq(String modifySeq) {
		this.modifySeq = modifySeq;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public void setDeptManager(String deptManager) {
		this.deptManager = deptManager;
	}

	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public void setDeptDisplayName(String deptDisplayName) {
		this.deptDisplayName = deptDisplayName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public void setPathName(String pathName) {
		this.pathName = pathName;
	}

	public void setDeptNickName(String deptNickName) {
		this.deptNickName = deptNickName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	
	public int getChildCount() {
		return childCount;
	}

	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}

	@Override
	public String toString() {
		return "DepartmentsVo [deptSeq=" + deptSeq + ", deptCD=" + deptCD + ", groupSeq=" + groupSeq + ", compSeq="
				+ compSeq + ", bizSeq=" + bizSeq + ", parentDeptSeq=" + parentDeptSeq + ", displayDeptSeq="
				+ displayDeptSeq + ", telNum=" + telNum + ", faxNum=" + faxNum + ", homepgAddr=" + homepgAddr
				+ ", zipCode=" + zipCode + ", susinYn=" + susinYn + ", virDeptYn=" + virDeptYn + ", teamYn=" + teamYn
				+ ", nativeLangCode=" + nativeLangCode + ", path=" + path + ", pType=" + pType + ", deptLevel="
				+ deptLevel + ", orderNum=" + orderNum + ", useYn=" + useYn + ", createSeq=" + createSeq + ", dateTime="
				+ dateTime + ", modifySeq=" + modifySeq + ", modifyDate=" + modifyDate + ", deptManager=" + deptManager
				+ ", displayYn=" + displayYn + ", langCode=" + langCode + ", deptName=" + deptName
				+ ", deptDisplayName=" + deptDisplayName + ", senderName=" + senderName + ", addr=" + addr
				+ ", detail_addr=" + detail_addr + ", pathName=" + pathName + ", deptNickName=" + deptNickName
				+ ", bizName=" + bizName + "]";
	}
	
	
	
}
