package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmpInfoManagementDao;
import com.douzone.quicksilver.vo.ChangePasswordVo;
import com.douzone.quicksilver.vo.EmpInfoManagementVo;
import com.douzone.quicksilver.vo.GetPositionDutyVo;
import com.douzone.quicksilver.vo.ResetIdVo;

@Service
public class EmpInfoManagementService {

	@Autowired
	private EmpInfoManagementDao empInfoManagementDao;
	
	public List<EmpInfoManagementVo> search(EmpInfoManagementVo empInfoManagementVo) {
		if(empInfoManagementVo.getKwd().equals("")) {
			empInfoManagementVo.setKwd(null);
		}
		return empInfoManagementDao.select(empInfoManagementVo);
	}
	
	public int resetId(ResetIdVo resetIdVo) {
		return empInfoManagementDao.update(resetIdVo);
	}
	
	public int changePassword(ChangePasswordVo changePasswordVo) {
		return empInfoManagementDao.update(changePasswordVo);
	}
	
	public List<ResetIdVo> checkDuplicateLoginId(ResetIdVo resetIdVo) {
		return empInfoManagementDao.select(resetIdVo);
	}
	
	public List<GetPositionDutyVo> getPositionDuty(String compSeq){
		return empInfoManagementDao.select(compSeq);
	}
	
}
