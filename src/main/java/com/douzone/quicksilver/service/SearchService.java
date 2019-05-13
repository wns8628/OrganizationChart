package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.PaginationDao;
import com.douzone.quicksilver.repository.SearchDao;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.PaginationVo;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private PaginationDao paginationdao;
	
	public List<EmployeesVo> Employeelist(String kwd, String selectSearch, String langCode,  Integer pageNo){
		Map<String, Object> map = new HashMap<>();
		
		map.put("kwd", "%"+kwd+"%");
		map.put("selectSearch", selectSearch);
		map.put("langCode", langCode);
		
		//페이징 ///////////////////////////////////////////////////////////////////////////
		int manyboard = 50; //몇개당 한페이지할건지
		int limitcount = 5; //게시글이 10000개라도 한페이지당 10개의 페이지네이션이나오게 - 여기서안씀?
		
     	Integer totalboardcount = paginationdao.getPageinfomationSearch(map); 	
		
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
		
		PaginationVo vo = new PaginationVo();				
		vo.setTotalboardcount(totalboardcount);
		vo.setTotalpage(totalpage);
		vo.setStartboard(startboard);
		vo.setManyboard(manyboard);
		vo.setPageNo(pageNo);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
//		vo.setType(type);
		vo.setKwd("%"+kwd+"%");
		
		map.put("startboard", vo.getStartboard());
		map.put("manyboard", vo.getManyboard());
		
		System.out.println("vo.getStartboard()"+vo.getStartboard());
		System.out.println("vo.getManyboard()"+vo.getManyboard());
		
	//페이징 ///////////////////////////////////////////////////////////////////////////
		
		
		return searchDao.getList(map);
	}
	
}
