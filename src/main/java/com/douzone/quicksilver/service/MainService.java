package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.MainDao;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.MasterGroupVo;

@Service
public class MainService {	

	@Autowired
	private MainDao mainDao;

	public MasterGroupVo getMainInfo(){
		return mainDao.get();
	}
	
	public List<CompanyVo> getMainChart(String langCode){
		return mainDao.get(langCode);
	}
}
