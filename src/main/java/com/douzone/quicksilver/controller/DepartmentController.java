package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.DepartmentService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
@RequestMapping("boot/getDepartmentEmployeeInfo")
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	// 부서 정보를 가져와서 테이블에 출력
	@ResponseBody
	@RequestMapping("/{departmentsNo}")
	public JSONResult getDepartmentEmployeeInfo(EmployeesVo employeesVo) {
		return JSONResult.success(departmentService.getDepartmentEmployeeInfo(employeesVo));
	}
	
	@RequestMapping({"/addDepartment/{parentNo}/{departmentName}"})
	public void addDepartment(@PathVariable Long parentNo,
			 				  @PathVariable String departmentName) {		
		departmentService.addDepartment(parentNo, departmentName);
	}
	
	@RequestMapping({"/deleteDepartment/{departmentNo}"})
	public void deleteDepartment(@PathVariable Long departmentNo) {		
		departmentService.deleteDepartment(departmentNo);
	}	
}
