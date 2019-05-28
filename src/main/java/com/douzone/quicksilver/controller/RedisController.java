package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.RedisService;

@Controller
public class RedisController {
	@Autowired
	private RedisService redisService;
	
	@RequestMapping(value = "/redis/test")
	public void redisTest(){		
		redisService.exam();
	}
	
	@RequestMapping(value = "/redis")
	public void redis( @RequestParam (value="kwd",required=false, defaultValue="") String kwd){	
		redisService.addWord(kwd);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/redis/read")
	public JSONResult redisReadTest( @RequestParam (value="kwd",required=false, defaultValue="") String prefix,
							   @RequestParam (value="count",required=false, defaultValue="") int count){	
		
		return JSONResult.success(redisService.complete(prefix,count));
	}
}
