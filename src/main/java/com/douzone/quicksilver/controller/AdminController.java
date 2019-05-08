package com.douzone.quicksilver.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.AdminService;
import com.douzone.quicksilver.vo.CompanyVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping({"","/main"})
	public String main() {
		
		return "main/admin";
	}
	
	@RequestMapping("/compMgr")
	public String compMgr(HttpSession session, Model model) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		List<CompanyVo> compList = adminService.getCompList(langCode);
		model.addAttribute("compList", compList);
		model.addAttribute("firstCompInfo", adminService.getCompInfo(compList.get(0).getCompSeq()));
		return "admin/comp-mgr";
	}
	
	@ResponseBody
	@RequestMapping("/getCompInfo/{compSeq}")
	public JSONResult getCompInfo(@PathVariable("compSeq") String compSeq) {
		return JSONResult.success(adminService.getCompInfo(compSeq));
	}
	
	@ResponseBody
	@RequestMapping("/addComp")
	public JSONResult addComp(@ModelAttribute CompanyVo vo) {
		System.out.println(vo);
		adminService.addComp(vo);
		
		System.out.println(vo.getCompSeq());
		return JSONResult.success(vo.getCompSeq());
	}
}
