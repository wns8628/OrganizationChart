package com.douzone.quicksilver.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.MovePersonnelStatusVo;

@Repository
public class MovePersonnelStatusDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MovePersonnelStatusVo> select(MovePersonnelStatusVo movePersonnelStatusVo){
		return sqlSession.selectList("movePersonnelStatus.search", movePersonnelStatusVo);
	}
}
