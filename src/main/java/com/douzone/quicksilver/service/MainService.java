package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.MainDao;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.MasterGroupVo;

@Service
public class MainService {	

	@Autowired
	private MainDao mainDao;

	//회사별
	public MasterGroupVo getMainInfo(){
		return mainDao.get();
	}
	public List<MasterGroupVo> getMainInfoFm(){
		return mainDao.getFm();
	}
	public List<CompanyVo> getMainChart(String langCode){
		return mainDao.getList(langCode);
	}
	
	//사업장별
	public CompanyVo getCompChart(CompanyVo companyvo){
		return mainDao.get(companyvo);
	}
	public List<CompanyVo> getCompChartFm(CompanyVo companyvo){
		return mainDao.getFm(companyvo);
	}
	public List<BizVo> getBizChart(BizVo bizvo){
		return mainDao.getList(bizvo);
	}
	
	public EmployeesVo get1(int empSeq) {
		return mainDao.get1(empSeq);
	}
	
	public String get2(String compSeq, String positionCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compSeq", compSeq);
		map.put("positionCode", positionCode);
		return mainDao.get2(map);
	}
	
	public int update1(long empSeq, String positionCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empSeq", empSeq);
		map.put("positionCode", positionCode);
		
		System.out.println("empSeq : " + empSeq);
		System.out.println("positionCode : " + positionCode);
		System.out.println("MAP : " + map);
		
		return mainDao.update1(map);
	}
	
	public int update2(long empSeq, String dutyCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empSeq", empSeq);
		map.put("dutyCode", dutyCode);
		
		return mainDao.update2(map);
	}
}
