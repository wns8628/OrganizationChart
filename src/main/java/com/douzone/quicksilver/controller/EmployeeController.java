package com.douzone.quicksilver.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.EmployeeService;
import com.douzone.quicksilver.service.FileuploadService;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private FileuploadService fileuploadService;
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public void addEmployee(@ModelAttribute EmployeesVo employeesVo) {
		
		System.out.println("employeesVo : " + employeesVo);
		employeeService.insertEmployee(employeesVo);
	}
	
	@ResponseBody
	@RequestMapping("/getdetailEmployeeInfo/{empSeq}/{deptSeq}")
	public JSONResult getdetailEmployeeInfo(@ModelAttribute EmployeesVo employeesvo,
											HttpSession session) {
		
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}

		employeesvo.setLangCode(langCode);

		return JSONResult.success(employeeService.getdetailEmployeeInfo(employeesvo));
	}

	
	// --------------------------
	
	
	@ResponseBody
	@RequestMapping("/getdetailNavPoint/{empSeq}/{deptSeq}")
	public JSONResult getdetailNavPoint(@ModelAttribute EmployeeDeptInfoVo employeedeptinfovo) {
	
		return JSONResult.success(employeeService.getdetailNavPoint(employeedeptinfovo));
	}

	@ResponseBody
	@RequestMapping("/getdetailNavPointParents/{deptSeq}")
	public JSONResult getdetailNavPointParents(@ModelAttribute DepartmentsVo departmentsvo,
									   	 	   HttpSession session) {
		
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		departmentsvo.setLangCode(langCode);
		
		return JSONResult.success(employeeService.getdetailNavPointParents(departmentsvo));
	}
	
	@ResponseBody
	@RequestMapping("/getEmpInfo/{seq}/{type}")
	public JSONResult getEmpInfo(@PathVariable String seq,
								 @PathVariable String type,			
								 @RequestParam (value="pageNo",required=false, defaultValue="1") Integer pageNo,
								 @RequestParam (value = "sorting", required = false, defaultValue = "asc") String sorting,
								 @RequestParam (value = "column", required = false, defaultValue = "empSeq + 0") String column,
								 @RequestParam (value = "langCode", required = false, defaultValue = "kr") String langCode,
								 HttpSession session) {
				
		return JSONResult.success(employeeService.getEmpInfo(seq, type,langCode, pageNo, sorting, column , session));
	}
	
	
	
	@RequestMapping(value = "/profileImageUpload", method = RequestMethod.POST)
	public String profileImageUpload(@RequestPart("profilePicture") MultipartFile profilePicture,
								   @RequestParam("empSeq") String empSeq) throws IOException {
		
		
		System.out.println(profilePicture.getOriginalFilename());
		String profilePicturePath = fileuploadService.restore(profilePicture);
		System.out.println(profilePicturePath);
		
		System.out.println("empSeq : " + empSeq);
		fileuploadService.updateProfilePicture(profilePicturePath, empSeq);
		//profilePicture.write("/test/" + profilePicture.getSubmittedFileName());
		
		return "redirect:/boot";
	}
	
	@ResponseBody
	@RequestMapping("/getDpAll")
	public JSONResult getDpAll() {
		return JSONResult.success(employeeService.getDpAll());
	}
}
