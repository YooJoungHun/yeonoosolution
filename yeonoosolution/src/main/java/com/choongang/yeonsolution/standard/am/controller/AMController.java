package com.choongang.yeonsolution.standard.am.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;
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
	 * 임시 회원가입 페이지 호출
	 * @return 임시 회원가입 페이지 url
	 */
	@GetMapping("/sign-up")
	public String signUpPage() {
		return "standard/temp-sign-up";
	}
	
	/**
	 * 로그인 테스트 페이지 호출
	 * @return 로그인 테스트 페이지 url
	 */
	@GetMapping("/login-test")
	public String loginTestPage() {
		return "standard/login-test";
	}
	
	/**
	 * 회원가입
	 * @return 로그인 페이지
	 */
	@PostMapping("/member")
	public String memberAdd(MemberDto memberDto){
		
		int result = amService.addMember(memberDto);
		
		if (result > 0) {
			return "redirect:/login";
		}
		
		throw new IllegalArgumentException();
	}
	
}//end class
