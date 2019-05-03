package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmployeeDao;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	public EmployeesVo getdetailEmployeeInfo(EmployeesVo employeesVo) {
		return employeeDao.get(employeesVo);
	}
	
	public EmployeeDeptInfoVo getdetailNavPoint(String empSeq) {
		return employeeDao.get(empSeq);
	}

	public Long getdetailNavPointParents(Long deptSeq) {
		return employeeDao.get(deptSeq);
	}
	
	public List<EmployeesVo> getEmpInfo(String seq, String type,String langCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("langCode", langCode);
		map.put("type", type);
		return employeeDao.getEmpInfo(map);
	}
	
	public int insertEmployee(EmployeesVo employeesVo) {
				
		// insert t_co_emp
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_multi
		employeesVo.setErpEmpNum("213213");
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_comp
		employeesVo.setOutMail("45435");
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_dept
		employeesVo.setOutDomain("fdsfdsf");
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_dept_multi
		employeesVo.setAddr("345345");
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_dept_multi en
		employeesVo.setShift("fdsfdsf");
		employeeDao.insert(employeesVo);
		
		// insert t_co_emp_multi en
		employeesVo.setSignType("#$%435");
		return employeeDao.insert(employeesVo);

		
	}
	
	

}
