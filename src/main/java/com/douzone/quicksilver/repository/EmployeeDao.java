package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DeptManagerVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public Long insert(EmployeesVo employeesVo) {
		System.out.println("employeesVo no : " + employeesVo.getNo());
		System.out.println(employeesVo);
		sqlSession.insert("employees.insert", employeesVo);
		
		if( employeesVo.getNo() != null) {
			return employeesVo.getNo();
		}
		
		return 1L;
	}
	
	public List<DeptManagerVo> get(EmployeesVo employeesVo) {
		return sqlSession.selectList("deptManager.get", employeesVo);
	}
	
	public void updateSalaryToDate(long no) {
		sqlSession.update("employees.updateSalaryToDate", no);
	}
	
	public void insertSalary(Map<String, Object> map) {
		sqlSession.insert("employees.insertSalary", map);
	}
	
	public void updateGradeToDate(long no) {
		sqlSession.update("employees.updateGradeToDate", no);
	}
	
	public void insertGrade(Map<String, Object> map) {
		sqlSession.insert("employees.insertGrade", map);
	}
	
	public void updateDeptToDate(long no) {
		sqlSession.update("employees.updateDeptToDate", no);
	}
	
	public void insertDept(Map<String, Object> map) {
		sqlSession.insert("employees.insertDept", map);
	}
}
