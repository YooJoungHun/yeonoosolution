package com.choongang.yeonsolution.sales.om.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.om.domain.OMOrdersAOMDto;
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
	
	/*
	 * 자재요소분석 메인 페이지
	 * @return	sales/analysis-of-materials
	 */
	@GetMapping("/sales/analysis-of-materials")
	public String analysisOfMaterials() {
		
		log.info("[analysisOfMaterials]");
		
		return "sales/analysis-of-materials.layout";
	}
	
	
	/*
	 * 수주목록 
	 * analysis-of-materials.jsp에서 ajax 요청 및 수주 목록 출력
	 * @return	List 
	 */
	@GetMapping("/sales/analysis-of-materials/receive-order-list")
	@ResponseBody
	public List<OMOrdersAOMDto> recieveOrderList() {
		
		log.info("[recieveOrderList]");
		
		List<OMOrdersAOMDto> recieveOrderList = aomService.findRecieveOrderListByCompanyCode();
		
		return recieveOrderList;
	}
	
	/*
	 * 반재품 요소분석 출력
	 * analysis-of-materials.jsp에서 ajax 요청 및 수주 목록 출력
	 * @return	List
	 */
	@ResponseBody
	@GetMapping("/sales/analysis-of-materials/semi-manufactures-list")
	public List<OMOrdersAOMDto> semiManufactures(@RequestParam(value= "orderCode") String orderCode) {
		
		log.info("[semiManufactures] orderCode -> {}", orderCode);
		
		List<OMOrdersAOMDto> semiManufacturesList = aomService.findSemiManufacturesListByCompanyCode(orderCode);
		log.info("[semiManufactures] semiManufacturesList -> {}", semiManufacturesList.toString());
		
		return semiManufacturesList;
	}
	
}
