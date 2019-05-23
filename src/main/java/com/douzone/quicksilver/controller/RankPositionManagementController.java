package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.RankPositionManagementService;
import com.douzone.quicksilver.vo.CompanyVo;

@Controller
public class RankPositionManagementController {


	@Autowired private RankPositionManagementService rPMService;

	@ResponseBody
	@RequestMapping("/rPMSearch/{compSeq}/{useCheck}") 
	public JSONResult rPMSearch(@PathVariable String compSeq,
							@RequestParam (value = "kwd", required = false, defaultValue = "" ) String kwd,
							@PathVariable String useCheck,
							@RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode,
							@RequestParam (value = "position", required = false, defaultValue = "position") String position) { 
	
		System.out.println("compSeq : " + compSeq);
		System.out.println("kwd : " + kwd);
		System.out.println("useCheck : " + useCheck);
		System.out.println("langCode : " + langCode);
		System.out.println("position : " + position);
		
		return JSONResult.success(rPMService.search(compSeq, kwd, useCheck, langCode, position)); 
	}


}
