package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.MainService;

@Controller
public class MainController02 {
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/main2")
	public String main(Model model) {
		model.addAttribute("companyList", mainService.companyList());
		return "main/index02";
	}
	
	@ResponseBody
	@RequestMapping({"/getlist"})
	public JSONResult getList(Model model) {
		
		return JSONResult.success(mainService.deptList());
	}
	
	@RequestMapping({"/addDepartment/{parentNo}/{departmentName}"})
	public void addDepartment(@PathVariable Long parentNo,
						 @PathVariable String departmentName) {
		
		mainService.addDepartment(parentNo, departmentName);
	}
	
	@RequestMapping({"/deleteDepartment/{departmentNo}"})
	public void addDepartment(@PathVariable Long departmentNo) {
		
		mainService.deleteDepartment(departmentNo);
	}
	
	@RequestMapping("/addDept")
	public String addDept() {
		//더미데이터
		for(int i=2; i<10; i++) {
//			mainService.autoSet((i*1000)+(i+1)+1);
			for(int j=0; j<1000; j++) {
//				mainService.addDept(i);
				System.out.println(j);
			}
		}
		return "redirect:/main2";
	}
}
