package com.douzone.quicksilver.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InsertDataAutocompleteDao {

	@Autowired
	private SqlSession sqlSession;
	
//  Redis 캐시용 
//	public List<String> getList(){	
//		List<String> result = new ArrayList<String>();
//		List<String> result2 = new ArrayList<String>();
//		for(String part:sung) {
//			result2 = sqlSession.selectList("autocomplete.getAutoData", (part + "%"));	    //한국
//			result2 = sqlSession.selectList("autocomplete.getAutoDataEn", (part + "%"));	//영어
//			result2 = sqlSession.selectList("autocomplete.getAutoDataAlllogin_id");	//걍한글3글자이름전부다
//			for(int i =0; i< result2.size(); i++) {
//				result.add(result2.get(i));
//			}
//		}
//		return result2;
//	}
	
}
