package com.choongang.yeonsolution.product.sim.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.OrdersDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhStockDetailDto;
import com.choongang.yeonsolution.product.sim.service.SIMService;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SIMController {
	private final SIMService simService;

	@GetMapping(value = "/")
	public String StIn(Model model) {
		List<StInDto> stInList = simService.stInList();
		model.addAttribute("stInList", stInList);
//		for(StInDto sd : stInList) {
//			System.out.println(sd);
//			for(StInDetailDto sid : sd.getStInDetailDto()) {
//				System.out.println(sid);
//				System.out.println(sid.getWhDto());
//			}
//			System.out.println(sd.getOrdersDto());
//			for(OrdersDetailDto od : sd.getOrdersDto().getOrdersDetailDto()) {
//				System.out.println(od);
//			for(StInDetailDto d1 : sd.getStInDetailDto()) {
//				System.out.println(d1);
//				System.out.println(d1.getWhDto());
//				for(WhStockDetailDto w1 : d1.getWhDto().getWhStockDetailDto()) {
//					System.out.println(w1);
//					System.out.println(w1.getItemDto());
//			}
//			System.out.println(sd.getOrdersDto());
//			System.out.println(sd.getCompanyDto());

		return "product/st-in";
	}

	@GetMapping(value = "find")
	public String find(	@RequestParam(required = false)Map<String, Object> data,
//						@RequestParam(required = false)
//						@DateTimeFormat(pattern="yyyy/MM/dd")
//						Date regDate,
//						StInDto stInDto,
//						@RequestParam(name = "inDate", required = false)
//						@DateTimeFormat(pattern="yyyy/MM/dd")
//						String inDate,
						Model model) {
//		System.out.println(stInDto);
//		System.out.println(stInDto.getRegDate());
//		System.out.println(inDate);
//		@RequestParam(required = false)Map<String, Object> data
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		StInDto sid = om.convertValue(data, StInDto.class);
		System.out.println(sid);
		
		List<StInDto> stInList = simService.stInList(sid);
		model.addAttribute("stInList", stInList);
		
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaa");
		return "product/st-in";
	}
}
