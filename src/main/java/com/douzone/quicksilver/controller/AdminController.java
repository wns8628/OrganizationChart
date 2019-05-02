package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
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
	
	@ResponseBody
	@RequestMapping("/getCompInfo/{compSeq}")
	public JSONResult getEmpInfo(@PathVariable("compSeq") String compSeq) {
		return JSONResult.success(adminService.getCompInfo(compSeq));
	}
}
