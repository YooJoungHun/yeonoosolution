package com.choongang.yeonsolution.standard.am.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
/**
 * 인증이 실패하였을 때 실행
 * BAD_REQUEST 리턴 → 로그인페이지에 메시지 출력
 * @author 장성태
 * @since 2023/05/28
 */
@Component
@Slf4j
public class UserLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		log.info("[onAuthenticationFailure] exception : {}", exception.getMessage());
		
		int errorCode = HttpStatus.BAD_REQUEST.value();
		
		setDefaultFailureUrl("/standard/login?error=" + errorCode);
		super.onAuthenticationFailure(request, response, exception);
		
	}
}
