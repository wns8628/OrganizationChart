package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.quicksilver.service.MainService;

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
	
}
