package com.douzone.quicksilver.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.config.app.RedisConfig;
import com.douzone.dto.JSONResult;
import com.douzone.quicksilver.repository.AutocompleteKeyRepository;
import com.douzone.quicksilver.repository.AutocompleteRepository;
import com.douzone.quicksilver.service.AutocompleteServiceImpl;
import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.service.NaviService;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.EmployeesVo;
import com.douzone.quicksilver.vo.HashVo;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Controller
public class MainBoot {

	@Autowired
	MainService mainService;
	@Autowired
	NaviService naviService;
	@Autowired
	AutocompleteKeyRepository autocompleteKeyRepository;
	@Autowired
	AutocompleteRepository autocompleteRepository;
	
	@RequestMapping("")
	public String main(HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
			session.setAttribute("langCode", langCode);
		}
		
		return "main/main";
	}
	
	@RequestMapping("/boot")
	public String main(Model model) {
		model.addAttribute("companyList", naviService.getCompList());

		//차트관련 
//		model.addAttribute("mainInfo", mainService.getMainInfo());

		return "quicksilverboot/main";
	}
	@RequestMapping("/boot/{langCode}")
	public String lang(@PathVariable String langCode, HttpSession session) {
		session.setAttribute("langCode", langCode);
		return "redirect:/boot";
	}
	
	
//-차트관련----------------------------------------------------------------------------------
	//차트관련
	@ResponseBody
	@RequestMapping("/getMainChart")
	public JSONResult getMainChart(HttpSession session) {
		String langCode = (String) session.getAttribute("langCode");
		if(langCode == null) {
			langCode = "kr";
		}

		return JSONResult.success(mainService.getMainChart(langCode));
	}
	
	//차트관련
    @ResponseBody	  
    @RequestMapping("/getBizInfo/{compSeq}")
    public JSONResult getBizInfo(HttpSession session,
		  	 				     @ModelAttribute CompanyVo companyvo){
	  
		String langCode = (String)session.getAttribute("langCode");		
		if(langCode == null) { 
			langCode = "kr"; 
		}
		
		companyvo.setLangCode(langCode);
		return JSONResult.success(mainService.getCompChart(companyvo));
	}
    //차트관련
    @ResponseBody	  
    @RequestMapping("/getBizChart/{compSeq}")
    public JSONResult getBizChart(HttpSession session,  
		  	 				      @ModelAttribute BizVo bizvo){
	  
		String langCode = (String)session.getAttribute("langCode");		
		if(langCode == null) { 
			langCode = "kr"; 
		}
		
		bizvo.setLangCode(langCode);
		return JSONResult.success(mainService.getBizChart(bizvo));
	}
//------------------------------------------------------------------------------------    
    
    
    @RequestMapping("/update")
    public void updates() {
    	
    	for(int i = 76510; i <= 99999; i++) {
    		EmployeesVo vo = mainService.get1(i); // 나이, 회사번호를 받아옴
    		
    		System.out.println(vo);
    		
    		String[] arr = calc(vo.getAge()); // 나이를 이용하여 직급, 직책 계산
    		
    		System.out.println("arr[0] : " + arr[0]);
    		System.out.println("arr[1] : " + arr[1]);
    		
    		String dpSeqPosition = mainService.get2(vo.getMainCompSeq(), arr[0]); // 회사번호, 직급을 이용하여 dp_seq을 가져옴
    		String dpSeqDuty = mainService.get2(vo.getMainCompSeq(), arr[1]); // 회사번호, 직책을 이용하여 dp_seq을 가져옴
    		
    		System.out.println("dpSeqPosition : " + dpSeqPosition);
    		System.out.println("dpSeqDuty : " + dpSeqDuty);
    		
    		mainService.update1(i, dpSeqPosition); // update 직급
    		mainService.update2(i, dpSeqDuty); // update 직책
    	}
    }
    
    public String[] calc(Long long1) {
    	
    	if( long1 <= 30) {	// 사원
    		return new String[] {"사원", "파트장"};
    	} else if( long1 <= 35) {		// 주임
    		return new String[] {"주임", "팀장"};
    	} else if( long1 <= 40) {		// 대리
    		return new String[] {"대리", "실장"};
    	} else if( long1 <= 50) {		// 과장
    		return new String[] {"과장", "본부장"};
    	} else if( long1 <= 60) {		// 부장
    		return new String[] {"부장", "사업부장"};
    	}
    	
    	return new String[] {"0"};
    }
    
 // ---- redis 검색데이터 삽입
    
    @ResponseBody
    @RequestMapping("/redisComplete")
    public JSONResult redisSearch(@RequestParam String word) {

    	return JSONResult.success(autocompleteRepository.complete(word));
    }

}
