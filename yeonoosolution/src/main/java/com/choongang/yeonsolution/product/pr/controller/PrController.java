package com.choongang.yeonsolution.product.pr.controller;

import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.Item;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.product.wo.service.BomService;
import com.choongang.yeonsolution.product.wo.service.WoDetailService;
import com.choongang.yeonsolution.product.wo.service.WoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/product")
@RequiredArgsConstructor
public class PrController {
	private final WoService woService;
	private final WoDetailService woDetailService;
	private final BomService bomService;
	
	@RequestMapping(value = "/productResult")
	public String productResult(Model model) {
		
		return "product/pr/productResult.layout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getWoDetails")
	public String getWoDetails(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String workOrderCode = (String)data.get("workOrderCode");
		List<WoDetail> woDetailList = woDetailService.findWoDetail(workOrderCode);
		List<String> resultWoDetailList = woDetailList.stream().map(wod -> {
			String str = null;
			try { str = mapper.writeValueAsString(wod); }
			catch (JsonProcessingException e) { e.printStackTrace(); }
			return str;
		}).collect(Collectors.toList());
		WoDetail forBOM = new WoDetail();
		forBOM.setItem(woService.findOneWo(workOrderCode).getItem());
		Integer qtt = 0;
		for (WoDetail wod : woDetailList) qtt += wod.getWorkOrderQuantity();
		forBOM.setWorkOrderQuantity(qtt);
		List<Bom> bomList = bomService.findBomWithQuantity(forBOM);
		List<String> resultBomList = bomList.stream().map(bom -> {
			String str = null;
			try { str = mapper.writeValueAsString(bom); }
			catch (JsonProcessingException e) { e.printStackTrace(); }
			return str;
		}).collect(Collectors.toList());
		return String.format("{ \"detail\" : [%s], \"bom\" : [%s] }", String.join(",", resultWoDetailList), String.join(",", resultBomList));
	}
}
