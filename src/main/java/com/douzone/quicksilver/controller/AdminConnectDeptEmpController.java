package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.AdminConnectDeptEmpService;
import com.douzone.quicksilver.vo.AdminConnectDeptEmpVo;

@Controller
@RequestMapping("/adminConnectDeptEmp")
public class AdminConnectDeptEmpController {

	@Autowired
	AdminConnectDeptEmpService adminConnectDeptEmpService;
	
	@ResponseBody
	@RequestMapping("/searchEmpAjax")
	public JSONResult searchEmpAjax(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo,
									@RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode) {
		
		adminConnectDeptEmpVo.setLangCode(langCode);													//다국어설정 
		List<AdminConnectDeptEmpVo> result;																//결과값저장위해사용변수
		
		if(adminConnectDeptEmpVo.getLoginId() == null) {												//검색클릭시 여기로옴
			adminConnectDeptEmpVo.setKwd("%"+adminConnectDeptEmpVo.getKwd() + "%");						//like검색위해 세팅
			result = adminConnectDeptEmpService.getConnectDeptEmpList(adminConnectDeptEmpVo);
		} else {																					    //직원클릭시 여기로옴
			result = adminConnectDeptEmpService.getConnectDeptEmpClickList(adminConnectDeptEmpVo);
		}
		
		
		return JSONResult.success(result);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/empDetailRender")
	public JSONResult empDetailRender(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo,
									  @RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode) {
		
		adminConnectDeptEmpVo.setLangCode(langCode);													//다국어설정 
	
		return JSONResult.success(adminConnectDeptEmpService.getEmpDetailRender(adminConnectDeptEmpVo));
	}
	
	@ResponseBody
	@RequestMapping("/empDetailPositionDutyRender")
	public JSONResult empDetailPositionDutyRender(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo,
												  @RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode) {
		
		adminConnectDeptEmpVo.setLangCode(langCode);													//다국어설정 
	
		return JSONResult.success(adminConnectDeptEmpService.empDetailPositionDutyRender(adminConnectDeptEmpVo));
	}
	
}
