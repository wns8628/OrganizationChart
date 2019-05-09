package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmployeeDao;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	public EmployeesVo getdetailEmployeeInfo(EmployeesVo employeesVo) {
		return employeeDao.get(employeesVo);
	}
	
	public EmployeeDeptInfoVo getdetailNavPoint(EmployeeDeptInfoVo employeedeptinfovo) {
		return employeeDao.get(employeedeptinfovo);
	}

	public DepartmentsVo getdetailNavPointParents(DepartmentsVo departmentsvo) {
		return employeeDao.get(departmentsvo);
	}
	
	public List<EmployeesVo> getEmpInfo(String seq, String type,String langCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("langCode", langCode);
		map.put("type", type);
		
		return employeeDao.getEmpInfo(map);
	}
	
	public int insertEmployee(EmployeesVo employeesVo) {
		
		return employeeDao.insert(employeesVo);
	}
	
	

}
