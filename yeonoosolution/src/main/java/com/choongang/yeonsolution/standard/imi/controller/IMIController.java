package com.choongang.yeonsolution.standard.imi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.domain.CompanyDto;
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
	public String imi() {
		log.info("Imi Controller Start");
		
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
		
		int itemInsert = imiService.addItem(itemInfo);
		
		
		return itemInsert;
	}
	
	@ResponseBody
	@GetMapping("/imi/wh")
	public List<ItemDto> whList() {
		log.info("whList Controller Start");
		
		List<ItemDto> whList = imiService.findWhList();	
		log.info("whList -> " + whList);
		
		return whList;
	}
	
	@ResponseBody
	@GetMapping("/imi/companys")
	public List<CompanyDto> companyList() {
		log.info("companyList Controller Start");
		
		List<CompanyDto> companyList = imiService.findCompanyList();
		log.info("companyList -> " + companyList);
		
		return companyList;
	}
	

	@ResponseBody
	@PutMapping("/imi/{itemCode}")
	public Map<String, Integer> itemModify(@PathVariable("itemCode") String itemCode, @RequestHeader String action, @RequestBody ItemDto itemDto) {
		log.info("Item Update Controller Start");
		log.info("Item Update Code Is -> " + itemCode);
		log.info("Action Is -> " + action);
		
		int itemRemove = 0;
		int itemUpdate = 0;
		
		if (action.equals("delete")) {
			itemRemove = imiService.modifyItemByItemCode(itemCode);
		} else if (action.equals("update")) {
			itemUpdate = imiService.modifyItemByItemDto(itemDto);
		}
		
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("itemRemove", itemRemove);
		resultMap.put("itemUpdate", itemUpdate);
		
		log.info("itemRemoveResult -> " + itemRemove);
		log.info("itemUpdateResult -> " + itemUpdate);
				
		return resultMap;
	}
	

	
	
	
	
}
