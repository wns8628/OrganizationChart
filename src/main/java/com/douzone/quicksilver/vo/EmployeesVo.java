package com.douzone.quicksilver.vo;

public class EmployeesVo {

	private int no;
	private String grade;
	private String name;
	private int age;
	private String gender;
	private int departmentsNo;
	
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
	
	@Override
	public String toString() {
		return "EmployeesVo [no=" + no + ", grade=" + grade + ", name=" + name + ", age=" + age + ", gender=" + gender
				+ ", departmentsNo=" + departmentsNo + "]";
	}
	
}
