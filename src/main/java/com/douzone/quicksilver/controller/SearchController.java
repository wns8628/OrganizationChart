package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.SearchService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@ResponseBody
	@RequestMapping(value="")
	public Object list(@RequestParam(value="kwd",required=false, defaultValue="1") String kwd){	

		List<EmployeesVo> list = searchService.Employeelist(kwd);
		
		return JSONResult.success(list);
	}
}
