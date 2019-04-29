package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/main3")
	public String main3(Model model, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		model.addAttribute("companyList", naviService.getCompList(langCode));
		return "main/index";
	}
	
	@RequestMapping("/main3/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/main3";
	}
	
	@ResponseBody
	@RequestMapping("/getBiz/{seq}")
	public JSONResult getBizList(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getBizList(seq, langCode));
	}
	
	@ResponseBody
	@RequestMapping("/getDept/{seq}")
	public JSONResult getDeptList(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getDeptList(seq, langCode));
	}
	
	@ResponseBody
	@RequestMapping("/getEmpInfoByDept/{seq}")
	public JSONResult getEmpInfo(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getEmpInfo(seq, langCode));
	}
}
