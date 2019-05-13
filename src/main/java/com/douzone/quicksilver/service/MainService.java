package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.MainDao;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.MasterGroupVo;

@Service
public class MainService {	

	@Autowired
	private MainDao mainDao;

	//회사별
	public MasterGroupVo getMainInfo(){
		return mainDao.get();
	}
	public List<CompanyVo> getMainChart(String langCode){
		return mainDao.getList(langCode);
	}
	
	//사업장별
	public CompanyVo getCompChart(CompanyVo companyvo){
		return mainDao.get(companyvo);
	}
	public List<BizVo> getBizChart(BizVo bizvo){
		return mainDao.getList(bizvo);
	}
}
