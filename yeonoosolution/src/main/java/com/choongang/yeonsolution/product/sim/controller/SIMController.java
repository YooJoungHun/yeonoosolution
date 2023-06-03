package com.choongang.yeonsolution.product.sim.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.service.SIMService;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/product/sim")
@RequiredArgsConstructor
public class SIMController {
	private final SIMService simService;

	/** 페이지 접속 */
	@GetMapping(value = "status")
	public String InStatus(StInDto stInDto, Model model) {
		List<StInDto> stInList = simService.stInList(stInDto);
		model.addAttribute("stInList", stInList);
		return "product/sim/in-status";
	}
	/** 페이지 접속 */
	@GetMapping(value = "register")
	public String InRegister(StInDto stInDto, Model model) {
		List<StInDto> stInList = simService.stInList(stInDto);
		model.addAttribute("stInList", stInList);
		return "product/sim/in-register";
	}
	
	@RequestMapping(value = "/a/{action}")
	public String find(	@PathVariable(name = "action")String action,
						@RequestParam(required = false)Map<String, Object> data,
						RedirectAttributes redirectAttributes) {
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		
		
		StInDto stInDto = null;
		CompanyDto companyDto = null;
//		List<StInDto> ls = null;
//		TypeReference<List<StInDto>> list = new TypeReference<List<StInDto>>() {};
//		ls = om.readValue(om.writeValueAsString(data), list);
//		System.out.println(ls);
		
		stInDto = om.convertValue(data, StInDto.class);
		companyDto = om.convertValue(data, CompanyDto.class);
		
		String inDate = stInDto.getInDate();
		stInDto.setInDate(inDate.replace("-", "/"));
		stInDto.setCompanyDto(companyDto);
		
		System.out.println(stInDto);
		
		switch (action) {
		case "find":
			redirectAttributes.addFlashAttribute("stInDto", stInDto); break;
		case "save":
			simService.modifyStIn(stInDto); break;
		case "delete":
			simService.removeStIn(stInDto); break;
		case "fix":
			simService.modifyStInFix(stInDto); break;
		case "cancel":
			simService.modifyStInCancel(stInDto); break;
		}
		return "redirect:/product/sim/status";
	}
	
	@RequestMapping(value = "/register",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> receiveData(@RequestBody(required = false) List<StInDto> stInList){
		for(StInDto sid : stInList) {
			System.out.println(sid);
		}
			
		return new ResponseEntity<String>("Data received successfully", HttpStatus.OK);
	}
	
//	@RequestMapping(value = "/")
//	public String pass() {
//		return "redirect:/product/is/item";
//	}
}
