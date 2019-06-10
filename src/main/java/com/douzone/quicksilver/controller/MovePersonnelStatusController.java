package com.douzone.quicksilver.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.MovePersonnelStatusService;
import com.douzone.quicksilver.vo.MovePersonnelStatusVo;

@RequestMapping("/moveStatus")
@Controller
public class MovePersonnelStatusController{

	@Autowired
	private MovePersonnelStatusService movePersonnelStatusService;
	
	@ResponseBody
	@RequestMapping("/search")
	public JSONResult search(@ModelAttribute MovePersonnelStatusVo movePersonnelStatusVo) {
		return JSONResult.success( movePersonnelStatusService.search(movePersonnelStatusVo) );
	}
}
