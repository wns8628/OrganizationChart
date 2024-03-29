package com.douzone.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzone.quicksilver.service.MainService;
import com.douzone.quicksilver.vo.UserVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MainService mainService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		//new UserService().getUser(email,password); //이러면 망하지 왜냐 의존성해결을 우리가 직접하겠다는거잔아 
		
		//그래서 직접 컨테이너에 접근해서 가져와야함 - 전역범위컨텍스트임? -라이프스코프-
		/*
		 * ApplicationContext ac =
		 * WebApplicationContextUtils.getWebApplicationContext(request.getServletContext
		 * ()); UserService userService = ac.getBean(UserService.class);
		 * 컨텍스트 안이라서 주입가능 
		 */ 
		
		
		//로그인한사람은 보내면안됨
		HttpSession session = request.getSession();
		UserVo authUser = (UserVo)session.getAttribute("authuser");
		if(authUser != null){		
			response.sendRedirect(request.getContextPath()+ "/");
			return false;
		} 		
		
	    authUser = new UserVo();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println(id+":"+password);
		
		authUser.setId(id);
		authUser.setPassword(password);
		
		authUser = mainService.login(authUser);
		System.out.println(authUser);
		if(authUser == null) {
			response.sendRedirect(request.getContextPath()+ "/login?result=fail");
			return false;
		} else if(authUser.getEmpSeq().equals("admin")){
			System.out.println(authUser.getEmpSeq());
			authUser.setRole("ADMIN");
		}
		
		//로그인 처리 
		session = request.getSession(true);
		session.setAttribute("authuser", authUser);
		response.sendRedirect(request.getContextPath()+"/admin/chart");
		return false;
	}
}
