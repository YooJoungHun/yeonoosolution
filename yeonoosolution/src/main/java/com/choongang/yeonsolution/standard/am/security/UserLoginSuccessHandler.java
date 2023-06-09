package com.choongang.yeonsolution.standard.am.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/**
 * 로그인 성공 Handler
 * login 페이지 직접 접속 후 인증 성공시 redirectUrl로 이동
 * 이전 접속정보가 있을경우 이전 접속한 url로 이동
 * 인증성공한 member의 정보를 세션에 저장
 * @author 장성태
 * @since 2023/05/30
 */
@Component
@Slf4j
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		//Security가 요청을 가로채기 전 request정보를 가지고 있는 객체
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		//login페이지로 직접 접속한 경우 redirectUrl의 default값 설정
		String redirectUrl = "/";
		//인증성공한 member의 정보를 session에 set 해주기 위한 객체
		UserDetailsDto memberInfo = (UserDetailsDto) authentication.getPrincipal();
		
		//권한인증 실패로 인한 로그인인 경우
		if (savedRequest != null) {
			//Security가 요청을 가로채기 전 url로 redirect
			redirectUrl = savedRequest.getRedirectUrl();
			//메모리 누수 방지를 위한 session clearing(현재 로직에서는 session 객체를 사용할 필요가없어 사용하지 않았으나, 필요하면 사용 후 제거)
			requestCache.removeRequest(request, response);
		}
		//인증성공한 member의 정보를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("member", memberInfo.getMemberDto());
		session.setAttribute("memberId", memberInfo.getMemberDto().getMemberId());
		session.setAttribute("memberUid", memberInfo.getMemberDto().getMemberUid());
		session.setAttribute("memberCompanyCode", memberInfo.getMemberDto().getCompanyCode());
		log.info("[onAuthenticationSuccess] member : {}", memberInfo.getMemberDto());
		response.sendRedirect(redirectUrl);
		
	}

}
