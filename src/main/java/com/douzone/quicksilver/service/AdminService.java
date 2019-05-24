package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.AdminDao;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

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
	
	public BizVo getBizInfo(String bizSeq) {
		return adminDao.getBizInfo(bizSeq);
	}
	
	public DepartmentsVo getDeptInfo(String deptSeq) {
		return adminDao.getDeptInfo(deptSeq);
	}
	
	public void addComp(CompanyVo vo) {
		adminDao.insertComp(vo);
		CompanyVo compAll = adminDao.getCompAll(vo);
		compAll.setOpCode("I");
		System.out.println(compAll.getOpCode());
		adminDao.updateCompHistory(compAll);
		if("".equals(vo.getCompName()) == false) {
			System.out.println(vo.getCompName());
			vo.setLangCode("kr");
			adminDao.insertCompMulti(vo);
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			compMulti.setOpCode("I");
			adminDao.updateCompMultiHistory(compMulti);
		}
		if("".equals(vo.getCompNameEn()) == false) {
			vo.setLangCode("en");
			vo.setCompName(vo.getCompNameEn());
			adminDao.insertCompMulti(vo);
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			compMulti.setOpCode("I");
			adminDao.updateCompMultiHistory(compMulti);
		}
		
	}
	
	public void deleteComp(CompanyVo vo) {
		CompanyVo compAll = adminDao.getCompAll(vo);
		compAll.setOpCode("D");
		adminDao.updateCompHistory(compAll);
		adminDao.deleteComp(vo);
		if("".equals(vo.getCompName()) == false) {
			vo.setLangCode("kr");
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			compMulti.setOpCode("D");
			adminDao.updateCompMultiHistory(compMulti);
			adminDao.deleteCompMulti(vo);
		}
		if("".equals(vo.getCompNameEn()) == false) {
			vo.setLangCode("en");
			vo.setCompName(vo.getCompNameEn());
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			compMulti.setOpCode("D");
			adminDao.updateCompMultiHistory(compMulti);
			adminDao.deleteCompMulti(vo);
		}
	}
	
	public void updateComp(CompanyVo vo) {
		CompanyVo compAll = adminDao.getCompAll(vo);
		compAll.setOpCode("U");
		adminDao.updateCompHistory(compAll);
		adminDao.updateComp(vo);
		if("".equals(vo.getCompName()) == false) {
			vo.setLangCode("kr");
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			if("".equals(compMulti.getCompName())){
				vo.setOpCode("I");
				adminDao.insertCompMulti(vo);
				adminDao.updateCompMultiHistory(vo);
			}else if(vo.getCompName().equals(compMulti.getCompName()) == false) {
				compMulti.setOpCode("U");
				adminDao.updateCompMultiHistory(compMulti);
				adminDao.updateCompMulti(vo);
			}
		}else{
			vo.setLangCode("kr");
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			if("".equals(compMulti.getCompName()) == false) {
				compMulti.setOpCode("D");
				adminDao.updateCompMultiHistory(compMulti);
				adminDao.deleteCompMulti(vo);
			}
		}
		
		if("".equals(vo.getCompNameEn()) == false) {
			vo.setLangCode("en");
			vo.setCompName(vo.getCompNameEn());
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			if(compMulti == null){
				vo.setOpCode("I");
				adminDao.insertCompMulti(vo);
				adminDao.updateCompMultiHistory(vo);
			}else if(vo.getCompName().equals(compMulti.getCompName()) == false) {
				compMulti.setOpCode("U");
				adminDao.updateCompMultiHistory(compMulti);
				adminDao.updateCompMulti(vo);
			}
		}else{
			vo.setLangCode("en");
			vo.setCompName(vo.getCompNameEn());
			CompanyVo compMulti = adminDao.getCompMultiAll(vo);
			if(compMulti != null) {
				compMulti.setOpCode("D");
				adminDao.updateCompMultiHistory(compMulti);
				adminDao.deleteCompMulti(vo);
			}
		}
	}
	
	public DepartmentsVo updateParentDept(String deptSeq, String parentDeptSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptSeq", deptSeq);
		map.put("parentDeptSeq", parentDeptSeq);
		adminDao.updateDeptSeq(map);
		return adminDao.getDeptForTree(deptSeq);
	}
	
}
