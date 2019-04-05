package com.douzone.quicksilver.vo;

public class EmployeesVo {

	private int no;  		   //번호
	private String name;       //이름
	private int age;		   //나이
	private String gender;	   //성별 
	private String grade;      //직급
	private int departmentsNo; //부서번호
	private String phone;      //전화번호
	
	//조인 
	private String departments;      //부서이름
	private String company;          //모회사	
	private String masterGroup;      //모회사
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDepartmentsNo() {
		return departmentsNo;
	}
	public void setDepartmentsNo(int departmentsNo) {
		this.departmentsNo = departmentsNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
		return "EmployeesVo [no=" + no + ", name=" + name + ", age=" + age + ", gender=" + gender + ", grade=" + grade
				+ ", departmentsNo=" + departmentsNo + ", phone=" + phone + ", departments=" + departments
				+ ", company=" + company + ", masterGroup=" + masterGroup + "]";
	}

}
