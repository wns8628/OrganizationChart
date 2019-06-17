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
import com.douzone.quicksilver.service.FileuploadService;
import com.douzone.quicksilver.vo.AddEmpVo;
import com.douzone.quicksilver.vo.ChangePasswordVo;
import com.douzone.quicksilver.vo.EmpInfoManagementVo;
import com.douzone.quicksilver.vo.GetPositionDutyVo;
import com.douzone.quicksilver.vo.RemoveEmpInfoVo;
import com.douzone.quicksilver.vo.ResetIdVo;

@Controller
@RequestMapping("/empInfoManage")
public class EmpInfoManagementController {

	@Autowired
	private EmpInfoManagementService empInfoManagementService;
	
	@Autowired
	private FileuploadService fileuploadService;
	
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
	
	@ResponseBody
	@RequestMapping("/addEmp")
	public void addEmp(@ModelAttribute AddEmpVo addEmpVo) {
		System.out.println(addEmpVo);
		String profilePicturePath = null;
		
		if( addEmpVo.getFile().getOriginalFilename().equals("default")) { // 사진을 보내지않음
			profilePicturePath = "/uploads/images/defaultman.png";
		} else {
			profilePicturePath = fileuploadService.restore(addEmpVo.getFile());
		}
		
		System.out.println(profilePicturePath);
		addEmpVo.setPicPath(profilePicturePath);

		
		// insert t_co_emp2
		empInfoManagementService.addEmp(addEmpVo);
		System.out.println(addEmpVo.getEmpSeq()); // 넣었던 empSeq을 가져옴
		
		// insert t_co_emp_multi 'kr'
		empInfoManagementService.add_t_co_emp_multi(addEmpVo, true);
		
		// insert t_co_emp_multi 'en'
		empInfoManagementService.add_t_co_emp_multi(addEmpVo, false);
		
		// insert t_co_emp_dept
		empInfoManagementService.add_t_co_emp_dept(addEmpVo);
		
		// insert t_co_emp_comp
		empInfoManagementService.add_t_co_emp_comp(addEmpVo);
	}
	
	@ResponseBody
	@RequestMapping("/removeEmpInfo")
	public JSONResult removeEmpInfo(@ModelAttribute RemoveEmpInfoVo removeEmpInfoVo) {
		System.out.println(removeEmpInfoVo);
		return JSONResult.success(empInfoManagementService.removeEmpInfo(removeEmpInfoVo));
	}
	
	
	
}