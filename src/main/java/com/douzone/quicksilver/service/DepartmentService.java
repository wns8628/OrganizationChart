package com.douzone.quicksilver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.repository.DepartmentsDao;
import com.douzone.quicksilver.vo.BizVo;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeeDeptInfoVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentsDao departmentsDao;
	
//	@Autowired
//	private DeptComDao deptComDao;
	
	public List<EmployeesVo> getDepartmentEmployeeInfo(Long dept_no){		
		return departmentsDao.getList(dept_no);
	}
	public EmployeesVo getDepartmentEmployeeInfoLeader(DepartmentsVo departmentsvo){		
		return departmentsDao.getLeader(departmentsvo);
	}
	
	//추가
	public void addDepartment(String parentNo, String departmentName){

		DepartmentsVo departmentsVo = new DepartmentsVo();
		BizVo bizVo = null;
		long result = 0L;
//		long no = 0;
//		long gNo = 0;
//		long oNo = 0;
//		long depth = 0;
//		long companyNo = 0;
//		Long parents = 0L;

		if( Long.parseLong(parentNo) > 10000000 ) { // 사업장 바로 밑에 부서를 추가

			bizVo = new BizVo();
			bizVo.setBizSeq(parentNo);
			
			System.out.println("사업장 밑 부서 추가");
			
			bizVo = departmentsDao.get(bizVo);
			departmentsVo.setGroupSeq( bizVo.getGroupSeq());
			departmentsVo.setCompSeq( bizVo.getCompSeq());
			departmentsVo.setDeptName(departmentName);
			departmentsVo.setBizSeq(parentNo);
			departmentsVo.setParentDeptSeq(parentNo);
			departmentsVo.setDeptLevel(1L);
			
			result = departmentsDao.insert(departmentsVo);
			
			System.out.println("insert 결과 : " + result);
						
		} else { // 부서 밑에 부서를 추가

			departmentsVo.setDeptSeq(parentNo);
			
			System.out.println("부서 밑 부서 추가");

			departmentsVo = departmentsDao.get(departmentsVo);
			departmentsVo.setDeptName(departmentName);
			departmentsVo.setParentDeptSeq(parentNo);
			departmentsVo.setDeptLevel( departmentsVo.getDeptLevel() + 1);
			result = departmentsDao.insert(departmentsVo);
			
			System.out.println("insert 결과 : " + result);
		}
	}
	
	
	public void deleteDepartment(long departmentNo) {
		
		EmployeeDeptInfoVo employeeDeptInfoVo = new EmployeeDeptInfoVo();
		employeeDeptInfoVo.setDeptSeq(String.valueOf(departmentNo));
				
		if( departmentsDao.get(employeeDeptInfoVo).isEmpty() == false) { // 직원이 남아있어서 부서를 삭제하지못함
			
			System.out.println("직원이 남아있어서 부서삭제못함");
			return;
			
		} else { // 부서 밑의 부서들에 사원이있는지 확인
			
			employeeDeptInfoVo.setEmpSeq("gfdgfdg");
			
			if( departmentsDao.get(employeeDeptInfoVo).isEmpty() == false) { // 부서 밑의 부서들에 사원이 있으면
				System.out.println("부서 밑의 부서에 직원이 남아있어서 부서삭제못함");
				return;
			} else {	// 삭제가능
				System.out.println("삭제가능");
				employeeDeptInfoVo.setGroupSeq("DSfsdf");
				
				List<EmployeeDeptInfoVo> deleteDepartments = departmentsDao.get(employeeDeptInfoVo);
				
				departmentsDao.delete(String.valueOf(departmentNo));
				int size = deleteDepartments.size();
				
				for(int i = 0; i < size; i++) {
					departmentsDao.delete(deleteDepartments.get(i).getDeptSeq());
				}
			
			}
		}
		
	}
//	
//	public void addDeptCom(long departmentNo) {
//		
//		Long parents = null;
//		DepartmentsVo departmentsVo = new DepartmentsVo();
//		departmentsVo.setNo( departmentNo);
//		
//		
//		while(true) {
//			System.out.println("departmentNo : " + departmentNo);
//			
//			parents = departmentsDao.get(departmentsVo).getParents();
//			
//			System.out.println("parents : " + parents);
//			
//			if( parents < 0) {
//				DeptComVo deptComVo = new DeptComVo();
//				deptComVo.setDepartmentsNo( departmentNo);
//				deptComVo.setCompanyNo( Math.abs(parents));
//				
//				deptComDao.insert(deptComVo);
//				break;
//			}				
//		}
	
}
