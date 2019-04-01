package com.douzone.quicksilver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

//	@RequestMapping({ "","/main"} )
//	public String main(Model model) {
//		SiteVo siteVo = siteService.main();
//		model.addAttribute("siteVo",siteVo);
//		return "main/index"; //뷰리졸브 설정
//	}
	
	@ResponseBody
	@RequestMapping( {"","/main"} )
	public String hello() {
		return "<h1>안녕하세요</h1>";
	}
	
//	@ResponseBody
//	@RequestMapping( "/hello2" )
//	public JSONResult hello2() {
//		JSONResult jsonResult = JSONResult.success(new UserVo());
//		
//		return jsonResult;		
//	}
}
