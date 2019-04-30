package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class SearchDao {

	@Autowired
	private SqlSession sqlSession;

	// 검색해서 직원정보 가져옴
	public List<EmployeesVo> getList(Map<String, Object> map){
		
		return sqlSession.selectList("employees.search", map);
	}
	
}
