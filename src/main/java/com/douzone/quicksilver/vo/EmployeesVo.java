package com.douzone.quicksilver.vo;

public class EmployeesVo {
	
	/*
	 * t_co_emp
	 */
	
	private String empSeq; 					// 사용자 시퀀스
	private String groupSeq;				// 그룹 시퀀스 or 그룹명
	private String loginId;					// 로그인 아이디
	private String empNum;					// 사번
	private String erpEmpNum;				// erp 사번
	private String emailAddr;				// 이메일
	private String outMail;					// 외부메일 계정
	private String outDomain;				// 외부메일 도메인
	private String loginPassword;			// 로그인 패스워드 
	private String apprPassword;			// 전자결제 패스워드
	private String passwdDate;				// 패스워드 변경일자
	private String passwdInputFailCount;	// 패스워드 입력실패 카운트
	private String payPasswd;				// 급여명세 패스워드
	private String passwdStatusCode;		// 패스워드 상태
	private String mobileUseYn;				// 모바일 사용여부
	private String messangerUseYn;			// 메신저 사용여부
	private String checkWorkYn;				// 근태적용 여부
	private String shift;					// 근무조
	private String jobCode;					// 직무
	private String statusCode;				// 고용형태
	private String mainCompSeq;				// 주 회사 시퀀스 or 회사명
	private String mainCompLoginYn;			// 기본로그인회사 사용여부
	private String dutyCode;				// 직책
	private String positionCode;			// 직급
	private String nativeLangCode;			// 주 사용언어
	private String licenceCheckYn;			// 라이센스 체크여부
	private String joinDay;					// 입사일
	private String resignDay;				// 퇴사일
	private String genderCode;				// 성별 코드
	private String bDay;					// 생일
	private String lunarYn;					// 생일 구분
	private String workStatus;				// 재직 구분
	private String homeTelNum;				// 집 전화번호
	private String mobileTelNum;			// 폰번호
	private String weddingYn;				// 결혼 유무
	private String weddingDay;				// 결혼 기념일
	private String privateYn;				// 공개 / 비공개
	private String zipCode;					// 우편번호
	private String picFileID;				// 사진 파일명
	private String signFileID;				// 사인 파일명
	private String useYn;					// 사용 여부
	private String lsRoleID;				// 결제 Role
	private String createSeq;				// 등록자 시퀀스
	private String createDate;				// 등록일
	private String modifySeq;				// 수정자 시퀀스
	private String modifyDate;				// 수정일
	private String springSecu;				// 로그인 유효성체크 암호
	private String springDate;				// 로그인 유효성체크 시간
	private String signType;				// 사인이미지 선택값
	
	/*
	 *  t_co_emp_multi
	 */
	
	private String empName;					// 사용자 명
	private String addr;					// 우편 주소
	private String detailAddr;				// 상세 주소
	private String mainWork;				// 담당 업무
	
	private String deptName;				// 부서명
	private String deptSeq;				// 부서번호
	private String deptNameEn;
	private String empNameEn;
	/*
	 * 상세한 직원정보를 위한 필드
	 */
	
	private Long age; 						// 나이
	private String bizName;					// 사업장 명
	private String langCode;				// 언어 코드
	private String faxNum;					// 부서팩스
	private String compName;				// 회사명
	private String compDomain;				// 홈피주소 
	private String compEmail;				// 회사메일
	private String compSeq;
	
	private String dutyCodeName;
	private String positionCodeName;
	
	public String getDutyCodeName() {
		return dutyCodeName;
	}
	public void setDutyCodeName(String dutyCodeName) {
		this.dutyCodeName = dutyCodeName;
	}
	public String getPositionCodeName() {
		return positionCodeName;
	}
	public void setPositionCodeName(String positionCodeName) {
		this.positionCodeName = positionCodeName;
	}
	public String getDeptNameEn() {
		return deptNameEn;
	}
	public void setDeptNameEn(String deptNameEn) {
		this.deptNameEn = deptNameEn;
	}
	public String getCompSeq() {
		return compSeq;
	}
	public void setCompSeq(String compSeq) {
		this.compSeq = compSeq;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public String getGroupSeq() {
		return groupSeq;
	}
	public String getLoginId() {
		return loginId;
	}
	public String getEmpNum() {
		return empNum;
	}
	public String getErpEmpNum() {
		return erpEmpNum;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public String getOutMail() {
		return outMail;
	}
	public String getOutDomain() {
		return outDomain;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public String getApprPassword() {
		return apprPassword;
	}
	public String getPasswdDate() {
		return passwdDate;
	}
	public String getPasswdInputFailCount() {
		return passwdInputFailCount;
	}
	public String getPayPasswd() {
		return payPasswd;
	}
	public String getPasswdStatusCode() {
		return passwdStatusCode;
	}
	public String getMobileUseYn() {
		return mobileUseYn;
	}
	public String getMessangerUseYn() {
		return messangerUseYn;
	}
	public String getCheckWorkYn() {
		return checkWorkYn;
	}
	public String getShift() {
		return shift;
	}
	public String getJobCode() {
		return jobCode;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public String getMainCompSeq() {
		return mainCompSeq;
	}
	public String getMainCompLoginYn() {
		return mainCompLoginYn;
	}
	public String getDutyCode() {
		return dutyCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public String getNativeLangCode() {
		return nativeLangCode;
	}
	public String getLicenceCheckYn() {
		return licenceCheckYn;
	}
	public String getJoinDay() {
		return joinDay;
	}
	public String getResignDay() {
		return resignDay;
	}
	public String getGenderCode() {
		return genderCode;
	}
	public String getbDay() {
		return bDay;
	}
	public String getLunarYn() {
		return lunarYn;
	}
	public String getWorkStatus() {
		return workStatus;
	}
	public String getHomeTelNum() {
		return homeTelNum;
	}
	public String getMobileTelNum() {
		return mobileTelNum;
	}
	public String getWeddingYn() {
		return weddingYn;
	}
	public String getWeddingDay() {
		return weddingDay;
	}
	public String getPrivateYn() {
		return privateYn;
	}
	public String getZipCode() {
		return zipCode;
	}
	public String getPicFileID() {
		return picFileID;
	}
	public String getSignFileID() {
		return signFileID;
	}
	public String getUseYn() {
		return useYn;
	}
	public String getLsRoleID() {
		return lsRoleID;
	}
	public String getCreateSeq() {
		return createSeq;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getModifySeq() {
		return modifySeq;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public String getSpringSecu() {
		return springSecu;
	}
	public String getSpringDate() {
		return springDate;
	}
	public String getSignType() {
		return signType;
	}
	public String getEmpName() {
		return empName;
	}
	public String getAddr() {
		return addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public String getMainWork() {
		return mainWork;
	}
	public String getDeptName() {
		return deptName;
	}
	public String getDeptSeq() {
		return deptSeq;
	}
	public Long getAge() {
		return age;
	}
	public String getBizName() {
		return bizName;
	}
	public String getLangCode() {
		return langCode;
	}
	public String getFaxNum() {
		return faxNum;
	}
	public String getCompName() {
		return compName;
	}
	public String getCompDomain() {
		return compDomain;
	}
	public String getCompEmail() {
		return compEmail;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public void setGroupSeq(String groupSeq) {
		this.groupSeq = groupSeq;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public void setErpEmpNum(String erpEmpNum) {
		this.erpEmpNum = erpEmpNum;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public void setOutMail(String outMail) {
		this.outMail = outMail;
	}
	public void setOutDomain(String outDomain) {
		this.outDomain = outDomain;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public void setApprPassword(String apprPassword) {
		this.apprPassword = apprPassword;
	}
	public void setPasswdDate(String passwdDate) {
		this.passwdDate = passwdDate;
	}
	public void setPasswdInputFailCount(String passwdInputFailCount) {
		this.passwdInputFailCount = passwdInputFailCount;
	}
	public void setPayPasswd(String payPasswd) {
		this.payPasswd = payPasswd;
	}
	public void setPasswdStatusCode(String passwdStatusCode) {
		this.passwdStatusCode = passwdStatusCode;
	}
	public void setMobileUseYn(String mobileUseYn) {
		this.mobileUseYn = mobileUseYn;
	}
	public void setMessangerUseYn(String messangerUseYn) {
		this.messangerUseYn = messangerUseYn;
	}
	public void setCheckWorkYn(String checkWorkYn) {
		this.checkWorkYn = checkWorkYn;
	}
	public void setShift(String shift) {
		this.shift = shift;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public void setMainCompSeq(String mainCompSeq) {
		this.mainCompSeq = mainCompSeq;
	}
	public void setMainCompLoginYn(String mainCompLoginYn) {
		this.mainCompLoginYn = mainCompLoginYn;
	}
	public void setDutyCode(String dutyCode) {
		this.dutyCode = dutyCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public void setNativeLangCode(String nativeLangCode) {
		this.nativeLangCode = nativeLangCode;
	}
	public void setLicenceCheckYn(String licenceCheckYn) {
		this.licenceCheckYn = licenceCheckYn;
	}
	public void setJoinDay(String joinDay) {
		this.joinDay = joinDay;
	}
	public void setResignDay(String resignDay) {
		this.resignDay = resignDay;
	}
	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}
	public void setbDay(String bDay) {
		this.bDay = bDay;
	}
	public void setLunarYn(String lunarYn) {
		this.lunarYn = lunarYn;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	public void setHomeTelNum(String homeTelNum) {
		this.homeTelNum = homeTelNum;
	}
	public void setMobileTelNum(String mobileTelNum) {
		this.mobileTelNum = mobileTelNum;
	}
	public void setWeddingYn(String weddingYn) {
		this.weddingYn = weddingYn;
	}
	public void setWeddingDay(String weddingDay) {
		this.weddingDay = weddingDay;
	}
	public void setPrivateYn(String privateYn) {
		this.privateYn = privateYn;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public void setPicFileID(String picFileID) {
		this.picFileID = picFileID;
	}
	public void setSignFileID(String signFileID) {
		this.signFileID = signFileID;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public void setLsRoleID(String lsRoleID) {
		this.lsRoleID = lsRoleID;
	}
	public void setCreateSeq(String createSeq) {
		this.createSeq = createSeq;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setModifySeq(String modifySeq) {
		this.modifySeq = modifySeq;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public void setSpringSecu(String springSecu) {
		this.springSecu = springSecu;
	}
	public void setSpringDate(String springDate) {
		this.springDate = springDate;
	}
	public void setSignType(String signType) {
		this.signType = signType;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public void setMainWork(String mainWork) {
		this.mainWork = mainWork;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public void setDeptSeq(String deptSeq) {
		this.deptSeq = deptSeq;
	}
	public void setAge(Long age) {
		this.age = age;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	public void setFaxNum(String faxNum) {
		this.faxNum = faxNum;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public void setCompDomain(String compDomain) {
		this.compDomain = compDomain;
	}
	public void setCompEmail(String compEmail) {
		this.compEmail = compEmail;
	}
	
	public String getEmpNameEn() {
		return empNameEn;
	}
	public void setEmpNameEn(String empNameEn) {
		this.empNameEn = empNameEn;
	}
	@Override
	public String toString() {
		return "EmployeesVo [empSeq=" + empSeq + ", groupSeq=" + groupSeq + ", loginId=" + loginId + ", empNum="
				+ empNum + ", erpEmpNum=" + erpEmpNum + ", emailAddr=" + emailAddr + ", outMail=" + outMail
				+ ", outDomain=" + outDomain + ", loginPassword=" + loginPassword + ", apprPassword=" + apprPassword
				+ ", passwdDate=" + passwdDate + ", passwdInputFailCount=" + passwdInputFailCount + ", payPasswd="
				+ payPasswd + ", passwdStatusCode=" + passwdStatusCode + ", mobileUseYn=" + mobileUseYn
				+ ", messangerUseYn=" + messangerUseYn + ", checkWorkYn=" + checkWorkYn + ", shift=" + shift
				+ ", jobCode=" + jobCode + ", statusCode=" + statusCode + ", mainCompSeq=" + mainCompSeq
				+ ", mainCompLoginYn=" + mainCompLoginYn + ", dutyCode=" + dutyCode + ", positionCode=" + positionCode
				+ ", nativeLangCode=" + nativeLangCode + ", licenceCheckYn=" + licenceCheckYn + ", joinDay=" + joinDay
				+ ", resignDay=" + resignDay + ", genderCode=" + genderCode + ", bDay=" + bDay + ", lunarYn=" + lunarYn
				+ ", workStatus=" + workStatus + ", homeTelNum=" + homeTelNum + ", mobileTelNum=" + mobileTelNum
				+ ", weddingYn=" + weddingYn + ", weddingDay=" + weddingDay + ", privateYn=" + privateYn + ", zipCode="
				+ zipCode + ", picFileID=" + picFileID + ", signFileID=" + signFileID + ", useYn=" + useYn
				+ ", lsRoleID=" + lsRoleID + ", createSeq=" + createSeq + ", createDate=" + createDate + ", modifySeq="
				+ modifySeq + ", modifyDate=" + modifyDate + ", springSecu=" + springSecu + ", springDate=" + springDate
				+ ", signType=" + signType + ", empName=" + empName + ", addr=" + addr + ", detailAddr=" + detailAddr
				+ ", mainWork=" + mainWork + ", deptName=" + deptName + ", deptSeq=" + deptSeq + ", deptNameEn="
				+ deptNameEn + ", empNameEn=" + empNameEn + ", age=" + age + ", bizName=" + bizName + ", langCode="
				+ langCode + ", faxNum=" + faxNum + ", compName=" + compName + ", compDomain=" + compDomain
				+ ", compEmail=" + compEmail + ", compSeq=" + compSeq + ", dutyCodeName=" + dutyCodeName
				+ ", positionCodeName=" + positionCodeName + "]";
	}
	
	
}
