package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.AdminConnectDeptEmpDao;
import com.douzone.quicksilver.vo.AdminConnectDeptEmpVo;

@Service
public class AdminConnectDeptEmpService {
	
	@Autowired
	private AdminConnectDeptEmpDao adminConnectDeptEmpDao;
	
	public List<AdminConnectDeptEmpVo> getConnectDeptEmpList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getList(adminConnectDeptEmpVo);									
	}
	
	public List<AdminConnectDeptEmpVo> getConnectDeptEmpClickList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getClickList(adminConnectDeptEmpVo);
	}
	

	public AdminConnectDeptEmpVo getEmpDetailRender(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getOne(adminConnectDeptEmpVo);
	}
	
	public List<AdminConnectDeptEmpVo> empDetailPositionDutyRender(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getListPositionDuty(adminConnectDeptEmpVo);
	}
	
	
}
