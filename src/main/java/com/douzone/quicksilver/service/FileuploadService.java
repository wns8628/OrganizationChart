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
import javax.imageio.stream.ImageOutputStream;
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
		//		String loadFile = "C:/temp/Lighthouse.jpg";  //원본 이미지
		//		String saveFile = "C:/temp/Lighthouse_s.jpeg"; //생성될 썸네일이미지명
		int zoom = 5;               //축소하고 싶은 비율

		try
		{
			if( profilePicture.getSize() == 0 )
			{
				return url;
			}

			String originalFileName = profilePicture.getOriginalFilename();

			//확장자 분리
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.') + 1);

			String saveFileName = generateSaveFileName(extName);

			createImage(profilePicture, url + saveFileName, zoom);

			//profilePicture.transferTo(new File(saveFileName));

			return mappingUrl + saveFileName;
			//			long filesize = profilePicture.getSize();
			//			
			//			System.out.println("###############" + originalFileName);
			//			System.out.println("###############" + extName);
			//			System.out.println("###############" + saveFileName);
			//			System.out.println("###############" + filesize);
			//	
			//			byte[] fileData = profilePicture.
			//			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + 

			//saveFileName);
			//			os.write( fileData );
			//			os.close();
			//			
			//			url = URL + "/" + saveFileName;
		}
		catch (IOException e) 
		{
			new RuntimeException("upload fail");
		}
		return url;
	}

	private String generateSaveFileName(String extName)
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

	public static void createImage(MultipartFile loadFile, String saveFile, int zoom) 

			throws IOException{

		File  thum = new File(saveFile);//썸네일 이미지에 대한 파일 객체 생성
		RenderedOp render = JAI.create("fileload", loadFile); //원본 이미지에 대

		BufferedImage bi = render.getAsBufferedImage();//BufferImage 객체를 얻어옴
		if(zoom <= 0) zoom = 1;//축소비율이 0이 될수없으므로
		int width = bi.getWidth()  / zoom;
		int height = bi.getHeight() / zoom;

		BufferedImage bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D  g2 = bufferIm.createGraphics();//Graphics2D 객체 생성
		g2.drawImage(bi, 0, 0, width, height, null);//이미지를 가로 ,세로 크기로
		ImageIO.write(bufferIm, "jpeg", thum);//그려진 이
	}
}
