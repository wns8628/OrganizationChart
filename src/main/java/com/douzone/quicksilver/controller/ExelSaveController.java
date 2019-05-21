package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.quicksilver.service.ExcelService;


@Controller
public class ExelSaveController {
	@Autowired
	private ExcelService excelService;
	
	@RequestMapping(value = "/excel.do")
	public void excel(HttpServletResponse response,
					  HttpSession session) throws Exception {
		
		excelService.selectExcelList(response, session);
	}
}
