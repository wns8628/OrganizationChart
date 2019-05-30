package com.douzone.quicksilver.service;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.douzone.quicksilver.interfaces.ExcelService;
import com.douzone.quicksilver.vo.EmployeesVo;

@Service("ExcelService")
public class ExcelServicelmpl implements ExcelService {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	@Transactional
	public void selectExcelList(HttpServletResponse response, HttpSession session) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 메모리에 100개의 행을 유지합니다. 행의 수가 넘으면 디스크에 적습니다.
		SXSSFWorkbook wb = new SXSSFWorkbook(100);
		Sheet sheet = wb.createSheet();
		
		//세션의 엑셀로출력할 type : 검색인가 부서클릭인가를 구분할 세션 과 정보들
		Map<String, Object> excelInfoMap = (Map<String, Object>) session.getAttribute("excelInfo"); 
		//영어버전인지 아닌지 구분
		String langCode = (String) excelInfoMap.get("langCode");

		//타이틀정하기-----------------------------------------------------------------------------------------------------
		String excelTitle;
		if(langCode.equals("kr")) {
			excelTitle = "부서명,직급,직책,사원명,ID,전화번호,휴대전화";			
		}else{
			excelTitle = "Department,position,duty,Employee name,ID,Telephone Number,Mobile";			
		}		
		String titleArr[] = excelTitle.split(",");
		Cell cell = null;
		Row row = sheet.createRow(0);
		//제목 스타일 
		Font defaultFont = wb.createFont();        
		defaultFont.setFontHeightInPoints((short) 11); 
		defaultFont.setFontName("맑은 고딕");
		defaultFont.setBoldweight((short)defaultFont.BOLDWEIGHT_BOLD);
		defaultFont.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
		CellStyle HeadStyle = wb.createCellStyle(); 
		HeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		HeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		HeadStyle.setFillForegroundColor(HSSFColor.ROYAL_BLUE.index); 
		HeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); 
		HeadStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
		HeadStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
		HeadStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
		HeadStyle.setFillPattern(CellStyle.SOLID_FOREGROUND); 
		HeadStyle.setFont(defaultFont);
		//적용
		for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
			cell = row.createCell(titleNo);
			cell.setCellValue(titleArr[titleNo]);
			cell.setCellStyle(HeadStyle);
		}
		//-----------------------------------------------------------------------------------------------------
		try {
		    sqlSession.select("selectExcelList", excelInfoMap, new ResultHandler(){
				@Override
				public void handleResult(ResultContext context) {
					EmployeesVo vo = (EmployeesVo) context.getResultObject();
				    Row row = sheet.createRow(context.getResultCount());
			    	Cell cell = null;
			    	cell = row.createCell(0);
			    	if(langCode.equals("kr")) {
			    		cell.setCellValue(vo.getDeptName());			//부서명			    		
			    	}else {
			    		cell.setCellValue(vo.getDeptNameEn());			//부서명 En	    		
			    	}
			        cell = row.createCell(1);
			        cell.setCellValue(vo.getPositionCodeName());		//직급
			        cell = row.createCell(2);	
			        cell.setCellValue(vo.getDutyCodeName());			//직책
			        cell = row.createCell(3);
			    	if(langCode.equals("kr")) {
			    		cell.setCellValue(vo.getEmpName());				//이름
			    	}else {
			    		cell.setCellValue(vo.getEmpNameEn());			//이름 En	
			    	}
			        cell = row.createCell(4);
			        cell.setCellValue(vo.getLoginId());					//아디
			        cell = row.createCell(5);
			        cell.setCellValue(vo.getHomeTelNum());				//전번
			        cell = row.createCell(6);
			        cell.setCellValue(vo.getMobileTelNum());			//폰번
				}
            }); 
		
		    //저장시간구해서 파일명으로한다. 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
			Date time = new Date();
			String str = dayTime.format(time);
			
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\""+ str +"_QS_emp_table("+langCode+").xlsx\""));
			wb.write(response.getOutputStream());
		

		} catch(Exception e) {
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type","text/html; charset=utf-8");
			
			OutputStream out = null;
			try {
				out = response.getOutputStream();
				byte[] data = new String("fail..").getBytes();
				out.write(data, 0, data.length);
			} catch(Exception ignore) {
				ignore.printStackTrace();
			} finally {
				if(out != null) try { out.close(); } catch(Exception ignore) {}
			}
			
		} finally {
			sqlSession.close();
			
			// 디스크 적었던 임시파일을 제거합니다.
			wb.dispose();
			
			try { wb.close(); } catch(Exception ignore) {}
		}
		
	}
	
}