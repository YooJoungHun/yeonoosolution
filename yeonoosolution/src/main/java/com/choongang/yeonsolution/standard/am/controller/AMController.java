package com.choongang.yeonsolution.standard.am.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

/**
 * 권한관리 컨트롤러
 * @author 장성태
 * @since 2023/05/23
 */
@Controller
@RequestMapping("v1/standard")
public class AMController {
	
	private final AMService amService;
	
	@Autowired
	public AMController(AMService amService) {
		this.amService = amService;
	}
	
	/**
	 * 로그인 페이지 호출
	 * @return 로그인페이지 url
	 */
	@GetMapping("/login")
	public String loginPage() {
		return "standard/login";
	}

	/**
	 * 로그인 테스트 페이지 호출
	 * @return 로그인 테스트 페이지 url
	 */
	@GetMapping("/loginTest")
	public String loginTestPage() {
		return "standard/loginTest";
	}
	
	/**
	 * 로그인
	 * @return jwt
	 */
	@PostMapping("/login")
	public ResponseEntity<Object> login(AMDto amDto){
		
		String token = amService.login(amDto);
		
		return ResponseEntity.ok(token); 
	}
	
}//end class
