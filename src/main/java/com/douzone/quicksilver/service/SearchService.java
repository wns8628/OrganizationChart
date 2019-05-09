package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.SearchDao;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao searchDao;

	public List<EmployeesVo> Employeelist(String kwd, String selectSearch, String langCode){
		Map<String, Object> map = new HashMap<>();
		
		map.put("kwd", "%"+kwd+"%");
		map.put("selectSearch", selectSearch);
		map.put("langCode", langCode);
		return searchDao.getList(map);
	}
	
}
