package com.douzone.quicksilver.vo;

public class EmployeesVo {

	private Long no;  		   		// 번호
	private String name;       		// 이름
	private Long age;		   		// 나이
	private String gender;	   		// 성별 
	//private String grade;      	// 직급
	private Long departmentsNo; 	// 부서번호
	private String phone;      		// 전화번호
	private String address;			// 주소
	private String residentNum; 	// 주민번호
	private String profile;			// 프로필 사진
	private String email;			// 이메일
	private String hireDate;		// 입사일
	
	//조인 
	private String departments;      //부서이름
	private String company;          //모회사	
	private String masterGroup;      //모회사
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getAge() {
		return age;
	}
	public void setAge(Long age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Long getDepartmentsNo() {
		return departmentsNo;
	}
	public void setDepartmentsNo(Long departmentsNo) {
		this.departmentsNo = departmentsNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getResidentNum() {
		return residentNum;
	}
	public void setResidentNum(String residentNum) {
		this.residentNum = residentNum;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getDepartments() {
		return departments;
	}
	public void setDepartments(String departments) {
		this.departments = departments;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMasterGroup() {
		return masterGroup;
	}
	public void setMasterGroup(String masterGroup) {
		this.masterGroup = masterGroup;
	}
	@Override
	public String toString() {
		return "EmployeesVo [no=" + no + ", name=" + name + ", age=" + age + ", gender=" + gender + ", departmentsNo="
				+ departmentsNo + ", phone=" + phone + ", address=" + address + ", residentNum=" + residentNum
				+ ", profile=" + profile + ", email=" + email + ", hireDate=" + hireDate + ", departments="
				+ departments + ", company=" + company + ", masterGroup=" + masterGroup + "]";
	}
	
	
	
	
	
	

}
