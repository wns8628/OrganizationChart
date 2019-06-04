package com.douzone.quicksilver.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.AdminConnectDeptEmpVo;

@Repository
public class AdminConnectDeptEmpDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<AdminConnectDeptEmpVo> getList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectList("adminConnectDeptEmp.getList", adminConnectDeptEmpVo);			 	 //로그인아디 사원이름 가져오기
	}
	
	public List<AdminConnectDeptEmpVo> getClickList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectList("adminConnectDeptEmp.getClickList", adminConnectDeptEmpVo);    	 //클릭한사원의 겸직정보 부서이름 주부서여부 직급가져오기
	}
	
	public AdminConnectDeptEmpVo getOne(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectOne("adminConnectDeptEmp.getEmpDetailRender", adminConnectDeptEmpVo);    //클릭한사원의 겸직정보 부서이름 주부서여부 직급가져오기
	}
	
	public List<AdminConnectDeptEmpVo> getListPositionDuty(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
				
		Map<String, Object> map = new HashMap<>();
		
		return sqlSession.selectList("adminConnectDeptEmp.getListPositionDuty", adminConnectDeptEmpVo);    //클릭한사원의 겸직정보 부서이름 주부서여부 직급가져오기
	}
}
