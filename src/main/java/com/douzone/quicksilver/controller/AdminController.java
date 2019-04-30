package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.quicksilver.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/main")
	public String main() {
		
		return "main/admin";
	}
	
	@RequestMapping("/compMgr")
	public String compMgr(HttpSession session, Model model) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		model.addAttribute("compList", adminService.getCompList(langCode));
		return "admin/comp-mgr";
	}
}
