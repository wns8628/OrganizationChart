package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.AdminDao;
import com.douzone.quicksilver.vo.CompanyVo;

@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	
	public List<CompanyVo> getCompList(String langCode){
		return adminDao.getCompList(langCode);
	}
	
	public CompanyVo getCompInfo(String compSeq) {
		return adminDao.getCompInfo(compSeq);
	}
	
	public void addComp(CompanyVo vo) {
		adminDao.insertComp(vo);
		adminDao.insertCompHistory(vo);
		if("".equals(vo.getCompName()) == false) {
			System.out.println(vo.getCompName());
			vo.setLangCode("kr");
			adminDao.insertCompMulti(vo);
		}
		if("".equals(vo.getCompNameEn()) == false) {
			vo.setLangCode("en");
			vo.setCompName(vo.getCompNameEn());
			adminDao.insertCompMulti(vo);
		}
		
	}
}
