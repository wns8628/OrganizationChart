package com.douzone.quicksilver.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.MainService;

@Controller
public class MainController02 {
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/main2")
	public String main() {
		System.out.println("dd");
		return "main/index02";
	}
	
	@ResponseBody
	@RequestMapping({"/getlist"})
	public JSONResult getList(Model model) {
		
		Map<String, Object> map	= mainService.list();
		
		return JSONResult.success(map);
	}
}
