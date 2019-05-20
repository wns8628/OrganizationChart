package com.douzone.quicksilver.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.EmployeeService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
public class ExelSaveController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@ResponseBody
	@RequestMapping("/exel/{seq}/{type}")
	public JSONResult exelSubmit(HttpSession session,
								 @PathVariable String type,	
								 @PathVariable String seq) {
		
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
	
		return JSONResult.success(employeeService.getEmpInfo(seq, type, langCode));
	}
	
//-------------------------------------------------------------------------------
	
	@ResponseBody
	@RequestMapping("/exel")
	public JSONResult exelSubmit(HttpSession session) {
		
		List<EmployeesVo> searchCode = null;
		
		searchCode = (List<EmployeesVo>) session.getAttribute("searchCode");
		
		return JSONResult.success(searchCode);
	}
}
