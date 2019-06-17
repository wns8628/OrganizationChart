package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.AddEmpVo;
import com.douzone.quicksilver.vo.ChangePasswordVo;
import com.douzone.quicksilver.vo.EmpInfoManagementVo;
import com.douzone.quicksilver.vo.GetPositionDutyVo;
import com.douzone.quicksilver.vo.RemoveEmpInfoVo;
import com.douzone.quicksilver.vo.ResetIdVo;

@Repository
public class EmpInfoManagementDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<EmpInfoManagementVo> select(EmpInfoManagementVo empInfoManagementVo) {
		return sqlSession.selectList("empInfoManagement.search", empInfoManagementVo);
	}
	
	public List<ResetIdVo> select(ResetIdVo resetIdVo) {
		return sqlSession.selectList("empInfoManagement.checkDuplicateLoginId", resetIdVo);
	}
	
	public List<GetPositionDutyVo> select(String compSeq){
		return sqlSession.selectList("empInfoManagement.getPositionDuty", compSeq);
	}
	
	public int update(ResetIdVo resetIdVo) {
		return sqlSession.update("empInfoManagement.resetId", resetIdVo);
	}
	
	public int update(ChangePasswordVo changePasswordVo) {
		return sqlSession.update("empInfoManagement.changePassword", changePasswordVo);
	}
	
	public int update(RemoveEmpInfoVo removeEmpInfoVo) {
		return sqlSession.update("empInfoManagement.removeEmpInfoVo", removeEmpInfoVo);
	}
	
	public int insert(AddEmpVo addEmpVo) {
		return sqlSession.insert("empInfoManagement.addEmp", addEmpVo);
	}
}
