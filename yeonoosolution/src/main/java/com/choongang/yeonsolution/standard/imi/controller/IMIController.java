package com.choongang.yeonsolution.standard.imi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.service.IMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class IMIController {
	
	private final IMIService imiService;
	
	@GetMapping("/standard/imi")
	public String item() {
		log.info("Item Controller Start");
		
		return "/standard/item-management-info";
	}
	
	@ResponseBody
	@GetMapping("/standard/imi/items")
	public List<ItemDto> itemList() {
		log.info("ItemList Controller Start");
		
		List<ItemDto> itemList = imiService.findItemList();
		
		return itemList;
	}
}
