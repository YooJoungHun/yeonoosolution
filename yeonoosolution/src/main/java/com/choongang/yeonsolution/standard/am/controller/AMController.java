package com.choongang.yeonsolution.standard.am.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

import lombok.extern.slf4j.Slf4j;

/**
 * 권한관리 컨트롤러
 * @author 장성태
 * @since 2023/05/23
 */
@Controller
@RequestMapping("/standard")
@Slf4j
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
		if (amService.isAuthenticated()) {
			log.info("[loginPage] isAuthenticated() : true");
			return "redirect:/";
		} 
		return "standard/login";
	}

	/**
	 * 사용자 계정관리 페이지 호출
	 * @return 사용자 계정관리 페이지 호출 url
	 */
	@GetMapping("/user-admin")
	public String userAdminPage() {
		return "standard/user-admin.layout";
	}
	
	/**
	 * 403 error 처리 페이지
	 * @return 403 error 처리 페이지 url 
	 */
	@RequestMapping("/not-authorized")
	public String notAuthorizedPage() {
		return "standard/not-authorized";
	}
	
	/**
	 * user-admin페이지 로드시, member의 companyCode에 해당하는 memeberList조회
	 * @return memberList
	 */
	@GetMapping("/members/company-code/{companyCode}")
	@ResponseBody
	public List<AMDto> memberListByCompanyCode(@PathVariable String companyCode){
		log.info("[memberListByCompanyCode] companyCode : {}", companyCode);
		
		List<AMDto> memberList = amService.findMemberListByCompanyCode(companyCode);
		
		return memberList;
	}
	
	/**
	 * 전체 회사목록 조회
	 */
	@GetMapping("/companies")
	@ResponseBody
	public List<AMDto> companyList(){
		List<AMDto> companyList = amService.findCompanyList();
		
		return companyList;
	}
	
	/**
	 * 전체 부서목록 조회
	 */
	@GetMapping("/departments")
	@ResponseBody
	public List<AMDto> departmentList(){
		List<AMDto> departmentList = amService.findDepartmentList();
		
		return departmentList;
	}
	
	/**
	 * 전체 직책목록 조회
	 */
	@GetMapping("/jobs")
	@ResponseBody
	public List<AMDto> jobList(){
		List<AMDto> jobList = amService.findJobList();
		
		return jobList;
	}
	
	/**
	 * 저장버튼 요청 url
	 * memberUid의 null 여부를 통해 수정, 등록을 수행
	 * @param memberList
	 */
	@PatchMapping("/members")
	@ResponseBody
	public ResponseEntity<Object> membersSave(@RequestBody List<MemberDto> memberList){
		log.info("[membersSave] memberList : {}", memberList);
		int result = amService.membersSaveByMemberList(memberList);
		return ResponseEntity.ok(result);
	}
	
	/**
	 * 검색 버튼 요청 url
	 * 여러키워드로 검색시 글자를 쪼개서 글자 각각을 포함하는 member 조회
	 * id name 동시 검색시 두 조건 모두 만족하는 member 표시
	 * @param keywordDto(idKeyword, nameKeyword)
	 */
	@GetMapping("/members/keyword")
	@ResponseBody
	public List<AMDto> memberListByKeyword(AMDto keywordDto){
		log.info("[memberListByNameKeyword] keywordDto : {}", keywordDto);
		List<AMDto> memberList = amService.findMemberListByKeyword(keywordDto);
		return memberList;
	}
	
}//end class
