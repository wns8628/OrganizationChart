package com.douzone.quicksilver.controller;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.AdminService;
import com.douzone.quicksilver.service.NaviService;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

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
	
	
	@RequestMapping("/connectDeptEmp")
	public String connectDeptEmp( Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		
		return "admin/connect-deptEmp-mgr";
	}
	
	@RequestMapping("/rankPositionManagement")
	public String rankPositionManagement(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/rankPositionManagement";
	}
	
	@RequestMapping("/movePersonnelStatus")
	public String movePersonnelStatus(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/movePersonnelStatus";
	}
	
	@RequestMapping("/movePersonnel")
	public String movePersonnel(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/movePersonnel";
	}
	
	@RequestMapping("/popup")
	public String popup() {
//		model.addAttribute("companyList", naviService.getCompList(langCode));
		return "admin/popup";
	}
	
	
	@RequestMapping("/popup/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/admin/popup";
	}
	
	@RequestMapping("/compMgr")
	public String compMgr(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		model.addAttribute("firstCompInfo", adminService.getCompInfo(compList.get(0).getCompSeq()));
		return "admin/comp-mgr";
	}
	
	@RequestMapping("/deptMgr")
	public String deptMgr(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/dept-mgr";
	}
	
	@ResponseBody
	@RequestMapping("/getCompInfo/{compSeq}")
	public JSONResult getCompInfo(@PathVariable("compSeq") String compSeq) {
		return JSONResult.success(adminService.getCompInfo(compSeq));
	}
	
	@ResponseBody
	@RequestMapping("/getBizInfo/{bizSeq}")
	public JSONResult getBizInfo(@PathVariable("bizSeq") String bizSeq) {
		return JSONResult.success(adminService.getBizInfo(bizSeq));
	}
	
	@ResponseBody
	@RequestMapping("/getDeptInfo/{deptSeq}")
	public JSONResult getDeptInfo(@PathVariable("deptSeq") String deptSeq) {
		return JSONResult.success(adminService.getDeptInfo(deptSeq));
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
	
	@ResponseBody
	@RequestMapping("/map")
	public JSONResult map() {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("department", "부서");
		map.put("buildings", map2);
		return JSONResult.success(map);
	}
	
//	@ResponseBody
//	@RequestMapping("/getDeptInfo/{deptSeq}")
//	public JSONResult getDeptInfo(@PathVariable("deptSeq") String seq) {
//		
//		return JSONResult.success();
//	}
	
	
	//////navi
	@ResponseBody
	@RequestMapping("/getComp")
	public JSONResult getCompList() {
		return JSONResult.success(naviService.getCompList());
	}
	
	@ResponseBody
	@RequestMapping("/getBiz/{seq}")
	public JSONResult getBizList(@PathVariable String seq) {
		return JSONResult.success(naviService.getBizList(seq));
	}
	
	@ResponseBody
	@RequestMapping("/getDept/{seq}")
	public JSONResult getDeptList(@PathVariable String seq) {
		return JSONResult.success(naviService.getDeptList(seq));
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
	
	@ResponseBody
	@RequestMapping("/updateParentDept")
	public JSONResult updateParentDept(@RequestParam("deptSeq") String deptSeq, 
										@RequestParam("parentDeptSeq") String parentDeptSeq) {
		return JSONResult.success(adminService.updateParentDept(deptSeq, parentDeptSeq));
	}
	
	@ResponseBody
	@RequestMapping("/insertBiz")
	public JSONResult insertBiz(@ModelAttribute BizVo vo) {
		adminService.insertBiz(vo);
		return JSONResult.success(adminService.getBizInfo(vo.getBizSeq()));
	}
	
	@ResponseBody
	@RequestMapping("/insertDept")
	public JSONResult insertDept(@ModelAttribute DepartmentsVo vo) {
		adminService.insertDept(vo);
		return JSONResult.success(adminService.getDeptInfo(vo.getDeptSeq()));
	}
	
	@ResponseBody
	@RequestMapping("/updateBiz")
	public JSONResult updateBiz(@ModelAttribute BizVo vo) {
		adminService.updateBiz(vo);
		return JSONResult.success(adminService.getBizInfo(vo.getBizSeq()));
	}
	
	@ResponseBody
	@RequestMapping("/updateDept")
	public JSONResult updateDept(@ModelAttribute DepartmentsVo vo) {
		adminService.updateDept(vo);
		return JSONResult.success(adminService.getDeptInfo(vo.getDeptSeq()));
	}
	
	@ResponseBody
	@RequestMapping("/seqCheck/{seq}")
	public JSONResult updateDept(@PathVariable("seq") String seq) {
		return JSONResult.success(adminService.seqCheck(seq));
	}
}
