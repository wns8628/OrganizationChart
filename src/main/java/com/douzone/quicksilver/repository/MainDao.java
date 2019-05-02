package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.MasterGroupVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	
	public MasterGroupVo get(){
		return sqlSession.selectOne("info.getMainInfo");
	}
	
	public List<CompanyVo> get(String langCode){
		System.out.println("왜안올까");
		
		List<CompanyVo> aa = sqlSession.selectList("info.getMainChartList",langCode);
		System.out.println(aa);
		return aa;
	}
}
