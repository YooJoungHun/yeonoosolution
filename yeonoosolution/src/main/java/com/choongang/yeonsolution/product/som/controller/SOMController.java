package com.choongang.yeonsolution.product.som.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.som.domain.SOMStOutDto;
import com.choongang.yeonsolution.product.som.service.SOMService;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class SOMController {
	
	private final SOMService	somService;
	
	// 기타출고 리스트 행 조회
	@GetMapping(value = "/product/somStOutLists/") 
	public String stOutList (Model model) {
		log.info("SOMController stOutList start");
		
		// 출고리스트 조회.
		List<SOMStOutDto> stOutList = somService.findStOutLists();
		model.addAttribute("stOutList", stOutList);
		log.info("SOMController stOutList size -> "+ stOutList.size());
		
		return "product/som/stOutForm.layout";
	}
	
	@GetMapping(value = "/product/somStOutDetailLists/") // 품목리스트 조회
	public String stOutListByOutCode (@RequestParam("outCode") String outCode,
									Model model) {
		log.info("SOMController stOutListByOutCode start");
		log.info("SOMController stOutListByOutCode outCode -> "+ outCode);
		
		List<SOMStOutDto> stOutDetailList = somService.findStOutDetailListsByOutCode(outCode);
		
		log.info("SOMController stOutListByOutCode stOutDetailList size -> "+ stOutDetailList.size());
		
		model.addAttribute("stOutDetailList", stOutDetailList);
		
		return "product/som/stOutDetailForm";
	}
	
	
	@GetMapping(value = "/product/somStOutInsertForm/")
	public String stOutInsertWindow(Model model) {
		log.info("SOMController stOutInsertWindow start");
		
		List<SOMStOutDto> stOutWhLists = somService.findStOutDtoWhLists();
		log.info("SOMController stOutInsertWindow stOutWhLists size -> "+ stOutWhLists.size());
		List<SOMStOutDto> stOutItemLists = somService.findStOutDtoItemLists();
		log.info("SOMController stOutInsertWindow stOutItemLists size -> "+ stOutItemLists.size());
		
		model.addAttribute("stOutWhList", stOutWhLists);
		model.addAttribute("stOutItemList", stOutItemLists);
		
		return "product/som/stOutInsertForm";
	}
	
	@ResponseBody
	@PostMapping(value = "/product/insertsomStOut/")
	public String stOutAdd(HttpSession session ,@ModelAttribute SOMStOutDto stOutDto, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		stOutDto.setMemberName(memberDto.getMemberName());
		log.info("SOMController stOutAdd start");
		int insertResult = somService.addStOutBySOMStOutDto(stOutDto);
		log.info("SOMController stOutAdd insertResult -> "+ insertResult);
		
		return ""+insertResult;
	}
	
	@ResponseBody
	@PatchMapping(value = "/product/somStOutDelete/")
	public String stOutRemove(@RequestParam String outCode, Model model) {
		log.info("SOMController stOutRemove start");
		int deleteResult = somService.removeStOutByOutCode(outCode);
		log.info("SOMController stOutRemove deleteResult -> "+ deleteResult);
		
		
		return ""+deleteResult;
	}
}
