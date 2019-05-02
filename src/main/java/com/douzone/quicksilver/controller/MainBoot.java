package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
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
		
		model.addAttribute("companyList", naviService.getCompList(langCode));
		model.addAttribute("mainInfo", mainService.getMainInfo());

		return "quicksilverboot/main";
	}
	
	@ResponseBody
	@RequestMapping("/getMainChart")
	public JSONResult getMainChart(HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}

		return JSONResult.success(mainService.getMainChart(langCode));
	}
	
	
	@RequestMapping("/boot/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/boot";
	}
}
