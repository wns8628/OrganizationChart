package com.douzone.quicksilver.vo;

public class DutyPositionVo {

	/*
	 *	t_co_comp_duty_position 
	 */
	
	private String dpSeq;			// 직책직급 시퀀스	
	private String dpType;			// DUTY: 직책, POSITION: 직급
	private String groupSeq;		// 그룹 시퀀스
	private String compSeq;			// 회사 시퀀스
	private String useYn;			// 사용여부 (Y/N)
	private String orderNum;		// 정렬순서
	private String createSeq;		// 등록자
	private String createDate;		// 등록일
	private String modifySeq;		// 수정자
	private String modifyDate;		// 수정일
	
	/*
	 *  t_co_comp_duty_position_multi
	 */
	
	private String langCode;		// 다국어 코드
	private String dpName;			// 직급명, 직책명
	private String descText;		// 설명
	private String commentText;		// 비고
	public String getDpSeq() {
		return dpSeq;
	}
	public void setDpSeq(String dpSeq) {
		this.dpSeq = dpSeq;
	}
	public String getDpType() {
		return dpType;
	}
	public void setDpType(String dpType) {
		this.dpType = dpType;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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
	public String getDpName() {
		return dpName;
	}
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	public String getDescText() {
		return descText;
	}
	public void setDescText(String descText) {
		this.descText = descText;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	@Override
	public String toString() {
		return "DutyPositionVo [dpSeq=" + dpSeq + ", dpType=" + dpType + ", groupSeq=" + groupSeq + ", compSeq="
				+ compSeq + ", useYn=" + useYn + ", orderNum=" + orderNum + ", createSeq=" + createSeq + ", createDate="
				+ createDate + ", modifySeq=" + modifySeq + ", modifyDate=" + modifyDate + ", langCode=" + langCode
				+ ", dpName=" + dpName + ", descText=" + descText + ", commentText=" + commentText + "]";
	}
	
	
}
