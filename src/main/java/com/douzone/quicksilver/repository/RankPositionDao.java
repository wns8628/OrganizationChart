package com.douzone.quicksilver.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DutyPositionVo;

@Repository
public class RankPositionDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("rankPositionManagement.insert_t_co_comp_duty_position", map);
	}
	
	public List<DutyPositionVo> select(Map<String, Object> map) {
		return sqlSession.selectList("rankPositionManagement.checkPositionCode", map);
	}
	
	// 저장 버튼 눌렀을때 업데이트
	public int update(Map<String, Object> map) {
		return sqlSession.update("rankPositionManagement.update_t_co_comp_duty_position", map);
	}
	
	public int delete(Map<String, Object> map) {
		return sqlSession.delete("rankPositionManagement.delete_t_co_comp_duty_position", map);
	}
}
