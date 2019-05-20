package com.douzone.quicksilver.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.SearchService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Controller
@RequestMapping("boot/search")
public class SearchController {
	
	@Autowired
	private SearchService searchService;
		
	// 검색하여 직원정보를 세션에저장
	@ResponseBody
	@RequestMapping("/{selectSearch}/{kwd}")
	public JSONResult search( @PathVariable String selectSearch,
							  @PathVariable String kwd,
							  HttpSession session,
							  @RequestParam (value="pageNo",required=false, defaultValue="1") Integer pageNo) {
		
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		
		List<EmployeesVo> searchData = searchService.Employeelist(kwd, selectSearch, langCode, pageNo);
		
		session.setAttribute( "searchCode", searchData); //PageNO불필요하겠지?
		session.setAttribute( "searchCount", searchData.size()); 		
		
//		return JSONResult.success(searchService.Employeelist(kwd, selectSearch, langCode, pageNo));
		return JSONResult.success(null);
		
	}
	
}
