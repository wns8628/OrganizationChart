package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
public class MainBootTest {

	@Autowired
	MainService mainService;
	
	@RequestMapping("/testboot")
	public String main(Model model) {
		model.addAttribute("companyList", mainService.companyList());
		return "bootstraptest";
	}
	@RequestMapping("/testboot/login")
	public String login() {
		return "bootlogin";
	}
	@RequestMapping("/testboot/test")
	public String test() {
		return "test2";
	}
	
	// 부서 정보를 가져와서 테이블에 출력
	@ResponseBody
	@RequestMapping("/testboot/getDepartmentEmployeeInfo/{departmentsNo}")
	public JSONResult getDepartmentEmployeeInfo(EmployeesVo employeesVo) {
		return JSONResult.success(mainService.getDepartmentEmployeeInfo(employeesVo));
	}
	
}
