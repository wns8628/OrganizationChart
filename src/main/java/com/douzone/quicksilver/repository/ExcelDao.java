package com.douzone.quicksilver.repository;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.douzone.quicksilver.vo.EmployeesVo;

public interface  ExcelDao {
	List<EmployeesVo> selectExcelList(@Param(value = "excelInfoMap") Map<String, Object> excelInfoMap) throws Exception;
}
