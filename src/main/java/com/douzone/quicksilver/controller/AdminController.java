package com.douzone.quicksilver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/main")
	public String main() {
		
		return "main/admin";
	}
	
	@RequestMapping("/compMgr")
	public String compMgr() {
		return "admin/comp-mgr";
	}
}
