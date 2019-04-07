package com.douzone.quicksilver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.quicksilver.respository.MainDao;
import com.douzone.quicksilver.vo.CompanyVo;
import com.douzone.quicksilver.vo.DepartmentsVo;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service
public class MainService {	

	@Autowired
	private MainDao mainDao;

	//리스트
	public Map<String, Object> list(){

		List<CompanyVo> companyVoList = mainDao.get();
		List<DepartmentsVo> departmentsVoList = mainDao.getList();

		//System.out.println(companyVoList.toString());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyVoList", companyVoList);
		map.put("departmentsVoList",departmentsVoList);

		return map;
	}

	// 자회사리스트
	public List<CompanyVo> companyList(){
		return mainDao.get();
	}

	public List<DepartmentsVo> deptList(){
		return mainDao.getList();
	}

	public void addDepartment(long parentNo, String departmentName){

		DepartmentsVo departmentsVo = new DepartmentsVo();
		long no = 0;
		long gNo = 0;
		long oNo = 0;
		long depth = 0;
		long companyNo = 0;
		long parents = 0;

		if( parentNo < 0 ) { // 자회사 바로 밑에 부서를 추가

			System.out.println("자회사 밑 부서 추가");

			departmentsVo.setParents(parentNo);			
			departmentsVo = mainDao.get(departmentsVo);

			departmentsVo.setName(departmentName);
			departmentsVo.setoNo(1L);
			departmentsVo.setDepth(1L);
			departmentsVo.setCompanyNo(Math.abs(parentNo));
			departmentsVo.setParents(parentNo);

			int result = mainDao.insert(departmentsVo);
			System.out.println("insert 결과 : " + result);

		} else { // 부서 밑에 부서를 추가

			System.out.println("부서 밑 부서 추가");

			departmentsVo = mainDao.get(parentNo); // 부모 부서 정보를 가져옴

			no = departmentsVo.getNo();
			gNo = departmentsVo.getgNo();
			oNo = departmentsVo.getoNo();
			depth = departmentsVo.getDepth();
			companyNo = departmentsVo.getCompanyNo();
			parents = departmentsVo.getParents();

			departmentsVo.setNo(null);
			departmentsVo.setCompanyNo(null);
			departmentsVo.setParents(null);

			departmentsVo = mainDao.get(departmentsVo); // null이면 맨밑에 아니면 중간에 끼어넣음

			if( departmentsVo == null) { // 맨밑에 끼어넣음

				System.out.println("맨밑으로");

				departmentsVo = new DepartmentsVo();
				departmentsVo.setgNo(gNo);

				departmentsVo = mainDao.get(departmentsVo);

				oNo = departmentsVo.getoNo();

			}else { // 중간에 끼어넣음

				departmentsVo.setgNo(gNo);
				oNo = departmentsVo.getoNo();
				int result = mainDao.update(departmentsVo);
				System.out.println( "업데이트 결과 : " + result );
			}

			depth++;

			// 구해온 값들로 insert
			departmentsVo.setNo(no);
			departmentsVo.setName(departmentName);
			departmentsVo.setgNo(gNo);
			departmentsVo.setoNo(oNo);
			departmentsVo.setDepth(depth);
			departmentsVo.setCompanyNo(companyNo);
			departmentsVo.setParents(no);

			mainDao.insert(departmentsVo);
		}
	}

	public void deleteDepartment(long departmentNo) {

		int result = mainDao.delete(departmentNo);

		if( result == 0 ) { // 외래키 문제로 삭제가 되지않을때 ex : 부서 밑에 부서가있으면 삭제안됨, 부서밑에 직원있으면 삭제안됨
			System.out.println("삭제 할수없다는 알림창 띄워줌");
		}else { // 부서 밑에 사람이 하나도없으며, 부서밑에 부서도없음  삭제
			System.out.println("삭제되었다는 알림창");
		}
	}

	public void addDept(int i) {
		int pNo = random(((i*1000)+(i+1)), (mainDao.getCount()+i) + 1);
		if(pNo == ((i*1000)+(i+1))) {
			pNo *= -1; 
			String deptName = "부서"+(mainDao.getCountByPno(pNo)+1);
			addDepartment(pNo, deptName);
		}else {
			String deptName = mainDao.getNameByPno(pNo)+"-"+(mainDao.getCountByPno(pNo)+1);
			addDepartment(pNo, deptName);
		}
		
	}
	
	public void autoSet(int num) {
		mainDao.autoSet(num);
	}
	
	public int random(int n1, int n2) {
		return (int)(Math.random()*(n2 - n1 + 1))+n1;
	}
	
	public List<EmployeesVo> getDepartmentEmployeeInfo(EmployeesVo employeesVo){
		
		return mainDao.get(employeesVo);
	}
	
	public List<EmployeesVo> search(String kwd, Long selectSearch){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("kwd", kwd);
		map.put("selectSearch", selectSearch);
		return mainDao.get(map);
	}
	
}
