package com.choongang.yeonsolution.standard.bi.controller;

import java.io.IOException;
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
import com.choongang.yeonsolution.standard.bi.domain.CompanyDto;
import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.bi.service.BiService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/*
 * 기본정보 컨트롤러입니다.
 * 
*/

@Controller
@RequiredArgsConstructor
@Slf4j
public class BiController {
	private final BiService biService;
	
	@GetMapping("/standard/companyInfo")
	public String companyInfoDetailByCompanyCode(@AuthenticationPrincipal UserDetailsDto userDetails, MemberDto memberDto, Model model) {
		
		memberDto.setCompanyCode(userDetails.getMemberDto().getCompanyCode());
		memberDto.setMemberId(userDetails.getUsername());
		
		List<CompanyDto> companyDtoList = biService.findCompanyInfoByCompanyCode(memberDto.getCompanyCode());
		
		model.addAttribute("companyDtoList", companyDtoList);
		
		
		return "standard/company-info.layout";
	}
	
	@PutMapping("/standard/companyInfo/{companyCode}")
	@ResponseBody
	public int companyInfoModifyByCompanyCode(@PathVariable("companyCode") 	String companyCode,
											  @ModelAttribute 			   	CompanyDto companyDto,
											  @AuthenticationPrincipal 		UserDetailsDto userDetails) throws Exception{
		int result = 0;
		
		companyDto.setMemberUid(userDetails.getMemberDto().getMemberUid());
		
		result = biService.modifyCompanyInfoByCompanyCode(companyDto);
		
		return result;
	}
	
	// 화사정보수정 -> 회사 로고 사진 업로드 할때만 실행
	@PostMapping("/standard/companyInfo/{companyCode}")
	@ResponseBody
	public int companyLogoImgModifyByCompanyCode(@PathVariable("companyCode") String companyCode,
												 @RequestParam("companyLogo") MultipartFile file,
												 HttpServletRequest request) throws IOException {
		int result = 0;
		
		result = biService.modifyCompanyLogoImgByCompanyCode(companyCode, file, request);
				
		return result;
	}
	
	@GetMapping("/standard/customerInfo")
	public String customerInfoListByCompanyCode(Model model, @AuthenticationPrincipal UserDetailsDto userDetails) {
		
		 String companyCode = userDetails.getMemberDto().getCompanyCode();
		 
		 List<CompanyDto> companyDtoList = biService.findCustomerInfoByCompanyCode(companyCode);
		 model.addAttribute("customerLists", companyDtoList);
		
		return "standard/customer-info.layout";
	}
	
	@PutMapping("/standard/customerInfo/{companyCode}")
	@ResponseBody
	public int customerInfoModifyByCompanyCode(@PathVariable("companyCode") 	String companyCode,
											   @ModelAttribute 					CompanyDto companyDto,
											   @AuthenticationPrincipal 		UserDetailsDto userDetails) {
		int result = 0;
		companyDto.setMemberUid(userDetails.getMemberDto().getMemberUid());
		
		log.info("kind값이 1이면 수정 2면 삭제  -> {} ", companyDto.getKind());
		log.info("companycode -> {} ", companyCode);
		
		result = biService.modifyCustomerInfoByCompanyCode(companyDto);
		
		return result;
	}
	
	@PostMapping("/standard/customerInfo/")
	@ResponseBody
	public int customerInfoAdd(@ModelAttribute 				CompanyDto companyDto,
							   @AuthenticationPrincipal 	UserDetailsDto userDetails) {
		int result = 0;
		companyDto.setMemberUid(userDetails.getMemberDto().getMemberUid());
	
		result = biService.addCustomerInfo(companyDto);
		
		return result;
	}
	
	@GetMapping("/standard/customerInfo/search/")
	@ResponseBody
	public List<CompanyDto> customerInfoListByCompanyNameAndOrderType(@ModelAttribute CompanyDto companyDto){
	
		List<CompanyDto> companyDtoList = biService.findCustomerInfoByCompanyNameAndOrderType(companyDto);
	
		return companyDtoList;
		
	}

}
