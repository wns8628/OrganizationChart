package com.douzone.quicksilver.vo;

public class EmployeesVo {

	private int no;  		   //번호
	private String profile;	   //프로필	
	private String name;       //이름
	private int age;		   //나이
	private String gender;	   //성별 
	private String grade;      //직급
	private String email;      //이메일
	private String phone;      //전화번호
	private String address;    //주소
	private String hire_date;  //고용일
	private int salary;		   //연봉
	private String departments;      //부서이름
	private String company;          //자회사	
	private String masterGroup;      //모회사
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
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
		return "EmployeesVo [no=" + no + ", profile=" + profile + ", name=" + name + ", age=" + age + ", gender="
				+ gender + ", grade=" + grade + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", hire_date=" + hire_date + ", salary=" + salary + ", departments=" + departments + ", company="
				+ company + ", masterGroup=" + masterGroup + "]";
	}
	
	
}
