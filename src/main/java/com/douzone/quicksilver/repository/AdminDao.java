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
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CompanyVo> getCompList(){
		return sqlSession.selectList("admin.getCompList");
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
	
	public int updateDeptSeq(Map<String, Object> map) {
		return sqlSession.update("admin.updateParentDept", map);
	}
	
	public DepartmentsVo getDeptForTree(String seq) {
		return sqlSession.selectOne("admin.getDeptForTree", seq);
	}
	
	public int insertBiz(BizVo vo) {
		return sqlSession.insert("admin.insertBiz", vo);
	}
	
	public int insertBizMulti(BizVo vo) {
		return sqlSession.insert("admin.insertBizMulti", vo);
	}
	
	public int insertDept(DepartmentsVo vo) {
		return sqlSession.insert("admin.insertDept", vo);
	}
	
	public int insertDeptMulti(DepartmentsVo vo) {
		return sqlSession.insert("admin.insertDeptMulti", vo);
	}
	
	public int updateBiz(BizVo vo) {
		return sqlSession.update("admin.updateBiz", vo);
	}
	
	public int updateBizMulti(BizVo vo) {
		return sqlSession.update("admin.updateBizMulti", vo);
	}
	
	public int insertBizHistory(BizVo vo) {
		return sqlSession.insert("admin.insertBizHistory", vo);
	}
	
	public int insertBizMultiHistory(BizVo vo) {
		return sqlSession.insert("admin.insertBizMultiHistory", vo);
	}
	
	public BizVo getBizAll(String seq) {
		return sqlSession.selectOne("admin.getBizAll", seq);
	}
	
	public BizVo getBizMultiAll(BizVo vo) {
		return sqlSession.selectOne("admin.getBizMultiAll", vo);
	}
	
	public int deleteBiz(BizVo vo) {
		return sqlSession.delete("admin.deleteBiz", vo);
	}
	
	public int deleteBizMulti(BizVo vo) {
		return sqlSession.delete("admin.deleteBizMulti", vo);
	}
	
	public int updateDept(DepartmentsVo vo) {
		return sqlSession.update("admin.updateDept", vo);
	}
	
	public int updateDeptMulti(DepartmentsVo vo) {
		return sqlSession.update("admin.updateDeptMulti", vo);
	}
	
	public int insertDeptHistory(DepartmentsVo vo) {
		return sqlSession.insert("admin.insertDeptHistory", vo);
	}
	
	public int insertDeptMultiHistory(DepartmentsVo vo) {
		return sqlSession.insert("admin.insertDeptMultiHistory", vo);
	}
	
	public DepartmentsVo getDeptAll(DepartmentsVo vo) {
		return sqlSession.selectOne("admin.getDeptAll", vo);
	}
	
	public DepartmentsVo getDeptMultiAll(DepartmentsVo vo) {
		return sqlSession.selectOne("admin.getDeptMultiAll", vo);
	}
	
	public int deleteDept(DepartmentsVo vo) {
		return sqlSession.delete("admin.deleteDept", vo);
	}
	
	public int deleteDeptMulti(DepartmentsVo vo) {
		return sqlSession.delete("admin.deleteDeptMulti", vo);
	}
	
	public String deptSeqCheck(String seq) {
		return sqlSession.selectOne("admin.deptSeqCheck", seq);
	}
	
	public String bizSeqCheck(String seq) {
		return sqlSession.selectOne("admin.bizSeqCheck", seq);
	}
}
