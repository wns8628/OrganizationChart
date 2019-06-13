package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.EmpInfoManagementService;
import com.douzone.quicksilver.vo.ChangePasswordVo;
import com.douzone.quicksilver.vo.EmpInfoManagementVo;
import com.douzone.quicksilver.vo.GetPositionDutyVo;
import com.douzone.quicksilver.vo.ResetIdVo;

@Controller
@RequestMapping("/empInfoManage")
public class EmpInfoManagementController {

	@Autowired
	private EmpInfoManagementService empInfoManagementService;
	
	@ResponseBody
	@RequestMapping("/search")
	public JSONResult search(@ModelAttribute EmpInfoManagementVo empInfoManagementVo) {
		System.out.println(empInfoManagementVo);
		return JSONResult.success(empInfoManagementService.search(empInfoManagementVo));
	}
	
	@ResponseBody
	@RequestMapping("/resetId")
	public JSONResult resetId(@ModelAttribute ResetIdVo resetIdVo) {
		System.out.println(resetIdVo);
		return JSONResult.success(empInfoManagementService.resetId(resetIdVo));
	}
	
	@ResponseBody
	@RequestMapping("/changePassword")
	public JSONResult changePassword(@ModelAttribute ChangePasswordVo changePasswordVo) {
		System.out.println(changePasswordVo);
		return JSONResult.success(empInfoManagementService.changePassword(changePasswordVo));
	}
	
	@ResponseBody
	@RequestMapping("/checkDuplicateLoginId")
	public JSONResult checkDuplicateLoginId(@ModelAttribute ResetIdVo ResetIdVo) {
		System.out.println(ResetIdVo);
		return JSONResult.success(empInfoManagementService.checkDuplicateLoginId(ResetIdVo));
	}
	
	@ResponseBody
	@RequestMapping("/getPositionDuty")
	public JSONResult getPositionDuty(@RequestParam String compSeq) {
		System.out.println(compSeq);
		return JSONResult.success(empInfoManagementService.getPositionDuty(compSeq));
	}
	
	
	
}
