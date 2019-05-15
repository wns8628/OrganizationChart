package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.service.NaviService;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;

@Controller
public class MainBoot {

	@Autowired
	MainService mainService;
	@Autowired
	NaviService naviService;
	
	@RequestMapping("")
	public String main(HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
			session.setAttribute("langCode", langCode);
		}
		
		return "main/main";
	}
	
	@RequestMapping("/boot")
	public String main(Model model, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
			session.setAttribute("langCode", langCode);
		}
		
		model.addAttribute("companyList", naviService.getCompList(langCode));

		//차트관련 
//		model.addAttribute("mainInfo", mainService.getMainInfo());

		return "quicksilverboot/main";
	}
	@RequestMapping("/boot/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/boot";
	}
	
	
//-차트관련----------------------------------------------------------------------------------
	//차트관련
	@ResponseBody
	@RequestMapping("/getMainChart")
	public JSONResult getMainChart(HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}

		return JSONResult.success(mainService.getMainChart(langCode));
	}
	
	//차트관련
    @ResponseBody	  
    @RequestMapping("/getBizInfo/{compSeq}")
    public JSONResult getBizInfo(HttpSession session,
		  	 				     @ModelAttribute CompanyVo companyvo){
	  
		String langCode = (String)session.getAttribute("langCode");		
		if(langCode == null) { 
			langCode = "kr"; 
		}
		
		companyvo.setLangCode(langCode);
		return JSONResult.success(mainService.getCompChart(companyvo));
	}
    //차트관련
    @ResponseBody	  
    @RequestMapping("/getBizChart/{compSeq}")
    public JSONResult getBizChart(HttpSession session,  
		  	 				      @ModelAttribute BizVo bizvo){
	  
		String langCode = (String)session.getAttribute("langCode");		
		if(langCode == null) { 
			langCode = "kr"; 
		}
		
		bizvo.setLangCode(langCode);
		return JSONResult.success(mainService.getBizChart(bizvo));
	}
//------------------------------------------------------------------------------------    
    
    
    
}
