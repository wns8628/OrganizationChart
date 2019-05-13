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
import com.douzone.quicksilver.service.NaviService;
import com.douzone.quicksilver.vo.CompanyVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private NaviService naviService;
	
	@RequestMapping({"","/main"})
	public String main() {
		
		return "main/admin";
	}
	
	@RequestMapping("/popup")
	public String popup(Model model, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		model.addAttribute("companyList", naviService.getCompList(langCode));
		return "admin/popup";
	}
	
	@RequestMapping("/popupTest")
	public String popupTest(Model model, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		model.addAttribute("companyList", naviService.getCompList(langCode));
		return "admin/popup-test";
	}
	
	@RequestMapping("/popup/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/admin/popup";
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
		adminService.addComp(vo);
		
		return JSONResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping("/deleteComp")
	public JSONResult deleteComp(@ModelAttribute CompanyVo vo) {
		adminService.deleteComp(vo);
		return JSONResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping("/updateComp")
	public JSONResult updateComp(@ModelAttribute CompanyVo vo) {
		adminService.updateComp(vo);
		return JSONResult.success("성공");
	}
	
	
	//////navi
	
	@ResponseBody
	@RequestMapping("/getBiz/{seq}")
	public JSONResult getBizList(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getBizList(seq, langCode));
	}
	
	@ResponseBody
	@RequestMapping("/getDept/{seq}")
	public JSONResult getDeptList(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getDeptList(seq, langCode));
	}
	
	@ResponseBody
	@RequestMapping("/getEmpInfoByDept/{seq}")
	public JSONResult getEmpInfo(@PathVariable String seq, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(naviService.getEmpInfo(seq, langCode));
	}
}
