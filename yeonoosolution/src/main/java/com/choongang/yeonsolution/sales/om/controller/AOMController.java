package com.choongang.yeonsolution.sales.om.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.om.domain.OrdersAOMDto;
import com.choongang.yeonsolution.sales.om.service.AOMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AOMController {
	
	private final AOMService aomService;
	
	@Autowired
	public AOMController(AOMService aomService) {
		this.aomService = aomService;
	}
	
	@GetMapping("/sales/analysis-of-materials")
	public String analysisOfMaterials() {
		
		log.info("[analysisOfMaterials]");
		
		return "sales/analysis-of-materials";
	}
	
	
	/*
	 * 수주 content List
	 */
	@GetMapping("/sales/analysis-of-materials/receive-order-list")
	@ResponseBody
	public List<OrdersAOMDto> recieveOrderList() {
		
		log.info("[recieveOrderList]");
		
		List<OrdersAOMDto> recieveOrderList = aomService.findRecieveOrderListByCompanyCode();
		//model.addAttribute("placeOrderList", placeOrderList);
		
		return recieveOrderList;
	}
	
	/*
	 * semi-manufactures List
	 */
	@ResponseBody
	@GetMapping("/sales/analysis-of-materials/semi-manufactures-list")
	public List<OrdersAOMDto> semiManufactures(@RequestParam(value= "orderCode") String orderCode) {
		
		log.info("[semiManufactures] orderCode -> {}", orderCode);
		
		List<OrdersAOMDto> semiManufacturesList = aomService.findSemiManufacturesListByCompanyCode(orderCode);
		log.info("[semiManufactures] semiManufacturesList -> {}", semiManufacturesList.toString());
		
		return semiManufacturesList;
	}
	
}
