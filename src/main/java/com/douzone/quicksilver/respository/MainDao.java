package com.douzone.quicksilver.respository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;

	public DepartmentsVo get(long parentNo) {
		return sqlSession.selectOne("departments.getParentDepartmentInfo", parentNo);
	}

	public DepartmentsVo get(DepartmentsVo departmentsVo) {
		return sqlSession.selectOne("departments.get", departmentsVo);
	}

	public int update(DepartmentsVo departmentsVo) {
		return sqlSession.update("departments.ifnotnullupdateOnoPlusOne", departmentsVo);
	}

	public int insert(DepartmentsVo departmentsVo) {
		return sqlSession.insert("departments.addDepartment", departmentsVo);
	}

	public int delete(long departmentNo) {
		return sqlSession.delete("departments.deleteDepartment", departmentNo);
	}
	
	// 부서의 직원정보 가져옴
	public List<EmployeesVo> get(EmployeesVo employeesVo){
		return sqlSession.selectList("employees.getDepartmentEmployeeInfo", employeesVo);
	}
	
	// 검색해서 직원정보 가져옴
	public List<EmployeesVo> get(Map<String, Object> map){
		return sqlSession.selectList("employees.search", map);
	}
	
}
