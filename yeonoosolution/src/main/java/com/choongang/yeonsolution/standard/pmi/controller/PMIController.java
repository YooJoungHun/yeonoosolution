package com.choongang.yeonsolution.standard.pmi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.BomDto;
import com.choongang.yeonsolution.standard.pmi.service.PMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/standard")
public class PMIController {
	
	private final PMIService pmiService;
	
	@GetMapping("/pmi")
	public String pmi() {
		log.info("Pmi Controller Start");
		
		return "standard/production-management-info";
	}
	
	@ResponseBody
	@GetMapping("/pmi/product/items")
	public List<ItemDto> productItemList() {
		log.info("Pmi ProductItemList Controller Start");
		
		List<ItemDto> productItemList = pmiService.findProductItemList();
		log.info("ProductItemList -> " + productItemList);
		
		return productItemList;
	}
	
	@ResponseBody
	@GetMapping("/pmi/product/semi-items")
	public List<ItemDto> semiProductItemList() {
		log.info("Pmi SemiProductItemList Controller Start");
		
		List<ItemDto> semiProductItemList = pmiService.findSemiProductItemList();
		log.info("semiProductItemList -> " + semiProductItemList);
		
		return semiProductItemList;
	}
	
	@ResponseBody
	@GetMapping("/pmi/bom-list/{itemCode}")
	public List<BomDto> bomList(@PathVariable String itemCode, BomDto bomDto) {
		log.info("Pmi bomList Controller Start");
		log.info("itemCode -> " + itemCode);
		log.info("bomDto -> " + bomDto);
		
		List<BomDto> bomList = pmiService.findBomListByItemCode(itemCode);
		log.info("bomList -> " + bomList);
		
		return bomList;
	}
	
	@ResponseBody
	@PostMapping("/pmi/bom")
	public int bomAdd(@RequestBody BomDto bomDto) {
		log.info("BomAdd Controller Start");
		log.info("Bom Info -> " + bomDto);
		
		int bomInsert = pmiService.addBomByBomDto(bomDto);
		
		return bomInsert;
	}
	
	
}
