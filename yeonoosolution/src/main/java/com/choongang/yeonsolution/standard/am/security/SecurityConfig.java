package com.choongang.yeonsolution.standard.am.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Security설정파일
 * @author 장성태
 * @since 2023/05/23
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	/**
	 * static resources에 대한 인증 제외 설정
	 */
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }
	
	/**
	 * SecurityFilterChain 설정
	 * 로그인페이지 설정 : /v1/standard/login → standard/login.jsp
	 * 로그인페이지 인증제외 설정
	 */
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		
					
		httpSecurity.httpBasic().disable()
					.csrf().disable()
					.cors()
					.and()
					//인증 허용 범위 설정
					.authorizeHttpRequests()
					.antMatchers("/v1/standard/login", "/v1/standard/sign-up").permitAll() //로그인 페이지, 회원가입 페이지 인증 제외
					.antMatchers(HttpMethod.POST, "/v1/standard/member").permitAll() //회원가입 인증 제외
					.anyRequest()
					.authenticated()
					.and()
					//로그인 설정
					.formLogin()
					.loginPage("/v1/standard/login") //custom 로그인 페이지 설정, GET 로그인 요청
					.loginProcessingUrl("/v1/standard/login") //POST 로그인 요청
					.usernameParameter("memberId")
					.passwordParameter("password")
					.defaultSuccessUrl("/v1/standard/login-test") //로그인 성공시 url
					.and()
					//로그아웃설정
					.logout()
					.logoutSuccessUrl("/v1/");
		
		return httpSecurity.build();
	}
	
	/**
	 * PasswordEncoder Bean 등록
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}//end class
