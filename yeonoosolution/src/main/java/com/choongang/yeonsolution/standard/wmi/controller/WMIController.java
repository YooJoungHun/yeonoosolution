package com.choongang.yeonsolution.standard.wmi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.wmi.domain.WMIWhDto;
import com.choongang.yeonsolution.standard.wmi.service.WMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class WMIController {
	
	private final WMIService	wmiService;
	
	// 창고 list
	@GetMapping(value = "/standard/warehouseLists/")
	public String WHList(Model model) {
		log.info("WMIController WHList start");
		
		List<WMIWhDto> listWarehouse = wmiService.findWarehouses();
		log.info("WMIController WHList listWarehouse size -> "+ listWarehouse.size());
		
		model.addAttribute("listWarehouse", listWarehouse);
		
		return "standard/wmi/whForm.layout";
		
	}
	
	
	// search 창고 list
	@GetMapping(value = "/standard/warehouseSearchLists/")
	public String WHSearchList(@ModelAttribute WMIWhDto whDto, Model model) {
		log.info("WMIController WHSearchList start");
		
		log.info("WMIController WHSearchList WhDto whName -> "+ whDto.getWhName());
		
		List<WMIWhDto> searchWHList = wmiService.findWareHouseSearchByWhDto(whDto);
		log.info("WMIController WHSearchList searchWHList size -> "+ searchWHList.size());
		
		model.addAttribute("searchWHList", searchWHList);
		
		return "standard/wmi/whSearchTable";
	}
	
	// 수정 및 삭제 시 사용
	@ResponseBody
	@PutMapping(value = "/standard/warehouseModified/")
	public int WHSave(@ModelAttribute WMIWhDto whDto, Model model) {
		log.info("WMIController WHSave start");
		
		System.out.println("whDto.getUseYn()->"+whDto.getUseYn());
		
		int modifiedResult = wmiService.saveWareHouseByWhDto(whDto);
		log.info("WMIController WHSave modifiedResult -> "+ modifiedResult);
		
		return modifiedResult;
	}
	
	// 창고 등록창 이동
	@GetMapping("/standard/warehouseInsertForm/")
	public String WHInsertWindow(Model model) {
		log.info("WMIController WHInsertWindow start");
		
		return "standard/wmi/whInsertForm";
	}
	
	// 창고 등록
	@ResponseBody
	@PostMapping("/standard/insertWh/")
	public String WHAdd(HttpSession session ,@ModelAttribute WMIWhDto whDto, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		whDto.setRegUser(memberDto.getMemberUid());
		log.info("WMIController WHAdd start");
		int insertResult = wmiService.addtWareHouseByWhDto(whDto);
		log.info("WMIController WHAdd insertResult -> "+ insertResult);
		
		return ""+insertResult;
	}
}
