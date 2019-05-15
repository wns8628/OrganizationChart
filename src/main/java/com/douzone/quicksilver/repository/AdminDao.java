package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

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
	
	public BizVo getBizInfo(String bizSeq) {
		return sqlSession.selectOne("admin.getBizInfo", bizSeq);
	}
	
	public DepartmentsVo getDeptInfo(String deptSeq) {
		return sqlSession.selectOne("admin.getDeptInfo", deptSeq);
	}
	
	public int insertComp(CompanyVo vo) {
		return sqlSession.insert("admin.insertComp", vo);
	}
	
	public int insertCompMulti(CompanyVo vo) {
		return sqlSession.insert("admin.insertCompMulti", vo);
	}
	
	public int deleteComp(CompanyVo vo) {
		return sqlSession.delete("admin.deleteComp", vo);
	}

	public int deleteCompMulti(CompanyVo vo) {
		return sqlSession.delete("admin.deleteCompMulti", vo);
	}
	
	public int updateComp(CompanyVo vo) {
		return sqlSession.update("admin.updateComp", vo);
	}
	
	public int updateCompMulti(CompanyVo vo) {
		return sqlSession.update("admin.updateCompMulti", vo);
	}
	
	public int updateCompHistory(CompanyVo vo) {
		return sqlSession.insert("admin.updateCompHistory", vo);
	}
	public int updateCompMultiHistory(CompanyVo vo) {
		return sqlSession.insert("admin.updateCompMultiHistory", vo);
	}
	
	public CompanyVo getCompAll(CompanyVo vo) {
		return sqlSession.selectOne("admin.getCompAll", vo);
	}
	
	public CompanyVo getCompMultiAll(CompanyVo vo) {
		return sqlSession.selectOne("admin.getCompMultiAll", vo);
	}
	
	
}
