package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.EmpInfoManagementDao;
import com.douzone.quicksilver.vo.AddEmpVo;
import com.douzone.quicksilver.vo.ChangePasswordVo;
import com.douzone.quicksilver.vo.EmpInfoManagementVo;
import com.douzone.quicksilver.vo.GetEmpInfoVo;
import com.douzone.quicksilver.vo.GetPositionDutyVo;
import com.douzone.quicksilver.vo.RemoveEmpInfoVo;
import com.douzone.quicksilver.vo.ResetIdVo;

@Service
public class EmpInfoManagementService {

	@Autowired
	private EmpInfoManagementDao empInfoManagementDao;
	
	public List<EmpInfoManagementVo> search(EmpInfoManagementVo empInfoManagementVo) {
		if(empInfoManagementVo.getKwd().equals("")) {
			empInfoManagementVo.setKwd(null);
		}
		return empInfoManagementDao.select(empInfoManagementVo);
	}
	
	public int resetId(ResetIdVo resetIdVo) {
		return empInfoManagementDao.update(resetIdVo);
	}
	
	public int changePassword(ChangePasswordVo changePasswordVo) {
		return empInfoManagementDao.update(changePasswordVo);
	}
	
	public List<ResetIdVo> checkDuplicateLoginId(ResetIdVo resetIdVo) {
		return empInfoManagementDao.select(resetIdVo);
	}
	
	public List<GetPositionDutyVo> getPositionDuty(String compSeq){
		return empInfoManagementDao.select(compSeq);
	}
	
	public int addEmp(AddEmpVo addEmpVo) {
		addEmpVo.setCheck(0);
		return empInfoManagementDao.insert(addEmpVo);
	}
	
	public int add_t_co_emp_multi(AddEmpVo addEmpVo, boolean check) {

		if(check) { // kr
			System.out.println("한글");
			addEmpVo.setLangCode("kr");
			addEmpVo.setCheck(1);
			return empInfoManagementDao.insert(addEmpVo);
		} else { // en
			System.out.println("영어");
			addEmpVo.setCheck(1);
			addEmpVo.setLangCode("en");
			addEmpVo.setKorea( addEmpVo.getEnglish());
			addEmpVo.setAddr( changeHangulToEnglish(addEmpVo.getAddr())); // 주소를 영어로 변경
			addEmpVo.setDetailAddr( changeHangulToEnglish(addEmpVo.getDetailAddr())); // 상세주소를 영어로 변경
			return empInfoManagementDao.insert(addEmpVo);
		}
	}
	
	public int add_t_co_emp_dept(AddEmpVo addEmpVo) {
		addEmpVo.setCheck(2);
		return empInfoManagementDao.insert(addEmpVo);
	}
	
	public int add_t_co_emp_comp(AddEmpVo addEmpVo) {
		addEmpVo.setCheck(3);
		return empInfoManagementDao.insert(addEmpVo);
	}
	
	public int removeEmpInfo(RemoveEmpInfoVo removeEmpInfoVo) {
		removeEmpInfoVo.setTable("t_co_emp2");
		empInfoManagementDao.update(removeEmpInfoVo);
		
		removeEmpInfoVo.setTable("t_co_emp_comp");
		return empInfoManagementDao.update(removeEmpInfoVo);
	}
	
	public List<GetEmpInfoVo> getEmpInfoVo(GetEmpInfoVo getEmpInfoVo){
		return empInfoManagementDao.select(getEmpInfoVo);
	}
	
	public int updateEmp(AddEmpVo addEmpVo) {
		addEmpVo.setCheck(1);
		return empInfoManagementDao.update(addEmpVo);
	}
	
	public int update_t_co_emp_multi(AddEmpVo addEmpVo) {
		
		addEmpVo.setCheck(2);
		addEmpVo.setLangCode("kr");
		empInfoManagementDao.update(addEmpVo);
		
		addEmpVo.setLangCode("en");
		addEmpVo.setAddr( changeHangulToEnglish(addEmpVo.getAddr()) );
		addEmpVo.setDetailAddr( changeHangulToEnglish(addEmpVo.getDetailAddr()) );
		return empInfoManagementDao.update(addEmpVo);
	}
	
	public int update_t_co_emp_dept_comp_multi(AddEmpVo addEmpVo) {
		
		addEmpVo.setCheck(3);
		addEmpVo.setTable("t_co_emp_dept");
		empInfoManagementDao.update(addEmpVo);
		addEmpVo.setTable("t_co_emp_comp");
		empInfoManagementDao.update(addEmpVo);
		addEmpVo.setTable("t_co_emp_dept_multi");
		return empInfoManagementDao.update(addEmpVo);
	}
	
	
	public String changeHangulToEnglish(String addr) {
		
		/** 초성 - 가(ㄱ), 날(ㄴ) 닭(ㄷ) */
		String[] arrChoSungEng = { "k", "K", "n", "d", "D",
			"r", "m", "b", "B", "s", "S", "a", "j",
			"J", "ch", "c", "t", "p", "h" };
		
		/** 중성 - 가(ㅏ), 야(ㅑ), 뺨(ㅑ)*/
		String[] arrJungSungEng = { "a", "e", "ya", "ae",
			"eo", "e", "yeo", "e", "o", "wa", "wae", "oe",
			"yo", "u", "wo", "we", "wi", "yu", "eu", "ui",
			"i" };
		
		/** 종성 - 가(없음), 갈(ㄹ) 천(ㄴ) */
		String[] arrJongSungEng = { "", "k", "K", "ks",
			"n", "nj", "nh", "d", "l", "lg", "lm", "lb",
			"ls", "lt", "lp", "lh", "m", "b", "bs", "s",
			"ss", "ng", "j", "ch", "c", "t", "p", "h" };
		
		
		String word 		= addr;		// 분리할 단어
		String result		= "";									// 결과 저장할 변수
		String resultEng	= "";									// 알파벳으로
		
		for (int i = 0; i < word.length(); i++) {
			
			/*  한글자씩 읽어들인다. */
			char chars = (char) (word.charAt(i) - 0xAC00);

			if (chars >= 0 && chars <= 11172) {
				/* A. 자음과 모음이 합쳐진 글자인경우 */

				/* A-1. 초/중/종성 분리 */
				int chosung 	= chars / (21 * 28);
				int jungsung 	= chars % (21 * 28) / 28;
				int jongsung 	= chars % (21 * 28) % 28;

				/* 알파벳으로 */
				resultEng = resultEng + arrChoSungEng[chosung] + arrJungSungEng[jungsung];
				if (jongsung != 0x0000) {
					/* A-3. 종성이 존재할경우 result에 담는다 */
					resultEng =  resultEng + arrJongSungEng[jongsung];
				}

			} else {
				/* B. 한글이 아니거나 자음만 있을경우 */
									
				/* 알파벳으로 */
				if( chars>=34127 && chars<=34147) {
					/* 단일모음인 경우 */
					int moum 	= (chars-34127);
					resultEng = resultEng + arrJungSungEng[moum];
				} else {
					/* 알파벳인 경우 */
					resultEng = resultEng + ((char)(chars + 0xAC00));
				}
			}//if
			
		}//for
		
		return resultEng;
	}
}
