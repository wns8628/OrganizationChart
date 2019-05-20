package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.MasterGroupVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	
	//메인정보
	public MasterGroupVo get(){
		return sqlSession.selectOne("info.getMainInfo");
	}
	public List<CompanyVo> getList(String langCode){
		return sqlSession.selectList("info.getMainChartList",langCode);
	}
	
	//사업장클릭시 정보
	public CompanyVo get(CompanyVo companyvo){
		return sqlSession.selectOne("info.getCompInfo", companyvo);
	}
	public List<BizVo> getList(BizVo bizvo){
		return sqlSession.selectList("info.getBizChartList",bizvo);
	}
	
	public EmployeesVo get1(int empSeq) {
		return sqlSession.selectOne("biz.get1", empSeq);
	}
	
	public String get2(Map<String, Object> map) {
		return sqlSession.selectOne("biz.get2", map);
	}
	
	public int update1(Map<String, Object> map) {
		return sqlSession.update("biz.update1", map);
	}
	
	public int update2(Map<String, Object> map) {
		return sqlSession.update("biz.update2", map);
	}

}
