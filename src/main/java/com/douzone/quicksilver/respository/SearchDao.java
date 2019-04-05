package com.douzone.quicksilver.respository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.douzone.quicksilver.vo.EmployeesVo;

@Repository
public class SearchDao {

	public List<EmployeesVo> getList(String kwd){

		List<EmployeesVo> list = new ArrayList<EmployeesVo>();
		
		Connection conn = null;
		ResultSet rs =null;
		PreparedStatement pstmt = null;
		
		try {
			 conn = getConnection();
			 pstmt = null;
			 rs = null;
			
			String sql = "select a.no as 사원번호, a.name as 이름, a.age as 나이, a.gender, a.grade as 직급, b.name as 부서, c.name as 자회사, d.name as 모회사, a.phone as 전화번호\r\n" + 
					"  from employees a, departments b, company c, master_group d\r\n" + 
					" where a.departments_no = b.no\r\n" + 
					"   and b.company_no = c.no\r\n" + 
					"   and c.group_no = d.no\r\n" + 
					"   and a.name like '%" + kwd + "%'";
			
			pstmt = conn.prepareStatement(sql);						
			rs= pstmt.executeQuery();
					
			while(rs.next()) {
				
				int no = rs.getInt(1);
				String name = rs.getString(2);
				int age =rs.getInt(3);
				String gender = rs.getString(4);
				String grade = rs.getString(5);
				String departments = rs.getString(6);
				String company = rs.getString(7);
				String masterGroup = rs.getString(8);
				String phone = rs.getString(9);
				
				EmployeesVo vo = new EmployeesVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setAge(age);
				vo.setGender(gender);
				vo.setGrade(grade);
				vo.setDepartments(departments);
				vo.setCompany(company);
				vo.setMasterGroup(masterGroup);
				vo.setPhone(phone);
				
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
