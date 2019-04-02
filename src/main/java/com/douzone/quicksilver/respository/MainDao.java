package com.douzone.quicksilver.respository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;

@Repository
public class MainDao {
	
	public List<CompanyVo> get(){

		CompanyVo vo = null;		
		Connection conn = null;
		ResultSet rs =null;
		PreparedStatement pstmt = null;
		List<CompanyVo> list = new ArrayList<>();
		
		try {
			 conn = getConnection();
			 pstmt = null;
			 rs = null;
			 	
			//보여줄 글 			
			String sql = "select no,name,group_no from company";
			  	  
			rs= pstmt.executeQuery();			
			while(rs.next()) {
				
				int no = rs.getInt(1);
				String name = rs.getString(2);
				int groupNo =rs.getInt(3);
	
				vo = new CompanyVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setGroupNo(groupNo);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println( "error: "+e );
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public List<DepartmentsVo> getList(){

		DepartmentsVo vo = null;		
		Connection conn = null;
		ResultSet rs =null;
		PreparedStatement pstmt = null;
		List<DepartmentsVo> list = new ArrayList<>();
		
		try {
			 conn = getConnection();
			 pstmt = null;
			 rs = null;
			 	
			//보여줄 글 			
			String sql = "select no,name,g_no,o_no,depth,company_no from departments";
			  	  
			rs= pstmt.executeQuery();			
			
			while( rs.next()) {	
				int no = rs.getInt(1);
				String name = rs.getString(2);
				int gNo = rs.getInt(3);
				int oNo = rs.getInt(4);
				int depth = rs.getInt(5);
				int companyNo =rs.getInt(6);
	
				vo = new DepartmentsVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setgNo(gNo);
				vo.setoNo(oNo);
				vo.setDepth(depth);		
				vo.setCompanyNo(companyNo);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println( "error: "+e );
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
   // 커넥트함수
   private Connection getConnection() throws SQLException {
      Connection conn = null;	      

      try {
         Class.forName("com.mysql.jdbc.Driver"); // 패키지 이름

         String url = "jdbc:mysql://218.39.221.78:3306/quicksilver"; // DB 종류마다 url이 다르다
         conn = DriverManager.getConnection(url, "quicksilver", "root12"); // interface
      } catch (ClassNotFoundException e) {
         System.out.println("드라이버 로딩 실패" + e);
      }
      return conn;
   }
}
