package com.douzone.quicksilver.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.PaginationService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
@RequestMapping("boot/pagination")
public class PaginationController {

	@Autowired
	private PaginationService PaginationService;
	
	@ResponseBody
	@RequestMapping("")
	public JSONResult search(@RequestParam (value="pageNo",required=false, defaultValue="1") Integer pageNo,
																						HttpSession session) {

		List<EmployeesVo> searchCode = (List<EmployeesVo>) session.getAttribute("searchCode");
		Integer searchCount = (Integer)session.getAttribute("searchCount");
		
	return JSONResult.success(PaginationService.Employeelist(searchCode, searchCount,pageNo));
	}
	
}
