package com.choongang.yeonsolution.standard.pmi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.PMIBomDto;
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
	public List<IMIItemDto> productItemList() {
		log.info("Pmi ProductItemList Controller Start");
		
		List<IMIItemDto> productItemList = pmiService.findProductItemList();
		log.info("ProductItemList -> " + productItemList);
		
		return productItemList;
	}
	
	@ResponseBody
	@GetMapping("/pmi/product/semi-items")
	public List<IMIItemDto> semiProductItemList() {
		log.info("Pmi SemiProductItemList Controller Start");
		
		List<IMIItemDto> semiProductItemList = pmiService.findSemiProductItemList();
		log.info("semiProductItemList -> " + semiProductItemList);
		
		return semiProductItemList;
	}
	
	@ResponseBody
	@GetMapping("/pmi/bom-list/{itemCode}")
	public List<PMIBomDto> bomList(@PathVariable String itemCode, PMIBomDto bomDto) {
		log.info("Pmi bomList Controller Start");
		log.info("itemCode -> " + itemCode);
		log.info("bomDto -> " + bomDto);
		
		List<PMIBomDto> bomList = pmiService.findBomListByItemCode(itemCode);
		log.info("bomList -> " + bomList);
		
		return bomList;
	}
	
	@ResponseBody
	@PostMapping("/pmi/bom")
	public int bomAdd(@RequestBody PMIBomDto bomDto) {
		log.info("BomAdd Controller Start");
		log.info("Bom Info -> " + bomDto);
		
		int bomInsert = pmiService.addBomByBomDto(bomDto);
		
		return bomInsert;
	}
	
	@ResponseBody
	@DeleteMapping("/pmi/bom")
	public int bomRemove(@RequestBody PMIBomDto bomDto) {
		log.info("BomRemove Controller Start");
		
		int bomRemove = pmiService.removeBomByBomDto(bomDto);
		log.info("BomRemove Info -> " + bomDto);
		
		return bomRemove;
	}
	
	
}
