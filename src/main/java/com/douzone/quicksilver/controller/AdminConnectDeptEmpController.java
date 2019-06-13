package com.douzone.quicksilver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.AdminConnectDeptEmpService;
import com.douzone.quicksilver.service.AdminService;
import com.douzone.quicksilver.vo.AdminConnectDeptEmpVo;
import com.douzone.quicksilver.vo.CompanyVo;

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
	
		System.out.println(adminConnectDeptEmpVo.getCompSeq());
		return JSONResult.success(adminConnectDeptEmpService.empDetailPositionDutyRender(adminConnectDeptEmpVo));
	}
	//사번가져오기
	@ResponseBody
	@RequestMapping("/getEmpSeq")
	public JSONResult getEmpSeq(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo,
								@RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode) {
		
		adminConnectDeptEmpVo.setLangCode(langCode);													//다국어설정 
		System.out.println( adminConnectDeptEmpVo.toString());
		
		return JSONResult.success(adminConnectDeptEmpService.getEmpSeq(adminConnectDeptEmpVo));
	}
	//사업장번호가져오기
	@ResponseBody
	@RequestMapping("/getBizSeq")
	public JSONResult getEmpSeq(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo) {

		return JSONResult.success(adminConnectDeptEmpService.getBizSeq(adminConnectDeptEmpVo));
	}
	//----------------부서검색 새로운팝업창띄워서 하는거
	@Autowired
	private AdminService adminService;
	@RequestMapping("/deptSearch")
	public String deptSearch(Model model, @RequestParam (value = "compSeq", required = false, defaultValue = "1") String compSeq,
										  @RequestParam (value = "compName", required = false, defaultValue = "QS전자") String compName) {
		
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		model.addAttribute("compSeq", compSeq);
		model.addAttribute("compName", compName);
		
		return "admin/connect-deptEmp-search-dept-mgr";
	}
	
	//신규 겸직추가 
	@ResponseBody
	@RequestMapping("/plusDept")
	public JSONResult plusDept(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
		
	
		 int result = adminConnectDeptEmpService.plusDept(adminConnectDeptEmpVo);
		
		return JSONResult.success(result);
	}
	//겸직or부서 수정 시 
	@ResponseBody
	@RequestMapping("/plusUpdate")
	public JSONResult plusUpdate(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
	    
		int result = adminConnectDeptEmpService.plusUpdate(adminConnectDeptEmpVo);
		
	    
		return JSONResult.success(result);
	}
	//겸직삭제
	@ResponseBody
	@RequestMapping("/deleteDept")
	public JSONResult deleteDept(@ModelAttribute AdminConnectDeptEmpVo adminConnectDeptEmpVo) {
	    
		int result = adminConnectDeptEmpService.deleteDept(adminConnectDeptEmpVo);
		
	    
		return JSONResult.success(result);
	}
}
