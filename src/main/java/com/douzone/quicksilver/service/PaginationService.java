package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.PaginationVo;

//세션저장날리고 안씀 XXXXXXXXXX
@Service
public class PaginationService {
	
//	@Autowired
//	private PaginationDao paginationdao;
	
	
	public Map<String, Object> Employeelist(List<EmployeesVo> searchCode, Integer searchCount,Integer pageNo) {
		Map<String, Object> map = new HashMap<>();
		// 페이징
		int manyboard = 5; // 몇개당 한페이지할건지
		int limitcount = 5; // 게시글이 10000개라도 한페이지당 10개의 페이지네이션이나오게 - 여기서안씀?
		int block = 5; //블록 몇개에 한블록할건지
		
		
		Integer totalboardcount = searchCount;
		int modVal = (totalboardcount % manyboard);
		int divVal = (totalboardcount / manyboard);
		int totalpage = (modVal > 0) ? divVal + 1 : divVal;

		// URL page 최대 최소 체크
		if (pageNo < 1) {
			pageNo = 1;
		} else if (pageNo > totalpage) {
			pageNo = totalpage;
		}

		// 페이지를위한정보 다가져와
		pageNo = (int) ((pageNo > totalpage) ? totalpage + 1 : pageNo);

		int startboard = (pageNo - 1) * manyboard;
		if (startboard < 0) {
			startboard = 0;
		}
		int startPage = (((pageNo - 1) / limitcount) * limitcount) + 1;
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
	    vo.setBlock(blockNum);
	    vo.setTotalBlock(totalBlock);
		map.put("page", vo);
		// 페이징
		// ///////////////////////////////////////////////////////////////////////////
		
		int end = (startboard+manyboard);
		if(end > totalboardcount) {
			end = totalboardcount;
		}
		map.put("list", searchCode.subList(startboard,end));
		
		//searchCode 이걸가지고 
		return map;
	}
}
