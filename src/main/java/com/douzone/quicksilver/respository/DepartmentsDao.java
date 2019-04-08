package com.douzone.quicksilver.respository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeesVo;


@Repository
public class DepartmentsDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 부서의 직원정보 가져옴
	public List<EmployeesVo> get(EmployeesVo employeesVo){
		return sqlSession.selectList("employees.getDepartmentEmployeeInfo", employeesVo);
	}

	public DepartmentsVo get(DepartmentsVo departmentsVo) {
		return sqlSession.selectOne("departments.get", departmentsVo);
	}
	
	public int insert(DepartmentsVo departmentsVo) {
		return sqlSession.insert("departments.addDepartment", departmentsVo);
	}
	
	public DepartmentsVo get(long parentNo) {
		return sqlSession.selectOne("departments.getParentDepartmentInfo", parentNo);
	}
	
	public int update(DepartmentsVo departmentsVo) {
		return sqlSession.update("departments.ifnotnullupdateOnoPlusOne", departmentsVo);
	}
	
	public int delete(long departmentNo) {
		return sqlSession.delete("departments.deleteDepartment", departmentNo);
	}
}
