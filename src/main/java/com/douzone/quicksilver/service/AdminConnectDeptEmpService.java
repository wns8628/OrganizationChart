package com.douzone.quicksilver.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.AdminConnectDeptEmpDao;
import com.douzone.quicksilver.vo.AdminConnectDeptEmpVo;

@Service
public class AdminConnectDeptEmpService {
	
	@Autowired
	private AdminConnectDeptEmpDao adminConnectDeptEmpDao;
	
	
	//사번가져오기
	public int getEmpSeq(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return adminConnectDeptEmpDao.getEmpSeq(adminConnectDeptEmpVo);									
	}
	//bizSeq가져오기
	public int getBizSeq(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		return adminConnectDeptEmpDao.getBizSeq(adminConnectDeptEmpVo);									
	}
	public List<AdminConnectDeptEmpVo> getConnectDeptEmpList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getList(adminConnectDeptEmpVo);									
	}
	
	public List<AdminConnectDeptEmpVo> getConnectDeptEmpClickList(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getClickList(adminConnectDeptEmpVo);
	}
	

	public AdminConnectDeptEmpVo getEmpDetailRender(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getOne(adminConnectDeptEmpVo);
	}
	
	public Map<String, Object> empDetailPositionDutyRender(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		return adminConnectDeptEmpDao.getListPositionDuty(adminConnectDeptEmpVo);
	}
	
	public int plusDept(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		   int result=0;
		
		   //t_co_emp_dept_history
		   int resultHistory = adminConnectDeptEmpDao.insertHistory(adminConnectDeptEmpVo);
		   
		   if(resultHistory == 1) {
			   result = adminConnectDeptEmpDao.insert(adminConnectDeptEmpVo);
		   }
		
		return result;
	}
	
	public int plusUpdate(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		int result=0;
		
		//기존 테이블 업뎃 
	    result = adminConnectDeptEmpDao.update(adminConnectDeptEmpVo);
		
	    //원래데이터 히스토리업뎃 
    	if(result == 1) {
    		adminConnectDeptEmpDao.updateHistory(adminConnectDeptEmpVo);
    	}
    	
    	//히스토리 추가
    	if(result == 1) {
    		adminConnectDeptEmpDao.insertHistory(adminConnectDeptEmpVo);
    	}
		
    	return result;
	}
	
	public int deleteDept(AdminConnectDeptEmpVo adminConnectDeptEmpVo){
		
		int result=0;
		
		//기존 테이블 지우기
	    result = adminConnectDeptEmpDao.delete(adminConnectDeptEmpVo);
		
	    //원래데이터 히스토리업뎃 
    	if(result == 1) {
    		adminConnectDeptEmpDao.deleteHistory(adminConnectDeptEmpVo);
    	}
    	
    	return result;
	}
}
