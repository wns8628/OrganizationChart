package com.douzone.quicksilver.repository;

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
	public Integer getPageinfomationSearch(Map<String, Object> map) {
		return sqlSession.selectOne("pagination.getPageinfomationSearch", map);
	}
}
