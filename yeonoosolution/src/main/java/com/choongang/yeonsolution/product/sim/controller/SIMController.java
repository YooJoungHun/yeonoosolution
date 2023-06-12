package com.choongang.yeonsolution.product.sim.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
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
	@GetMapping(value = {"/status", "/register"})
	public String inPage(StInDto stInDto, Model model, HttpServletRequest request) {
	    String requestURI = request.getRequestURI();
	    
	   // 기타입고 등록
	    if(requestURI.endsWith("/register")) stInDto.setOrderType(Long.parseLong("2"));
	    
	    List<StInDto> stInList = simService.findStIn(stInDto);
	    model.addAttribute("stInList", stInList);
	    System.out.println(requestURI);
	    
	    if(requestURI.endsWith("/register")) {
	        return "product/sim/stock-in.layout";
	    } else {
	        return "product/sim/stock-in-info.layout";
	    }
	}
	
	/** 페이지 접속 */
//	@GetMapping(value = "register")
//	public String InRegister(StInDto stInDto, Model model) {
//		List<StInDto> stInList = simService.stInList(stInDto);
//		model.addAttribute("stInList", stInList);
//		return "product/sim/in-register";
//	}
//	
	/** 검색 조회 */
	@RequestMapping(value = "/btn/{action}")
	public String find(	@PathVariable(name = "action")String action,
						@RequestParam(required = false)Map<String, Object> data,
						RedirectAttributes redirectAttributes) {
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		StInDto stInDto = null;
		stInDto = om.convertValue(data, StInDto.class);
		String inDate = stInDto.getInDate();
		stInDto.setInDate(inDate.replace("-", "/"));
		
		System.out.println(action+stInDto);
		
		switch (action) {
		case "find":
			redirectAttributes.addFlashAttribute("stInDto", stInDto); break;
		case "save":
			simService.modifyStIn(stInDto); break;
		case "delete":
			simService.removeStIn(stInDto); break;
		case "fix":
			System.out.println("확정 데이터 \n"+stInDto);
			simService.modifyStInFix(stInDto); break;
		case "cancel":
			simService.modifyStInCancel(stInDto); break;
		}
		return "redirect:/product/sim/status";
	}
	
	/** Ajax 등록, 수정, 삭제 */
	@RequestMapping(value = "/ajax/{action}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, String>> inModify(@PathVariable(name = "action")String action,
	                                                    @RequestBody(required = false)List<StInDetailDto> sidList) {
		Map<String, String> result = new HashMap<String, String>();
		String resultStr = null;
	        switch (action) {
	        case "add":
	        	System.out.println("\n저장\n"+sidList);
	        	simService.addStInDetail(sidList);
	        	break;
	        case "update":
	            //simService.modifyStIn(data); break;
	        case "delete":
	        	System.out.println("\n삭제\n"+sidList);
	        	simService.removeStInDetail(sidList);
	        	break;
	        }
	    result.put("result", resultStr);
	    return ResponseEntity.ok(result);
	}

//	/** 수정, 삭제 */
//	@RequestMapping(value = "/btn/{action}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<String> inDetail(	@PathVariable(name = "action")
//											String action,
//											@RequestBody(required = false)Map<String, Object> data) {
//		ObjectMapper om = new ObjectMapper();
//		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
//		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//		
//		StInDto stInDto = null;
//		stInDto = om.convertValue(data, StInDto.class);
//		
//		
//		if(stInDto.getInDate() != null) {
//			String inDate = stInDto.getInDate();
//			stInDto.setInDate(inDate.replace("-", "/"));
//		}
//
////		List<StInDetailDto> sid = null;
//		CompanyDto companyDto = null;
////		companyDto = om.convertValue(data, CompanyDto.class);
////		stInDto.setCompanyDto(companyDto);
////		System.out.println(stInDto);
//		
//		// 수정, 삭제, 확정, 확정취소, 등록
//		switch (action) {
//		case "update":
//			simService.modifyStIn(stInDto); break;
//		case "delete":
//			simService.removeStIn(stInDto); break;
//		case "fix":
//			simService.modifyStInFix(stInDto); break;
//		case "cancel":
//			simService.modifyStInCancel(stInDto); break;
//		}
//		return ResponseEntity.ok("성공");
//	}
//	

	
//	@RequestMapping(value = "/register/save",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public ResponseEntity<String> receiveData(@RequestBody(required = false) List<Map<String, Object>> data){
//		System.out.println(data);
//			
//		return ResponseEntity.ok("등록 완료");
//	}
	
	/** Ajax Modal의 테이블  목록 */
	@GetMapping(value = "/modal/{find}")
	@ResponseBody
	public ResponseEntity<?> modalList(@PathVariable(name =  "find") String find) {
		List<?> findList = Collections.EMPTY_LIST;
		HttpStatus status = HttpStatus.OK;
		
		switch (find) {
		case "findCompany":
			findList = simService.findCompany(); break;
		case "findWh":
			findList = simService.findWh(); break;
		case "findItem":
			findList = simService.findItem(); break;
		case "findOrders":
			findList = simService.findOrders(); break;
		}
		return new ResponseEntity<>(findList, status);
	}
	
	/** Ajax 입고 등록 */
	@PostMapping(value = "/ajax/register")
	@ResponseBody
	public ResponseEntity<String> stInSave(@RequestBody(required = false) Map<String, Object> data) {
		
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		StInDto stInDto = null;
		stInDto = om.convertValue(data, StInDto.class);
		String inDate = stInDto.getInDate();
		stInDto.setInDate(inDate.replace("-", "/"));		

		System.out.println("\n입고 등록 이벤트\n"+data);
		simService.addStIn(stInDto);
		
		return ResponseEntity.ok("등록 완료");
	}
	
}
