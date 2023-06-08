package com.choongang.yeonsolution.standard.ipi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.imi.service.IMIService;
import com.choongang.yeonsolution.standard.ipi.service.IPIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/standard")
public class IPIController {
	
	private final IPIService ipiService;
	private final IMIService imiService;
	
	@GetMapping("/ipi")
	public String pmi() {
		log.info("Ipi Controller Start");
		
		return "standard/item-price-info.layout";
	}
	
	@ResponseBody
	@GetMapping("/ipi/items")
	public List<IMIItemDto> itemList() {
		log.info("Ipi ItemList Controller Start");
		
		List<IMIItemDto> itemList = imiService.findItemList();
		
		return itemList;
	}
	
	@ResponseBody
	@PutMapping("/ipi/{itemCode}")
	public int itemPriceModify(@PathVariable("itemCode") String itemCode, @RequestBody IMIItemDto itemDto) {
		log.info("Item Price Update Controller Start");
		log.info("Item Price Update Code Is -> " + itemCode);
		int updateResult = 0;
		
		updateResult = ipiService.modifyItemByItemDto(itemDto);
		
		log.info("updateResult -> " + updateResult);
		
		return updateResult;
	}
	
	
}
