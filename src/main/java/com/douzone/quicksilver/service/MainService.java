package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.respository.MainDao;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Service
public class MainService {	
	
	@Autowired
	private MainDao mainDao;

	//리스트
	public Map<String, Object> list(){
		    
		List<CompanyVo> companyVoList = mainDao.get();
		List<DepartmentsVo> departmentsVoList = mainDao.getList();
		
		//System.out.println(companyVoList.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyVoList", companyVoList);
		map.put("departmentsVoList",departmentsVoList);

		return map;
	
	}	
}
