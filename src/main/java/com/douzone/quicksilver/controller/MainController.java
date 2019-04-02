package com.douzone.quicksilver.controller;

import java.util.Map; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.quicksilver.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping({ "", "/main"} )
	public String main(Model model) {
		
		Map<String, Object> map	= mainService.list();
		
	
		model.addAttribute("mainMap", map);
		return "main/index"; //뷰리졸브 설정
	}
	
//	@ResponseBody
//	@RequestMapping( {"","/main"} )
//	public String hello() {
//		return "<h1>안녕하세요</h1>";
//	}
	
//	@ResponseBody
//	@RequestMapping( "/hello2" )
//	public JSONResult hello2() {
//		JSONResult jsonResult = JSONResult.success(new UserVo());
//		
//		return jsonResult;		
//	}
}
