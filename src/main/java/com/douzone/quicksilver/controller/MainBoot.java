package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.service.NaviService;

@Controller
public class MainBoot {

	@Autowired
	MainService mainService;
	@Autowired
	NaviService naviService;
	
	@RequestMapping("/boot")
	public String main(Model model) {
		model.addAttribute("companyList", naviService.getCompList());
		return "quicksilverboot/main";
	}
	
}
