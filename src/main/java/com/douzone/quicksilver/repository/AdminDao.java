package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CompanyVo> getCompList(String langCode){
		return sqlSession.selectList("admin.getCompList", langCode);
	}
}
