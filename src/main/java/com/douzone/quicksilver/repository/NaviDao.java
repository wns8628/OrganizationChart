package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Repository
public class NaviDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CompanyVo> getCompanyList() {
		return sqlSession.selectList("navigation.getCompanyList");
	}

	public List<DepartmentsVo> getDeptList() {
		return sqlSession.selectList("navigation.getDeptList");
	}

	public int getCount() {
		return sqlSession.selectOne("navigation.getCount");
	}

	public int getCountByPno(int pNo) {
		return sqlSession.selectOne("navigation.getCountByPno", pNo);
	}

	public String getNameByPno(int pNo) {
		return sqlSession.selectOne("navigation.getNameByPno", pNo);
	}

	public void autoSet(int num) {
		sqlSession.update("navigation.autoSet", num);
	}

	public List<DepartmentsVo> getDeptByPno(int parents) {
		return sqlSession.selectList("navigation.getDeptByPno", parents);
	}

	public List<CompanyVo> getCompList(String langCode){
		return sqlSession.selectList("navigation.getCompList", langCode);
	}
	
	public List<BizVo> getBizList(Map<String, Object> map){
		return sqlSession.selectList("navigation.getBizList", map);
	}
	
	public List<DepartmentsVo> getDeptList(Map<String, Object> map){
		return sqlSession.selectList("navigation.getDeptList", map);
	}
	
}
