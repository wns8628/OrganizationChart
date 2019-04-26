package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.EmployeeService;
import com.douzone.quicksilver.vo.EmployeesVo;


@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
//	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
//	public void addEmployee(@ModelAttribute EmployeesVo employeesVo) {
//		
//		System.out.println("employeesVo : " + employeesVo);
//		employeeService.insertEmployee(employeesVo);
//	}
	
	@ResponseBody
	@RequestMapping("/getdetailEmployeeInfo/{empNum}/{langCode}")
	public JSONResult getdetailEmployeeInfo(@PathVariable String empNum,
											@PathVariable String langCode) {
		System.out.println("여어기");
		EmployeesVo employeesVo = new EmployeesVo();
		employeesVo.setEmpNum(empNum);
		employeesVo.setLangCode(langCode);
		
		return JSONResult.success(employeeService.getdetailEmployeeInfo(employeesVo));
	}
	
	@ResponseBody
	@RequestMapping("/getEmpInfo/{seq}")
	public JSONResult getEmpInfo(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(employeeService.getEmpInfo(seq, langCode));
	}
}
