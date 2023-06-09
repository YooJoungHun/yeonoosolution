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
	 */
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		
		httpSecurity
					.httpBasic().disable()
					.csrf().disable()
				    .cors()
			    	.and()
					//인증 허용 범위 설정
					.authorizeRequests()
						.antMatchers("/images/**").permitAll() //static resources 인증 제외
						.antMatchers("/standard/login", "/standard/not-authorized", "/main").permitAll() //로그인 페이지, 권한 부족 페이지, 메인페이지 인증 제외
						.antMatchers(HttpMethod.POST, "/**").hasAnyRole("ADMIN", "MANAGER") // POST 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
						.antMatchers(HttpMethod.PUT, "/**").hasAnyRole("ADMIN", "MANAGER") // PUT 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
						.antMatchers(HttpMethod.DELETE, "/**").hasAnyRole("ADMIN", "MANAGER") // DELETE 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
						.antMatchers(HttpMethod.PATCH, "/**").hasAnyRole("ADMIN", "MANAGER") // PATCH 요청은 ADMIN과 MANAGER 역할을 가진 사용자 모두 접근 가능
						.antMatchers("/standard/**").authenticated()
						.antMatchers("/product/**").hasAnyRole("PRODUCT", "ADMIN")
						.antMatchers("/sales/**").hasAnyRole("SALES", "ADMIN")
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
						.loginPage("/standard/login") //custom 로그인 페이지 설정, GET 로그인 요청
						.loginProcessingUrl("/standard/login") //POST 로그인 요청
						.usernameParameter("memberId")
						.passwordParameter("password")
						.successHandler(userLoginSuccessHandler)
						.failureHandler(userLoginFailureHandler)
						.and()
					//로그아웃 설정	
					.logout()
						.logoutUrl("/standard/logout")
						.logoutSuccessUrl("/")
						.and()
					.rememberMe()
						.key("secret")
						.rememberMeParameter("remember")
						.tokenValiditySeconds(600)
						.alwaysRemember(false)
						.userDetailsService(memberDetailsServiceImpl)
						.authenticationSuccessHandler(userLoginSuccessHandler);
		
		return httpSecurity.build();
	}

}//end class
