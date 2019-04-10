package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.respository.DepartmentsDao;
import com.douzone.quicksilver.respository.DeptComDao;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.DeptComVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentsDao departmentsDao;
	
	@Autowired
	private DeptComDao deptComDao;
	
	public List<EmployeesVo> getDepartmentEmployeeInfo(EmployeesVo employeesVo){
		return departmentsDao.get(employeesVo);
	}
	
	//추가
	public void addDepartment(long parentNo, String departmentName){

		DepartmentsVo departmentsVo = new DepartmentsVo();
		long no = 0;
		long gNo = 0;
		long oNo = 0;
		long depth = 0;
		long companyNo = 0;
		Long parents = 0L;

		if( parentNo < 0 ) { // 자회사 바로 밑에 부서를 추가

			System.out.println("자회사 밑 부서 추가");

			departmentsVo.setParents(parentNo);	
			departmentsVo = departmentsDao.get(departmentsVo);

			departmentsVo.setName(departmentName);
			departmentsVo.setoNo(1L);
			departmentsVo.setDepth(1L);
			departmentsVo.setParents(parentNo);

			long result = departmentsDao.insert(departmentsVo);
			System.out.println("insert 결과 : " + result);
			
			addDeptCom( result);
			
		} else { // 부서 밑에 부서를 추가

			System.out.println("부서 밑 부서 추가");

			departmentsVo = departmentsDao.get(parentNo); // 부모 부서 정보를 가져옴

			no = departmentsVo.getNo();
			gNo = departmentsVo.getgNo();
			oNo = departmentsVo.getoNo();
			depth = departmentsVo.getDepth();
			//companyNo = departmentsVo.getCompanyNo();
			parents = departmentsVo.getParents();

			departmentsVo.setNo(null);
			departmentsVo.setCompanyNo(null);
			departmentsVo.setParents(null);

			departmentsVo = departmentsDao.get(departmentsVo); // null이면 맨밑에 아니면 중간에 끼어넣음

			if( departmentsVo == null) { // 맨밑에 끼어넣음

				System.out.println("맨밑으로");

				departmentsVo = new DepartmentsVo();
				departmentsVo.setgNo(gNo);

				departmentsVo = departmentsDao.get(departmentsVo);

				oNo = departmentsVo.getoNo();

			}else { // 중간에 끼어넣음

				departmentsVo.setgNo(gNo);
				oNo = departmentsVo.getoNo();
				int result = departmentsDao.update(departmentsVo);
				System.out.println( "업데이트 결과 : " + result );
			}

			depth++;

			// 구해온 값들로 insert
			departmentsVo.setNo(no);
			departmentsVo.setName(departmentName);
			departmentsVo.setgNo(gNo);
			departmentsVo.setoNo(oNo);
			departmentsVo.setDepth(depth);
			//departmentsVo.setCompanyNo(companyNo);
			departmentsVo.setParents(no);

			long insertDepartmentNo = departmentsDao.insert(departmentsVo);
			System.out.println("insertDepartmentNo : " + insertDepartmentNo);
		}
	}
	
	
	public void deleteDepartment(long departmentNo) {
		int result = departmentsDao.delete(departmentNo);

		if( result == 0 ) { // 외래키 문제로 삭제가 되지않을때 ex : 부서 밑에 부서가있으면 삭제안됨, 부서밑에 직원있으면 삭제안됨
			System.out.println("삭제 할수없다는 알림창 띄워줌");
		}else { // 부서 밑에 사람이 하나도없으며, 부서밑에 부서도없음  삭제
			System.out.println("삭제되었다는 알림창");
		}
	}
	
	public void addDeptCom(long departmentNo) {
		
		Long parents = null;
		DepartmentsVo departmentsVo = new DepartmentsVo();
		departmentsVo.setNo( departmentNo);
		
		
		while(true) {
			System.out.println("departmentNo : " + departmentNo);
			
			parents = departmentsDao.get(departmentsVo).getParents();
			
			System.out.println("parents : " + parents);
			
			if( parents < 0) {
				DeptComVo deptComVo = new DeptComVo();
				deptComVo.setDepartmentsNo( departmentNo);
				deptComVo.setCompanyNo( Math.abs(parents));
				
				deptComDao.insert(deptComVo);
				break;
			}				
		}
	}
	
}
