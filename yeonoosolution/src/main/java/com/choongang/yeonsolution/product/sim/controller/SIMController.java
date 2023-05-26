package com.choongang.yeonsolution.product.sim.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.OrdersDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhStockDetailDto;
import com.choongang.yeonsolution.product.sim.service.SIMService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SIMController {
	private final SIMService simService;

	
	
	@GetMapping(value = "/")
	public String StIn(Model model){
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
}
