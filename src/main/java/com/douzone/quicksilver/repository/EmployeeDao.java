package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlSession;
	
//	public Long insert(EmployeesVo employeesVo) {
//		System.out.println("employeesVo no : " + employeesVo.getNo());
//		System.out.println(employeesVo);
//		sqlSession.insert("employees.insert", employeesVo);
//		
//		if( employeesVo.getNo() != null) {
//			return employeesVo.getNo();
//		}
//		
//		return 1L;
//	}
	
//	public List<DeptManagerVo> get(EmployeesVo employeesVo) {
//		return sqlSession.selectList("deptManager.get", employeesVo);
//	}
	
	public EmployeesVo get(EmployeesVo employeesVo) {
		return sqlSession.selectOne("employees.getdetailEmployeeInfo", employeesVo);
	}
	
	public EmployeeDeptInfoVo get(String empSeq) {
		
		return sqlSession.selectOne("employees.getdetailNavPoint", empSeq);
	}
	
	public Long get(Long deptSeq) {
		return sqlSession.selectOne("employees.getdetailNavPointParents", deptSeq);
	}
	
	public List<EmployeesVo> getEmpInfo(Map<String, Object> map){
		return sqlSession.selectList("employees.getEmpInfo", map);
	}
	
	public int update(EmployeesVo employeesVo) {
		return sqlSession.update("employees.profilePictureUpdate", employeesVo);
	}
}
