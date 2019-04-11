package com.douzone.quicksilver.respository;

import java.util.List;

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
}