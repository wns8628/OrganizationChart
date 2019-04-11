package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.NaviService;

@Controller
public class NaviController {
	@Autowired
	private NaviService naviService;
	
	@RequestMapping("/main2")
	public String main(Model model) {
		model.addAttribute("companyList", naviService.companyList());
		return "main/index02";
	}
	
	@RequestMapping("/main3")
	public String main3(Model model) {
		model.addAttribute("companyList", naviService.companyList());
		return "main/index";
	}
	
	@ResponseBody
	@RequestMapping({"/getlist"})
	public JSONResult getList(Model model) {
		
		return JSONResult.success(naviService.deptList());
	}
	
	@ResponseBody
	@RequestMapping("/getDept/{parents}")
	public JSONResult getDeptByNo(@PathVariable int parents) {
		return JSONResult.success(naviService.getDeptByPno(parents));
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