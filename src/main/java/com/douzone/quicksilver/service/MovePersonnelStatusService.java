package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.MovePersonnelStatusDao;
import com.douzone.quicksilver.vo.MovePersonnelStatusVo;


@Service
public class MovePersonnelStatusService {

	@Autowired
	private MovePersonnelStatusDao movePersonnelStatusDao;
	
	public List<MovePersonnelStatusVo> search(MovePersonnelStatusVo movePersonnelStatusVo) {
		
		// 부서가 1개만있는 사원
		movePersonnelStatusVo.setMainDeptYn("Y");
		List<MovePersonnelStatusVo> list = movePersonnelStatusDao.select(movePersonnelStatusVo);
		
		// 겸직까지 쳬크
		movePersonnelStatusVo.setMainDeptYn("N");
		list.addAll( movePersonnelStatusDao.select(movePersonnelStatusVo) );
		
		return list;
	}
}
