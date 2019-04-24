package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.DeptManagerVo;
import com.douzone.quicksilver.vo.EmployeesVo;


@Repository
public class DepartmentsDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 부서의 직원정보 가져옴
	public List<EmployeesVo> getList(Long dept_no){		
		return sqlSession.selectList("employees.getDepartmentEmployeeInfo", dept_no);
	}

	public DeptManagerVo get(Long dept_no){		
		return sqlSession.selectOne("employees.getDepartmentEmployeeInfoLeader", dept_no);
	}
	
	public DepartmentsVo get(DepartmentsVo departmentsVo) {
		return sqlSession.selectOne("departments.get", departmentsVo);
	}
	
	public long insert(DepartmentsVo departmentsVo) {
		sqlSession.insert("departments.add_t_co_dept", departmentsVo);
		return sqlSession.insert("departments.add_t_co_dept_multi", departmentsVo);

	}
	
//	public DepartmentsVo get(long parentNo) {
//		return sqlSession.selectOne("departments.getParentDepartmentInfo", parentNo);
//	}
	
//	public int update(DepartmentsVo departmentsVo) {
//		return sqlSession.update("departments.ifnotnullupdateOnoPlusOne", departmentsVo);
//	}
	
	public int delete(long departmentNo) {
		return sqlSession.delete("departments.deleteDepartment", departmentNo);
	}
}
