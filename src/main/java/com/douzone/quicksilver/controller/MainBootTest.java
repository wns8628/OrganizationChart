package com.douzone.quicksilver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBootTest {

	
	@RequestMapping("/testboot")
	public String main() {
		return "bootstraptest";
	}
	
	
}
