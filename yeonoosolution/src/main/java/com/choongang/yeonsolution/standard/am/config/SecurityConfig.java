package com.choongang.yeonsolution.standard.am.config;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
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
	 * filterChain 설정
	 * 로그인페이지 설정 : /v1/standard/login → standard/login.jsp
	 * 로그인페이지 인증제외 설정
	 */
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
		
		httpSecurity.authorizeHttpRequests()
					.anyRequest()
					.authenticated()
					.and()
					.formLogin()
					.loginPage("/v1/standard/login")
					.permitAll();
		
		return httpSecurity.build();
	}

}//end class
