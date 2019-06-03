package com.douzone.quicksilver.service;

import java.util.ArrayList;
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
		map.put("parentDeptSeq", Integer.parseInt(parentDeptSeq));
		adminDao.updateDeptSeq(map);
		
		return adminDao.getDeptForTree(deptSeq);
	}
	
	public void insertBiz(BizVo vo) {
		vo.setOpCode("I");
		adminDao.insertBiz(vo);
		adminDao.insertBizHistory(vo);
		
		if("".equals(vo.getBizName()) == false) {
			vo.setLangCode("kr");
			adminDao.insertBizMulti(vo);
			adminDao.insertBizMultiHistory(vo);
		}
		if("".equals(vo.getBizNameEn()) == false) {
			vo.setLangCode("en");
			vo.setBizName(vo.getBizNameEn());
			adminDao.insertBizMulti(vo);
			adminDao.insertBizMultiHistory(vo);
		}
		
	}
	
	public void insertDept(DepartmentsVo vo) {
		vo.setOpCode("I");
		adminDao.insertDept(vo);
		adminDao.insertDeptHistory(vo);
		
		if("".equals(vo.getDeptName()) == false) {
			vo.setLangCode("kr");
			adminDao.insertDeptMulti(vo);
			adminDao.insertDeptMultiHistory(vo);
		}
		if("".equals(vo.getDeptNameEn()) == false) {
			vo.setLangCode("en");
			vo.setBizName(vo.getDeptNameEn());
			adminDao.insertDeptMulti(vo);
			adminDao.insertDeptMultiHistory(vo);
		}
		
	}
	
	public void updateBiz(BizVo vo) {
		BizVo bizAll = adminDao.getBizAll(vo.getBizSeq());
		bizAll.setOpCode("U");
		adminDao.insertBizHistory(bizAll);
		adminDao.updateBiz(vo);
		
		vo.setLangCode("kr");
		BizVo bizMultiAll = adminDao.getBizMultiAll(vo);
		if(!vo.getBizName().equals(bizMultiAll.getBizName()) ) {
			bizMultiAll.setOpCode("U");
			adminDao.insertBizMultiHistory(bizMultiAll);
			adminDao.updateBizMulti(vo);
		}
		
		if("".equals(vo.getBizNameEn()) == false) {
			vo.setLangCode("en");
			vo.setBizName(vo.getBizNameEn());
			BizVo bizMultiEn = adminDao.getBizMultiAll(vo);
			if(bizMultiEn == null) {
				vo.setOpCode("I");
				adminDao.insertBizMulti(vo);
				adminDao.insertBizMultiHistory(vo);
			}else if(vo.getBizName().equals(bizMultiEn.getBizName()) == false) {
				bizMultiEn.setOpCode("U");
				adminDao.insertBizMultiHistory(bizMultiEn);
				adminDao.updateBizMulti(vo);
			}
		}else {
			vo.setLangCode("en");
			vo.setBizName(vo.getBizNameEn());
			BizVo bizMultiEn = adminDao.getBizMultiAll(vo);
			if(bizMultiEn != null) {
				bizMultiEn.setOpCode("D");
				adminDao.insertBizMultiHistory(bizMultiEn);
				adminDao.deleteBizMulti(vo);
			}
		}
	}
	
	public void updateDept(DepartmentsVo vo) {
		DepartmentsVo deptAll = adminDao.getDeptAll(vo);
		deptAll.setOpCode("U");
		adminDao.insertDeptHistory(deptAll);
		adminDao.updateDept(vo);
		
		vo.setLangCode("kr");
		DepartmentsVo deptMultiAll = adminDao.getDeptMultiAll(vo);
		if(!vo.getBizName().equals(deptMultiAll.getDeptName()) ) {
			deptMultiAll.setOpCode("U");
			adminDao.insertDeptMultiHistory(deptMultiAll);
			adminDao.updateDeptMulti(vo);
		}
		
		if("".equals(vo.getDeptNameEn()) == false) {
			vo.setLangCode("en");
			vo.setDeptName(vo.getDeptNameEn());
			DepartmentsVo deptMultiEn = adminDao.getDeptMultiAll(vo);
			if(deptMultiEn == null) {
				vo.setOpCode("I");
				adminDao.insertDeptMulti(vo);
				adminDao.insertDeptMultiHistory(vo);
			}else if(vo.getDeptName().equals(deptMultiEn.getBizName()) == false) {
				deptMultiEn.setOpCode("U");
				adminDao.insertDeptMultiHistory(deptMultiEn);
				adminDao.updateDeptMulti(vo);
			}
		}else {
			vo.setLangCode("en");
			vo.setDeptName(vo.getDeptNameEn());
			DepartmentsVo deptMultiEn = adminDao.getDeptMultiAll(vo);
			if(deptMultiEn != null) {
				deptMultiEn.setOpCode("D");
				adminDao.insertDeptMultiHistory(deptMultiEn);
				adminDao.deleteDeptMulti(vo);
			}
		}
	}
	
	public List<String> seqCheck(String seq){
		List<String> seqList = new ArrayList<String>();
		seqList.add(adminDao.bizSeqCheck(seq));
		seqList.add(adminDao.deptSeqCheck(seq));
		return seqList;
	}
}
