package com.douzone.quicksilver.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.service.SearchService;

@Controller
@RequestMapping("boot/search")
public class SearchController {
	
	@Autowired
	private SearchService searchService;
		
	// 검색하여 직원정보를 테이블에 출력 
	// selectSearch는 부서검색, 이름검색 등 선택한 숫자값을 가져옴
	//1은 이름 , 2는 부서 , 3은 통합?
	@ResponseBody
	@RequestMapping("/{selectSearch}/{kwd}")
	public JSONResult search( @PathVariable String selectSearch,
								@PathVariable String kwd, HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}
		return JSONResult.success(searchService.Employeelist(kwd, selectSearch, langCode));
	}
	
}
