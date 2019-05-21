package com.douzone.quicksilver.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface ExcelService {
	void selectExcelList(HttpServletResponse response, HttpSession session) throws Exception;
}
