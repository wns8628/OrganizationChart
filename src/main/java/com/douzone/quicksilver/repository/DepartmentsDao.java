package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;


@Repository
public class DepartmentsDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 부서의 직원정보 가져옴
	public List<EmployeesVo> getList(Long dept_no){		
		return sqlSession.selectList("employees.getDepartmentEmployeeInfo", dept_no);
	}
	//
	public DepartmentsVo get(DepartmentsVo departmentsvo) { 
		return sqlSession.selectOne("departments.get_t_co_dept_info", departmentsvo);
	}	
	public EmployeesVo getLeader(DepartmentsVo departmentsvo){		
		
		System.out.println(departmentsvo.getLangCode());
		System.out.println(departmentsvo.getDeptSeq());
		
		
		return sqlSession.selectOne("departments.getDepartmentEmployeeInfoLeader", departmentsvo);
	}
	//
	public BizVo get(BizVo bizvo) { 
		return sqlSession.selectOne("departments.get_t_co_biz_info", bizvo);
	}
	
	public List<EmployeeDeptInfoVo> get(EmployeeDeptInfoVo employeeDeptInfovo) { 
		return sqlSession.selectList("departments.get", employeeDeptInfovo);
	}
	
	public long insert(DepartmentsVo departmentsvo) {
		sqlSession.insert("departments.add_t_co_dept", departmentsvo);
		return sqlSession.insert("departments.add_t_co_dept_multi", departmentsvo);

	}
	
//	public DepartmentsVo get(long parentNo) {
//		return sqlSession.selectOne("departments.getParentDepartmentInfo", parentNo);
//	}
	
//	public int update(DepartmentsVo departmentsVo) {
//		return sqlSession.update("departments.ifnotnullupdateOnoPlusOne", departmentsVo);
//	}
	
	public int delete(String departmentNo) {
		sqlSession.delete("departments.delete_t_co_dept", departmentNo);
		return sqlSession.delete("departments.delete_t_co_dept_multi", departmentNo);
	}
}
