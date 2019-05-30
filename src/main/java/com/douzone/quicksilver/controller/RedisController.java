package com.douzone.quicksilver.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.interfaces.AutocompleteKeyRepository;
import com.douzone.quicksilver.interfaces.AutocompleteRepository;
import com.douzone.quicksilver.repository.InsertDataAutocompleteDao;

@Controller
public class RedisController {

	@Autowired
	AutocompleteKeyRepository autocompleteKeyRepository;
	@Autowired
	AutocompleteRepository autocompleteRepository;
//  @Autowired
//  InsertDataAutocompleteDao insertDataAutocompleteDao;

    @ResponseBody
    @RequestMapping("/redis/read")
    public JSONResult redisSearch(@RequestParam (value="kwd",required=false, defaultValue="") String word,
    							  @RequestParam (value="enter", required=false ) boolean enter) {
    	
    	word = word.toLowerCase(); //소문자로변형
    	return JSONResult.success(autocompleteRepository.complete(word, enter));
    }

//데이터 Redis에 캐시할때 이걸쓰면됨
//    @ResponseBody
//    @RequestMapping("/redis/read/insertData")
//    public JSONResult redisSearch() {
//        String[] sung = {"김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "전", "홍",
//        				 "유", "고", "문", "양", "손", "배", "조", "백", "허", "남", "심", "노", "하", "곽", "성", "차", "주", "우", "구", "임",
//        				 "나", "지", "엄", "채", "원", "천", "방", "공"};
//        
//        String[] sungEn = {"Kim", "Lee", "park", "Choi", "Jeong", "Gang", "Jo", "Yun", "Jang", "Im", "Han", "OH", "Seo", "Sin", "Gwon", "Hwang", "An", "Song", "Jeon", "Hong",
//  				 "Yu", "Go", "Mun", "Yang", "Son", "Bae", "Jo", "Baeg", "Heo", "Nam", "Sim", "No", "Ha", "Gwag", "Seong", "Cha", "Ju", "U", "Gu", "Im",
//  				 "Na", "Ji", "Eom", "Chae", "Won", "Cheon", "Bang", "Gong"};
//     
//        List<String> result = new ArrayList<String>();
//        result = insertDataAutocompleteDao.getList(); //한글넣기
//        result = insertDataAutocompleteDao.getList(sungEn); //영어넣기
//        boolean enter = true;
        //대문자넣기
//        for(String resultPart : result) {
//        	System.out.println(resultPart + "..go!");        
//        	autocompleteRepository.complete(resultPart, enter);
//        	System.out.println("success..!!");
//        }
        //소문자로 넣기 
//        for(int i=0; i<result.size(); i++) {
//        	System.out.println(result.get(i).toLowerCase() + "..go!");        
//        	autocompleteRepository.complete(result.get(i).toLowerCase(), enter);  //일단넣음          	
//        	System.out.println("success..!!");                  	
//        } 
//        return null;
//    }

}
