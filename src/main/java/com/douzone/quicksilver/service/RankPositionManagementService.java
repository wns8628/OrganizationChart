package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.RankPositionManagementDao;
import com.douzone.quicksilver.vo.CompanyVo;

@Service
public class RankPositionManagementService {
	
	 @Autowired 
	 private RankPositionManagementDao rPMDao;
	
	 public List<CompanyVo> search(String compSeq, String kwd, String useCheck, String langCode, String position){
		 

		 if( position.equals("undefined")) {
				position = "position";
		}
		 
		 Map<String, Object> map = new HashMap<>();
		 map.put("compSeq", compSeq);
		 map.put("kwd", kwd);
		 map.put("position", position);
		 map.put("useCheck", useCheck);
		 map.put("langCode", langCode);
		 return rPMDao.get(map);
	 }
}
