package com.douzone.quicksilver.initializer;

import javax.servlet.Filter; 
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.douzone.quicksilver.config.AppConfig;
import com.douzone.quicksilver.config.WebConfig;


public class MysiteWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[]{ WebConfig.class };
	}
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[]{ AppConfig.class};
	}

	@Override
	protected Filter[] getServletFilters() {
		
//		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter()
		
		return new Filter[] { new CharacterEncodingFilter("UTF-8", true)};
	}

	
	//잘안됨
//	@Override
//	protected FrameworkServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
//		DispatcherServlet dispatcherServlet = (DispatcherServlet)super.createDispatcherServlet(servletAppContext);
//	
//		//핸들러가 없으면 익셉션을 발생시켜라
//		dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
//		
//		return dispatcherServlet;
//	}

	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig( new MultipartConfigElement("/usr/local/quicksilver/xorwnTest/upload", 2100000, 4200000, 0));
	}
	
	
	
}
