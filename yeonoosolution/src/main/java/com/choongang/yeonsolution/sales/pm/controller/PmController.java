package com.choongang.yeonsolution.sales.pm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.service.PmService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/pm")
public class PmController {
	private final PmService pmService;
	
	@GetMapping("")
	public String orderForm() {
		return "sales/order";
	}
	
	@GetMapping("/order-list")
	@ResponseBody
	public List<OrdersDto> findOrdersBySearch(Search search){
		log.info("search Data -> {}", search);
		List<OrdersDto> orderList = pmService.findOrdersBySearch(search);
		return orderList;
		
	}
	
	@GetMapping("/order/{orderCode}/details")
	@ResponseBody
	public List<OrdersDetailDto> findordersDetailByOrderCode(@PathVariable String orderCode){
		
		List<OrdersDetailDto> ordersDetailList = pmService.findOrdersDetailByOrderCode(orderCode);
		return ordersDetailList;
	}

}
