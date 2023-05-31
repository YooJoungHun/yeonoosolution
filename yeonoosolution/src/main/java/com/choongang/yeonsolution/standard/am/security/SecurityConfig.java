package com.choongang.yeonsolution.standard.am.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * Security설정파일
 * @author 장성태
 * @since 2023/05/23
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	@Autowired
	private AuthenticationSuccessHandler userLoginSuccessHandler;
	@Autowired
	private AuthenticationEntryPoint customAuthenticationEntryPoint;
	@Autowired
	private AuthenticationFailureHandler userLoginFailureHandler;
	@Autowired
	private AccessDeniedHandler customAccessDeniedHandler;
	@Autowired
	private UserDetailsService memberDetailsServiceImpl;
	
	/**
	 * SecurityFilterChain 설정
	 * 로그인페이지 설정 : /v1/standard/login → standard/login.jsp
	 * 로그인페이지 인증제외 설정
	 */
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		
		httpSecurity
					.httpBasic().disable()
					.csrf().disable()
				    .cors()
			    	.and()
					//인증 허용 범위 설정
					.authorizeHttpRequests()
						.antMatchers("/images/**").permitAll() //static resources 인증 제외
						.antMatchers("/v1/standard/login", "/v1/standard/sign-up", "/v1/standard/not-authorized").permitAll() //로그인 페이지, 회원가입 페이지 인증 제외
						.antMatchers(HttpMethod.POST, "/v1/standard/member").permitAll() //회원가입 인증 제외
						.antMatchers("/v1/standard/**").hasAnyRole("STANDARD", "ADMIN")
						.antMatchers("/v1/product/**").hasAnyRole("PRODUCT", "ADMIN")
						.antMatchers("/v1/sales/**").hasAnyRole("SALES", "ADMIN")
					    .antMatchers(HttpMethod.POST, "/v1/**").hasAnyRole("ADMIN", "MANAGER") // POST 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
					    .antMatchers(HttpMethod.PUT, "/v1/**").hasAnyRole("ADMIN", "MANAGER") // PUT 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
					    .antMatchers(HttpMethod.DELETE, "/v1/**").hasAnyRole("ADMIN", "MANAGER") // DELETE 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
					    .antMatchers(HttpMethod.PATCH, "/v1/**").hasAnyRole("ADMIN", "MANAGER") // PATCH 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
						.anyRequest()
						.authenticated()
						.and()
					//exceptionHandling 설정
					.exceptionHandling()
						.authenticationEntryPoint(customAuthenticationEntryPoint)
						.accessDeniedHandler(customAccessDeniedHandler)
						.and()
					//로그인 설정
					.formLogin()
						.loginPage("/v1/standard/login") //custom 로그인 페이지 설정, GET 로그인 요청
						.loginProcessingUrl("/v1/standard/login") //POST 로그인 요청
						.usernameParameter("memberId")
						.passwordParameter("password")
						.successHandler(userLoginSuccessHandler)
						.failureHandler(userLoginFailureHandler)
						.and()
					//로그아웃 설정	
					.logout()
						.logoutUrl("/v1/standard/logout")
						.logoutSuccessUrl("/v1/standard/login")
						.and()
					.rememberMe()
						.key("secret")
						.rememberMeParameter("remember")
						.tokenValiditySeconds(600)
						.alwaysRemember(false)
						.userDetailsService(memberDetailsServiceImpl);
		
		return httpSecurity.build();
	}

}//end class
