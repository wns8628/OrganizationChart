package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.RankPositionManagementService;
import com.douzone.quicksilver.vo.CompanyVo;

@Controller
public class RankPositionManagementController {


	@Autowired private RankPositionManagementService rPMService;

	@RequestMapping("/rPMSearch") 
	public JSONResult rPMSearch(@RequestParam String compSeq,
							@RequestParam String position,
							@RequestParam String useCheck) { 
	
		return JSONResult.success(rPMService.search(compSeq, position, useCheck)); 
	}


}
