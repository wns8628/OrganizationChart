package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

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
	public String main(Model model, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		System.out.println(langCode);
		model.addAttribute("companyList", naviService.getCompList(langCode));
		return "quicksilverboot/main";
	}
	
}
