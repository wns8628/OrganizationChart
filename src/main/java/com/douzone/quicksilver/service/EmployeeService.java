package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmployeeDao;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	public EmployeesVo getdetailEmployeeInfo(EmployeesVo employeesVo) {
		return employeeDao.get(employeesVo);
	}
	
	public List<EmployeesVo> getEmpInfo(String seq, String type,String langCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("langCode", langCode);
		map.put("type", type);
		return employeeDao.getEmpInfo(map);
	}
	
//	public Long insertEmployee(EmployeesVo employeesVo) {
//		
//		long employeeNo = employeeDao.insert(employeesVo);
//		
//		employeesVo.setNo(employeeNo);
//		employeesVo.setName(null);	
//		
//		// salaries insert
//		employeeDao.insert(employeesVo);
//		
//		employeesVo.setNo(employeeNo);
//		employeesVo.setAge(null);
//		
//		// grade_emp insert
//		employeeDao.insert(employeesVo);
//		
//		employeesVo.setNo(employeeNo);
//		employeesVo.setGender(null);
//				
//		// dept_emp insert
//		employeeDao.insert(employeesVo);
//		
//		employeesVo.setNo(employeeNo);
//		employeesVo.setPhone(null);
//		
//		// 새로운 직원이 들어간 부서에 이미 부서팀장이 있으면
//		if( employeeDao.get(employeesVo) == null) {
//			return 1L;
//		}
//		
//		// 부서팀장이 없으면
//		// dept_manager insert
//		employeeDao.insert(employeesVo);
//		
//		
//		return 1L;
//	}
	
	

}
