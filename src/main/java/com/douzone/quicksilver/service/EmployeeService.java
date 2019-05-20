package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmployeeDao;
import com.douzone.quicksilver.repository.PaginationDao;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.DutyPositionVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.PaginationVo;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private PaginationDao paginationdao;
	
	public EmployeesVo getdetailEmployeeInfo(EmployeesVo employeesVo) {
		return employeeDao.get(employeesVo);
	}
	
	public EmployeeDeptInfoVo getdetailNavPoint(EmployeeDeptInfoVo employeedeptinfovo) {
		return employeeDao.get(employeedeptinfovo);
	}

	public DepartmentsVo getdetailNavPointParents(DepartmentsVo departmentsvo) {
		return employeeDao.get(departmentsvo);
	}
	//조직도부서클릭 엑셀저장 위해 
	public List<EmployeesVo> getEmpInfo(String seq, String type,String langCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("type", type);
		map.put("langCode", langCode);
		map.put("exelClick", "yes");
		
		return employeeDao.getEmpInfo(map);
	}
	public Map<String, Object> getEmpInfo(String seq, String type,String langCode, Integer pageNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("type", type);
		map.put("langCode", langCode);
		map.put("exelClick", "no");
		
		
		//페이징 ///////////////////////////////////////////////////////////////////////////
			int manyboard = 5; //몇개당 한페이지할건지
			int limitcount = 5; //게시글이 10000개라도 한페이지당 10개의 페이지네이션이나오게
			int block = 5; //블록 몇개에 한블록할건지
			
	     	Integer totalboardcount = paginationdao.getPageinfomation(map); 	
			
			int modVal = (totalboardcount % manyboard);
			int divVal = (totalboardcount / manyboard);
			int totalpage = (modVal > 0) ? divVal+1 : divVal;			
			
			//URL page 최대 최소 체크
			if(pageNo < 1 ) {
				pageNo = 1;
			} else if( pageNo > totalpage ){ 
				pageNo = totalpage;
			}
				
			//페이지를위한정보 다가져와
			pageNo = (int)((pageNo > totalpage) ? totalpage+1 : pageNo);
			
			int startboard = (pageNo - 1) * manyboard ;
			if(startboard < 0 ) {
				startboard = 0;
			}
			
			int startPage = (( (pageNo-1) / limitcount) * limitcount) + 1;				
			int endPage = startPage + limitcount - 1;
			if(endPage > totalpage) {
				endPage = totalpage;
			}
			
	        int blockNum = 0;
	        int totalBlock =0;
	        
	        blockNum = (int)Math.floor((pageNo-1)/ manyboard);
			
	        modVal = (totalpage % block);
			divVal = (totalpage / block);
			totalBlock = (modVal > 0) ? divVal + 1 : divVal;
			
			PaginationVo vo = new PaginationVo();				
			vo.setTotalboardcount(totalboardcount);
			vo.setTotalPage(totalpage);
			vo.setStartboard(startboard);
			vo.setManyboard(manyboard);
			vo.setPageNo(pageNo);
			vo.setStartPage(startPage);
			vo.setEndPage(endPage);
			vo.setType(type);
		    vo.setBlock(blockNum);
		    vo.setTotalBlock(totalBlock);
		    
		    map.put("startboard", startboard);
		    map.put("manyboard", manyboard);
		//페이징 ///////////////////////////////////////////////////////////////////////////
			
		    
			Map<String, Object> tableMap = new HashMap<String, Object>();
			
			tableMap.put("list", employeeDao.getEmpInfo(map));
			tableMap.put("page",vo);
			
		return tableMap;
	}
	
	public int insertEmployee(EmployeesVo employeesVo) {
		return employeeDao.insert(employeesVo);
	}
	
	public List<DutyPositionVo> getDpAll(){
		return employeeDao.getDpAll();
	}

}
