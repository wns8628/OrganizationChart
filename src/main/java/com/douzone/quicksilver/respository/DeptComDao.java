package com.douzone.quicksilver.respository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.DeptComVo;

@Repository
public class DeptComDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(DeptComVo deptComVo) {
		return sqlSession.insert("deptCom.insertDeptCom", deptComVo);
	}

}
