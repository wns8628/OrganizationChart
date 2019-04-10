package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzone.quicksilver.service.EmployeeService;
import com.douzone.quicksilver.vo.EmployeesVo;


@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public void addEmployee(@ModelAttribute EmployeesVo employeesVo) {
		
		System.out.println("employeesVo : " + employeesVo);
		employeeService.insertEmployee(employeesVo);
		
		
	}
}
