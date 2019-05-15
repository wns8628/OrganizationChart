package com.douzone.quicksilver.service;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzone.quicksilver.repository.EmployeeDao;
import com.douzone.quicksilver.vo.EmployeesVo;

import javax.imageio.ImageIO;
import javax.media.jai.*;


@Service
public class FileuploadService 
{	
	@Autowired
	private EmployeeDao employeeDao;

	private final String mappingUrl = "/uploads/images/";

	public String restore( MultipartFile profilePicture)
	{
		String url = "/usr/local/quicksilver/xorwnTest/upload/";
		int zoom = 6; //축소하고 싶은 비율

		try
		{
			if( profilePicture.getSize() == 0 )
			{
				return url;
			}

			String saveFileName = generateSaveFileName();
			profilePicture.transferTo(new File(saveFileName));
			createImage( url + saveFileName, url + saveFileName, zoom);
			return mappingUrl + saveFileName;
		}
		catch (IOException e) 
		{
			new RuntimeException("upload fail");
		}
		return url;
	}

	private String generateSaveFileName()
	{
		String fileName = "";
		Calendar calendar = Calendar.getInstance();

		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += (".jpeg");

		return fileName;
	}

	public int updateProfilePicture(String path, String empSeq) {
		EmployeesVo employeesVo = new EmployeesVo();
		employeesVo.setPicFileID(path);
		employeesVo.setEmpSeq(empSeq);

		return employeeDao.update(employeesVo);
	}

	public static void createImage(String loadFile, String saveFile, int zoom) throws IOException{

		File  thum = new File(saveFile);//썸네일 이미지에 대한 파일 객체 생성
		System.out.println(loadFile);
		RenderedOp render = JAI.create("fileload", loadFile); //원본 이미지에 대

		BufferedImage bi = render.getAsBufferedImage();//BufferImage 객체를 얻어옴
		if(zoom <= 0) zoom = 1;//축소비율이 0이 될수없으므로
		int width = 30;
		int height = 30;
		
		BufferedImage bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D  g2 = bufferIm.createGraphics();//Graphics2D 객체 생성
		g2.drawImage(bi, 0, 0, width, height, null);//이미지를 가로 ,세로 크기로
		ImageIO.write(bufferIm, "jpeg", thum);//그려진 이
	}
}
