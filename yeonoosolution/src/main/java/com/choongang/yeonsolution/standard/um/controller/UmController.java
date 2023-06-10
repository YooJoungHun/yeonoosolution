package com.choongang.yeonsolution.standard.um.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;
import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.um.domain.DepartmentDto;
import com.choongang.yeonsolution.standard.um.domain.JobDto;
import com.choongang.yeonsolution.standard.um.service.UmService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UmController {
	private final UmService umService;

	@GetMapping("/standard/myPage")
	public String myInfoDetailByMemberUid(@AuthenticationPrincipal UserDetailsDto userDetailsDto, 
										  MemberDto memberDto, 
										  Model model) {
		
		memberDto.setMemberUid(userDetailsDto.getMemberDto().getMemberUid());

		MemberDto memberDtoList = umService.findMyInfoByMemberUid(memberDto);
		List<DepartmentDto> deptDepartmentDtoList = umService.findDeptList();
		List<JobDto> jobDtoList = umService.findJobList();

		model.addAttribute("memberDtoList", memberDtoList);
		model.addAttribute("deptDepartmentDtoList", deptDepartmentDtoList);
		model.addAttribute("jobDtoList", jobDtoList);

		return "/standard/mypage.layout";
	}
	
	// 개인정보수정 -> 프로필 이미지 업로드할 때만 실행.
	@PostMapping("/standard/myPage/{memberUid}")
	@ResponseBody
	public int memberImageModifyByMemberUid(@PathVariable("memberUid") String memberUid,
											@RequestParam("memberImage") MultipartFile file, 
											HttpServletRequest request) throws java.io.IOException {

		int result = 0;
		result = umService.modifyMemberImageByMemberUid(memberUid, file, request);

		return result;
	}

	@PutMapping("/standard/myPage/{memberUid}")
	@ResponseBody
	public int myInfoModifyByMemberUid(@PathVariable("memberUid") String memberUid, MemberDto memberDto) {
		int result = 0;

		result = umService.modifyMyInfoByMemberUid(memberDto);

		return result;
	}

	@PostMapping("/standard/myPage/changePassword/{memberUid}")
	@ResponseBody
	public int myPasswordModifyByMemberUid(@PathVariable("memberUid") String memberUid, MemberDto memberDto) {
		int result = 0;

		result = umService.modifyMyPasswordByMemberUid(memberDto);

		return result;
	}

	/* 부서 등록 페이지 */

	@GetMapping("/standard/dept")
	public String deptList(Model model) {
		List<DepartmentDto> deptDepartmentDtoList = umService.findDeptList();
		model.addAttribute("deptDepartmentDtoList", deptDepartmentDtoList);
		return "/standard/deptList.layout";
	}

	@GetMapping("/standard/dept/search/")
	@ResponseBody
	public List<DepartmentDto> deptListByDeptName(@RequestParam("deptName") String deptName) {
		List<DepartmentDto> departmentDto = umService.findDeptListByDeptName(deptName);
		System.out.println("deptlist-> " + departmentDto);
		return departmentDto;
	}

	@PutMapping("/standard/dept/{deptCode}")
	@ResponseBody
	public int deptModifybyDeptCode(@PathVariable("deptCode") String deptCode,
									@ModelAttribute DepartmentDto departmentDto,
									@AuthenticationPrincipal UserDetailsDto userDetailsDto) {
		int result = 0;
		departmentDto.setMemberUid(userDetailsDto.getMemberDto().getMemberUid());
		result = umService.modifyDeptByDeptCode(departmentDto);

		return result;
	}

	@PostMapping("/standard/dept/{deptName}")
	@ResponseBody
	public int deptAddBydeptName(@PathVariable("deptName") String deptName,
								 @ModelAttribute DepartmentDto departmentDto,
								 @AuthenticationPrincipal UserDetailsDto userDetailsDto) {
	
		departmentDto.setMemberUid(userDetailsDto.getMemberDto().getMemberUid());

		int result = 0;
		result = umService.addDeptBydeptName(departmentDto);

		return result;
	}

	@GetMapping("/standard/dept/member/{deptCode}")
	@ResponseBody
	public List<MemberDto> memberListByDeptCode(@PathVariable("deptCode") String deptCode, MemberDto memberDto) {
		List<MemberDto> memberDtoList = umService.findMemberByDeptCode(memberDto);
		// kind == null 일반검색
		// kind == 1	ajax용 조직도 검색
		log.info("kind -> {} ", memberDto.getKind());
		return memberDtoList;
	}

	// 직급등록 및 확인

	@GetMapping("/standard/job")
	public String jobList(Model model) {

		List<JobDto> jobDtoList = umService.findJobList();
		model.addAttribute("jobDtoList", jobDtoList);
		return "standard/jobList.layout";
	}

	
	 @PutMapping("/standard/job/{jobCode}")
	 @ResponseBody
	 public int jobModifybyJobCode(@PathVariable("jobCode") String jobCode,
			 					   @ModelAttribute JobDto jobDto,
			 					   @AuthenticationPrincipal UserDetailsDto userDetailsDto) {
		 int result = 0;
		 jobDto.setMemberUid(userDetailsDto.getMemberDto().getMemberUid());
		 result = umService.modifyJobByJobCode(jobDto);
		 
		 return result;
	 }
	 
	 @PostMapping("/standard/job/{jobName}")
	 @ResponseBody
	 public int jobAddByJobName(@PathVariable("jobName") String jobName,
			 					@ModelAttribute JobDto jobDto,
			 					@AuthenticationPrincipal UserDetailsDto userDetailsDto) {
		 int result = 0;
		 jobDto.setMemberUid(userDetailsDto.getMemberDto().getMemberUid());
		 result = umService.addJobByJobName(jobDto);
		 
		 return result;
	 }
	 
	 @GetMapping("/standard/job/search/")
	 @ResponseBody
	 public List<JobDto> jobListByjobName(@RequestParam("jobName") String jobName){
		 List<JobDto> jobDto = umService.findjobListByJobName(jobName);
		 return jobDto;
	 }
	 
	 @GetMapping("/standard/job/member/{jobCode}")
	 @ResponseBody
	 public List<MemberDto> memberListByJobCode(@PathVariable("jobCode") String jobCode,
			 									@ModelAttribute MemberDto memberDto){
		 // kind == null 일반검색
		 // kind == 1	ajax용 조직도 검색
		 log.info("kind -> {} ", memberDto.getKind());
		 List<MemberDto> memberDtoList = umService.findMemberByJobCode(memberDto);
		 return memberDtoList;
	 }
	 

}
