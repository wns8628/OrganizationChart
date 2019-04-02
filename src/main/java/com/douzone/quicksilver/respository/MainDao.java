package com.douzone.quicksilver.respository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Repository
public class MainDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CompanyVo> get(){
		return sqlSession.selectList("company.getList");
	}
	
	public List<DepartmentsVo> getList(){
		return sqlSession.selectList("departments.getList");
	}
	
}
