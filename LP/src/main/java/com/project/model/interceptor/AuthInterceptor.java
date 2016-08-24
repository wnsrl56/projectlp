package com.project.model.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.dto.Member;

public class AuthInterceptor implements HandlerInterceptor {

	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("Interceptor.afterCompletion");
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {	
		System.out.println("Interceptor.postHandle");
	}
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {

		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		
		String url = req.getRequestURI();
		boolean redirect = false;
		
		if ( url.contains("/cboard/")
				   || url.contains("/eboard/") 
				   || url.contains("/pboard/")
				   || url.contains("/qboard/") 
				)
		{
			if (member != null) {				
			} else {
				redirect = true;
			}
		}
		if (redirect) {
			resp.sendRedirect(
				"/rean/include/error.action");
			return false;
			
			
		} else {
			return true;//정상 진행 (Controller로 이동)
		}
		

	
	}



}
