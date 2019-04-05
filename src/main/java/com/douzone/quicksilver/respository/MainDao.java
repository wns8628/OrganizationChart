package com.douzone.quicksilver.respository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CompanyVo> get() {
		return sqlSession.selectList("company.getList");
	}

	public List<DepartmentsVo> getList() {
		return sqlSession.selectList("departments.getList");
	}

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
	
	// 더미데이터용
	public int getCount() {
		return sqlSession.selectOne("departments.getCount");
	}
	
	public int getCountByPno(int pNo) {
		return sqlSession.selectOne("departments.getCountByPno", pNo);
	}
	
	public String getNameByPno(int pNo) {
		return sqlSession.selectOne("departments.getNameByPno", pNo);
	}
	
	public void autoSet(int num) {
		sqlSession.update("departments.autoSet", num);
	}
}
