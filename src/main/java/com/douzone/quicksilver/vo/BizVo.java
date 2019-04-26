package com.douzone.quicksilver.vo;

public class BizVo {
	private String bizSeq;			//사업장시퀀스
	private String bizCd;			//사업장별칭
	private String groupSeq;		//그룹시퀀스
	private String compSeq;			//회사시퀀스
	private String compRegistNum;	//사업자번호
	private String compNum;			//법인번호
	private String telNum;			//전화
	private String faxNum;			//팩스
	private String homepgAddr;		//홈페이지주소
	private String zipCode;			//우편번호
	private String displayYn;		//기본사업장여부
	private String nativeLangCode;	//주사용언어
	private String orderNum;		//정렬순서
	private String useYn;			//사용여부
	private String sealFileId;		//인감파일ID
	private String createSeq;		//등록자시퀀스
	private String createDate;		//등록일
	private String modifySeq;		//수정자시퀀스
	private String modifyDate;		//수정일
	private String langCode;		//언어코드
	private String bizName;			//사업장명
	private String ownerName;		//대표자명
	private String bizCondition;	//업태
	private String senderName;		//발신인명
	private String bizNickname;		//사업장약칭
	private String item;			//종목
	private String addr;			//우편주소
	private String detailAddr;		//상세주소
	public String getBizSeq() {
		return bizSeq;
	}
	public void setBizSeq(String bizSeq) {
		this.bizSeq = bizSeq;
	}
	public String getBizCd() {
		return bizCd;
	}
	public void setBizCd(String bizCd) {
		this.bizCd = bizCd;
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
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getDisplayYn() {
		return displayYn;
	}
	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}
	public String getNativeLangCode() {
		return nativeLangCode;
	}
	public void setNativeLangCode(String nativeLangCode) {
		this.nativeLangCode = nativeLangCode;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getSealFileId() {
		return sealFileId;
	}
	public void setSealFileId(String sealFileId) {
		this.sealFileId = sealFileId;
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
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getBizCondition() {
		return bizCondition;
	}
	public void setBizCondition(String bizCondition) {
		this.bizCondition = bizCondition;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getBizNickname() {
		return bizNickname;
	}
	public void setBizNickname(String bizNickname) {
		this.bizNickname = bizNickname;
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
	@Override
	public String toString() {
		return "BizVo [bizSeq=" + bizSeq + ", bizName=" + bizName + "]";
	}
	
}
