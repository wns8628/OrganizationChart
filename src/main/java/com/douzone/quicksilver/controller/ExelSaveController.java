package com.douzone.quicksilver.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/langCodeToggle/{langCode}")
	public void langCodeToggle(HttpSession session,
							   @PathVariable String langCode){
		
		System.out.println(langCode);
	
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("excelInfo");
		map.put("langCode", langCode);
		
		session.setAttribute("excelInfo", map); //엑셀저장용 세션 
	}
	
}
