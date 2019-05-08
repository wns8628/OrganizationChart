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
	
	public CompanyVo getCompInfo(String compSeq) {
		return sqlSession.selectOne("admin.getCompInfo", compSeq);
	}
	
	public int insertComp(CompanyVo vo) {
		return sqlSession.insert("admin.insertComp", vo);
	}
	
	public int insertCompMulti(CompanyVo vo) {
		return sqlSession.insert("admin.insertCompMulti", vo);
	}
	
	public int insertCompHistory(CompanyVo vo) {
		return sqlSession.insert("admin.insertCompHistory", vo);
	}
}
