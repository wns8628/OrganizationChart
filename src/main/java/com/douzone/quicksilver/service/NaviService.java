package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.NaviDao;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Service
public class NaviService {
	@Autowired
	private NaviDao naviDao;
	
	// 자회사리스트
	public List<CompanyVo> companyList(){
		return naviDao.getCompanyList();
	}

	public List<DepartmentsVo> deptList(){
		return naviDao.getDeptList();
	}
		
//	public void addDept(int i) {
//		int pNo = random(((i*1000)+(i+1)), (naviDao.getCount()+i) + 1);
//		if(pNo == ((i*1000)+(i+1))) {
//			pNo *= -1; 
//			String deptName = "부서"+(naviDao.getCountByPno(pNo)+1);
//			addDepartment(pNo, deptName);
//		}else {
//			String deptName = naviDao.getNameByPno(pNo)+"-"+(naviDao.getCountByPno(pNo)+1);
//			addDepartment(pNo, deptName);
//		}
//		
//	}
	
	public void autoSet(int num) {
		naviDao.autoSet(num);
	}
	
	public int random(int n1, int n2) {
		return (int)(Math.random()*(n2 - n1 + 1))+n1;
	}
	
	public List<DepartmentsVo> getDeptByPno(int parents){
		return naviDao.getDeptByPno(parents);
	}
}
