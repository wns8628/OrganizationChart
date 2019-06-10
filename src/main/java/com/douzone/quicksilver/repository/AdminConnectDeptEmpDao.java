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
	
	//사번가져오기
	public int getEmpSeq(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectOne("adminConnectDeptEmp.getEmpSeq", adminConnectDeptEmpVo);			 	 
	}
	//bizseq사져오기
	public int getBizSeq(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectOne("adminConnectDeptEmp.getBizSeq", adminConnectDeptEmpVo);			 	
	}
	public List<AdminConnectDeptEmpVo> getList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectList("adminConnectDeptEmp.getList", adminConnectDeptEmpVo);			 	 //로그인아디 사원이름 가져오기
	}
	
	public List<AdminConnectDeptEmpVo> getClickList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectList("adminConnectDeptEmp.getClickList", adminConnectDeptEmpVo);    	 //클릭한사원의 겸직정보 부서이름 주부서여부 직급가져오기
	}
	
	public AdminConnectDeptEmpVo getOne(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return sqlSession.selectOne("adminConnectDeptEmp.getEmpDetailRender", adminConnectDeptEmpVo);    //클릭한사원의 겸직정보 부서이름 주부서여부 직급가져오기
	}
	
	public Map<String, Object> getListPositionDuty(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
				
		Map<String, Object> map = new HashMap<>();
		
		map.put("position", sqlSession.selectList("adminConnectDeptEmp.getListPosition", adminConnectDeptEmpVo));
		map.put("duty",sqlSession.selectList("adminConnectDeptEmp.getListDuty", adminConnectDeptEmpVo));    
		
		return map;
	}
	
	//겸직추가시 넣어야될 데이터 
	public int insert(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.insert("adminConnectDeptEmp.insert", adminConnectDeptEmpVo);
	}
	//t_co_emp_dept_history 데이터넣기
	public int insertHistory(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.insert("adminConnectDeptEmp.insert_history", adminConnectDeptEmpVo);
	}
	
	//겸직 수정
	public int update(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.update("adminConnectDeptEmp.update", adminConnectDeptEmpVo);
	}
	public int updateHistory(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.update("adminConnectDeptEmp.update_history", adminConnectDeptEmpVo);
	}
	
	//겸직 삭제
	public int delete(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.delete("adminConnectDeptEmp.delete", adminConnectDeptEmpVo);
	}
	public int deleteHistory(AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		return sqlSession.update("adminConnectDeptEmp.delete_history", adminConnectDeptEmpVo);
	}
}
