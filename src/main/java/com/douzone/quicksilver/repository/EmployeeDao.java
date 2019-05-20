package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.DutyPositionVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(EmployeesVo employeesVo) {
		System.out.println(employeesVo);
		return sqlSession.insert("employees.insert", employeesVo);
	}
	
//	public List<DeptManagerVo> get(EmployeesVo employeesVo) {
//		return sqlSession.selectList("deptManager.get", employeesVo);
//	}
	
	public EmployeesVo get(EmployeesVo employeesVo) {
		return sqlSession.selectOne("employees.getdetailEmployeeInfo", employeesVo);
	}
	
	public EmployeeDeptInfoVo get(EmployeeDeptInfoVo employeedeptinfovo) {
		
		return sqlSession.selectOne("employees.getdetailNavPoint", employeedeptinfovo);
	}
	
	public DepartmentsVo get(DepartmentsVo departmentsvo) {
		return sqlSession.selectOne("employees.getdetailNavPointParents", departmentsvo);
	}
	
	public List<EmployeesVo> getEmpInfo(Map<String, Object> map){
		return sqlSession.selectList("employees.getEmpInfo", map);
	}
	
	public int update(EmployeesVo employeesVo) {
		return sqlSession.update("employees.profilePictureUpdate", employeesVo);
	}
	
	public List<DutyPositionVo> getDpAll(){
		return sqlSession.selectList("employees.getDpAll");
	}
}
