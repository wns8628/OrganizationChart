package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.respository.SearchDao;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao searchDao;

	public List<EmployeesVo> Employeelist(String kwd){
		System.out.println(kwd);
		return searchDao.getList(kwd);
	}
	
}
