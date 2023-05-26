package com.choongang.yeonsolution.standard.imi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.service.IMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/standard")
public class IMIController {
	
	private final IMIService imiService;
	
	@GetMapping("/imi")
	public String item() {
		log.info("Item Controller Start");
		
		return "standard/item-management-info";
	}
	
	@ResponseBody
	@GetMapping("/imi/items")
	public List<ItemDto> itemList() {
		log.info("ItemList Controller Start");
		
		List<ItemDto> itemList = imiService.findItemList();
		
		return itemList;
	}
	
	@ResponseBody
	@PostMapping("/imi/item")
	public int itemAdd(@RequestBody ItemDto itemInfo) {
		log.info("ItemAdd Controller Start");
		log.info("Item Info -> " + itemInfo);
		
		int insertResult = imiService.addItem(itemInfo);
		
		
		return insertResult;
	}
	
	@ResponseBody
	@GetMapping("/imi/wh")
	public List<ItemDto> whList() {
		log.info("whList Controller Start");
		
		List<ItemDto> whList = imiService.findWhList();	
		log.info("whList -> " + whList);
		
		return whList;
		
	}
	
	
	
	
	
}
