package com.douzone.quicksilver.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.RankPositionManagementDao;
import com.douzone.quicksilver.vo.DutyPositionVo;

@Service
public class RankPositionManagementService {

	@Autowired
	private RankPositionManagementDao rankPositionDao;
	
	public int insertValue(String compSeq,
						   String positionCode,
						   String korea,
						   String english,
						   String use,
						   String order,
						   String comment,
						   String position) {
		
		if( use.equals("사용")) {
			use = "Y";
		} else {
			use = "N";
		}
		
		if( comment.equals("null")) {
			comment = " ";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("positionCode", positionCode);
		map.put("langCode", "kr");
		map.put("compSeq", compSeq);
		map.put("korea", korea);
		map.put("english", english);
		map.put("use", use);
		map.put("order", order);
		map.put("comment", comment);
		map.put("position", position);
		map.put("multi", null);
		
		// positionCode로 기존에 있는 데이터를 업데이트하는지 새로 추가하는지 확인
		
		if( rankPositionDao.select(map).isEmpty()) {// empty면 insert 아니면 update
			
			rankPositionDao.insert(map);
			
			if( !map.get("english").equals(" ") ) { // 영어필드에도 글자가있으면
				map.put("langCode", "en");
				map.put("multi", "sads");
				map.put("korea", null);
				return rankPositionDao.insert(map);
				
			} else { // 영어필드에 글자없고 그냥 한국어만 삽입
				map.put("multi", "sads");
				return rankPositionDao.insert(map);
			}
		} else {
			// t_co_comp_duty_position 업데이트
			rankPositionDao.update(map);
			
			// multi에 값을 채워 t_co_comp_duty_position_multi 업데이트
			map.put("multi", "Dasd");

			rankPositionDao.update(map);

			// 영어필드에 값이 들어왔는데 기존의것을 업데이트할지 아니면 새로 추가할지 확인
			map.put("langCode", "en");
			map.put("korea", null);
			
			if( rankPositionDao.select(map).isEmpty()) { // 새로추가
				return rankPositionDao.insert(map);
			} else { // 업데이트
				return rankPositionDao.update(map);
			}
		}
		
	}
	
	public int removeValue(String positionCode, String position) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("positionCode", positionCode);
		map.put("position", position);
		map.put("delete", "sad");
		
		List<DutyPositionVo> list = rankPositionDao.select(map);
		// t_co_comp_duty_position_multi에 1개만 남았으므로 t_co_comp_duty_position의 값까지 제거
		if( list.size() <= 1) { 
			rankPositionDao.delete(map);
			map.put("delete", null);
			return rankPositionDao.delete(map);
		} else { // multi에 2개가있으므로 1개만 제거하고 t_co_comp_duty_position은 제거하지않는다
			return rankPositionDao.delete(map);

		}
	}
	
}
