package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;

@Repository
public class RankPositionManagementDao {

	
	 @Autowired 
	 private SqlSession sqlSession;
	  
	  public List<CompanyVo> get(Map<String, Object> map){ 
		  return sqlSession.selectList("rankPositionManagement.search", map);
	 }
	 
}
