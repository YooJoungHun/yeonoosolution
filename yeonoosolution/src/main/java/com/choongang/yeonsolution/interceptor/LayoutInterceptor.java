package com.choongang.yeonsolution.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;

public class LayoutInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		try {
			modelAndView.addObject("now", new Date());
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (authentication != null) {
				Object principal = authentication.getPrincipal();
				if (principal != null) {
					modelAndView.addObject("loginInfo", ((UserDetailsDto)principal).getMemberDto());
				}
			}
		} catch(Exception e) { }
	}
}
