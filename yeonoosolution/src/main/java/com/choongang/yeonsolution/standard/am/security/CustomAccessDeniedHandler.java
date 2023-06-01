package com.choongang.yeonsolution.standard.am.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
/**
 * 권한이 필요한 resources에 권한이 없는 유저가 접속을 시도했을 때 실행
 * 이전 페이지 없이 바로 접근시 로그인페이지로, 이전페이지에서 접근시 이전페이지로 prevUrl을 저장하여 front에 전달
 * 403 에러페이지에서 이전 페이지로 이동하도록 설정
 * @author 장성태
 * @since 2023/05/29
 */
@Component
@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("[handle] accessDeniedException : {}", accessDeniedException.getMessage());
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String defaultUrl = "/standard/login";
		String redirectUrl = "/standard/not-authorized";
		
		if (savedRequest != null) {
			String prevUrl = savedRequest.getRedirectUrl();
			request.getSession().setAttribute("prevUrl", prevUrl);
		} else {
			request.getSession().setAttribute("prevUrl", defaultUrl);
		}
		
        if (isAjaxRequest(request)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
        } else {
            response.sendRedirect(redirectUrl);
        }
		
	}

	private boolean isAjaxRequest(HttpServletRequest request) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	}

}
