package com.choongang.yeonsolution.standard.am.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 권한관리 컨트롤러
 * @author 장성태
 * @since 2023/05/23
 */
@Controller
@RequestMapping("v1/standard")
public class AMController {
	
	/**
	 * 로그인 페이지 호출
	 * @return 로그인페이지 url
	 */
	@GetMapping("/login")
	public String loginPage() {
		return "standard/login";
	}

	
}//end class
