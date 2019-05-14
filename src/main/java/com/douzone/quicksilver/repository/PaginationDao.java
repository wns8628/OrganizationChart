package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class PaginationDao {

	@Autowired
	private SqlSession sqlSession;

	public Integer getPageinfomation(Map<String, Object> map) {
		return sqlSession.selectOne("pagination.getPageinfomation", map);
	}
	public List<Integer> getPageinfomationSearch(Map<String, Object> map) {
		return sqlSession.selectList("pagination.getPageinfomationSearch", map);
	}
}
