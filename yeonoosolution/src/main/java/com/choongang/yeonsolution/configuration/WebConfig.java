package com.choongang.yeonsolution.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.yeonsolution.interceptor.LayoutInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Bean
	public LayoutInterceptor layoutInterceptor() { return new LayoutInterceptor(); }
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(layoutInterceptor()).addPathPatterns("/**").excludePathPatterns("/css/**", "/static/**", "/js/**");
	}
}
