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
	
	// 검색하여 직원정보를 테이블에 출력 
	// selectSearch는 부서검색, 이름검색 등 선택한 숫자값을 가져옴
	@ResponseBody
	@RequestMapping("/testboot/search/{kwd}/{selectSearch}")
	public JSONResult search(@PathVariable String kwd,
							 @PathVariable Long selectSearch) {
		return JSONResult.success(mainService.search(kwd, selectSearch));
	}
	
}
