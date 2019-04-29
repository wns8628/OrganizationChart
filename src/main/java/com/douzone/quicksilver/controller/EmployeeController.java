package com.douzone.quicksilver.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.EmployeeService;
import com.douzone.quicksilver.service.FileuploadService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private FileuploadService fileuploadService;
	
//	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
//	public void addEmployee(@ModelAttribute EmployeesVo employeesVo) {
//		
//		System.out.println("employeesVo : " + employeesVo);
//		employeeService.insertEmployee(employeesVo);
//	}
	
	@ResponseBody
	@RequestMapping("/getdetailEmployeeInfo/{empNum}/{langCode}")
	public JSONResult getdetailEmployeeInfo(@PathVariable String empNum,
											@PathVariable String langCode) {
		EmployeesVo employeesVo = new EmployeesVo();
		employeesVo.setEmpNum(empNum);
		employeesVo.setLangCode(langCode);
		
		return JSONResult.success(employeeService.getdetailEmployeeInfo(employeesVo));
	}
	
	@ResponseBody
	@RequestMapping("/getEmpInfo/{seq}/{type}")
	public JSONResult getEmpInfo(@PathVariable String seq,
								 @PathVariable String type,
								HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(employeeService.getEmpInfo(seq, type,langCode));
	}
	
	@RequestMapping(value = "/profileImageUpload", method = RequestMethod.POST)
	public void profileImageUpload(@RequestPart("profilePicture") MultipartFile profilePicture) throws IOException {
		System.out.println("여어기까지왔다");
		
		System.out.println(profilePicture.getOriginalFilename());
		fileuploadService.restore(profilePicture);
		//profilePicture.write("/test/" + profilePicture.getSubmittedFileName());
		
	}
}
