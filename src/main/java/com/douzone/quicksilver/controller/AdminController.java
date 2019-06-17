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
import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.service.NaviService;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;

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
	
// --	
	@Autowired
	MainService mainService;
	@RequestMapping("/chart")
	public String chart( Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		model.addAttribute("mainInfo", mainService.getMainInfo());
		model.addAttribute("mainInfoFm", mainService.getMainInfoFm());
		
		
		return "admin/chart-mgr";
	}
// --
	
	@RequestMapping("/connectDeptEmp")
	public String connectDeptEmp( Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		
		return "admin/connect-deptEmp-mgr";
	}

	@RequestMapping("/empManagement")
	public String empManagement(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/empManagement/emp-mgr";
	}
	
	@RequestMapping("/addEmp")
	public String addEmp(Model model) {
		List<CompanyVo> compList = adminService.getCompList();
		model.addAttribute("compList", compList);
		return "admin/empManagement/add-emp";
	}
	
	@RequestMapping("/deptFind")
	public String deptFind(Model model) {
		/*
		 * List<CompanyVo> compList = adminService.getCompList();
		 * model.addAttribute("compList", compList);
		 */
		return "admin/empManagement/connect-deptEmp-search-emp-mgr";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "admin/empManagement/jusoPopup";
	}
	
	
	@RequestMapping("/deleteEmp")
	public String deleteEmp(Model model) {
		//List<CompanyVo> compList = adminService.getCompList();
		//model.addAttribute("compList", compList);
		return "admin/empManagement/delete-emp";
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(Model model) {
		//List<CompanyVo> compList = adminService.getCompList();
		//model.addAttribute("compList", compList);
		return "admin/empManagement/reset-emp";
	}
	
	@RequestMapping("/resetIdEmp")
	public String resetIdEmp(Model model) {
		//List<CompanyVo> compList = adminService.getCompList();
		//model.addAttribute("compList", compList);
		return "admin/empManagement/resetid-emp";
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
	
	@RequestMapping("/movePopup/{compSeq}")
	public String movePopup(@PathVariable("compSeq") String compSeq, Model model) {
		model.addAttribute("dutyList", adminService.getDutyListByCompSeq(compSeq));
		model.addAttribute("positionList", adminService.getPositionListByCompSeq(compSeq));
		model.addAttribute("compInfo", adminService.getCompInfo(compSeq));
		return "admin/move-popup";
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
	
	@RequestMapping("/fileApi")
	public String fileApi() {
		return "admin/empManagement/fileApi";
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
	
	@ResponseBody
	@RequestMapping("/getEmpListByDeptSeq/{deptSeq}")
	public JSONResult getEmpListByDeptSeq(@PathVariable("deptSeq") String deptSeq,
											@RequestParam("sortType") String sortType) {
		return JSONResult.success(adminService.getEmpListByDeptSeq(deptSeq, sortType));
	}
	
	@ResponseBody
	@RequestMapping("/updateEmpDept")
	public JSONResult updateEmpDept(@ModelAttribute EmployeeDeptInfoVo vo) {
		adminService.updateEmpDept(vo);
		return JSONResult.success("dd");
	}
	
	@ResponseBody
	@RequestMapping("/getParentDeptSeq/{deptSeq}")
	public JSONResult getParentDeptSeq(@PathVariable("deptSeq") String deptSeq) {
		return JSONResult.success(adminService.getParentDeptSeq(deptSeq));
	}
}
