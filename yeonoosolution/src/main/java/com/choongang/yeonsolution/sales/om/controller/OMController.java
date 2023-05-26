package com.choongang.yeonsolution.sales.om.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.service.OMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sales/receive-order")
public class OMController {
	
	private final OMService omService;
	
	@Autowired
	public OMController(OMService omService) { 
		this.omService = omService;
	}

	
	/*
	 * 수주서 관리
	 */
	@GetMapping("")
	public String placeOrder() {
		
		//log.info("[placeOrder] -> {}", companyCode);
		
		
		return "sales/receive-order";
	}
	
	/*
	 * 수주 content List
	 * 
	 */
	@GetMapping("/place-order-list")
	@ResponseBody
	public List<OrdersDto> placeOrderList() {
		
		//log.info("[placeOrder] -> {}", companyCode);
		
		List<OrdersDto> placeOrderList = omService.findPlaceOrderListByCompanyCode();
		//model.addAttribute("placeOrderList", placeOrderList);
		
		return placeOrderList;
	}
	
	/*
	 * 수주상태 확정
	 * 
	 */
	@PatchMapping("/{orderCode}/confirm")
	@ResponseBody
	public int modifyStatusToConfirmByorderCode(@PathVariable String orderCode){
		log.info("[modifyConfirmStatus] orderCode -> {}", orderCode);
		
		int orderStatus = omService.modifyStatusToConfirmByorderCode(orderCode);
		
		log.info("[modifyConfirmStatus] orderStatus -> {}", orderCode);
		log.info("[modifyConfirmStatus] orderStatus.getOrderStatus() -> {}", orderStatus);
		
		
		return orderStatus;
	}
	
	/*
	 * 수주상태 저장 
	 */
	@PatchMapping("/{orderCode}/cancel")
	@ResponseBody
	public int modifyStatusToCancelByorderCode(@PathVariable String orderCode){
		log.info("[modifyStatusToCancel] orderCode -> {}", orderCode);
		
		int orderStatus = omService.modifyStatusToCancelByorderCode(orderCode);
		
		log.info("[modifyStatusToCancel] orderStatus -> {}", orderCode);
		log.info("[modifyStatusToCancel] orderStatus.getOrderStatus() -> {}", orderStatus);
		
		
		return orderStatus;
	}
	
	/*
	 * 수주유형 변경 
	 */
	@PatchMapping("/{orderCode}/modify-type")
	@ResponseBody
	public String modifyOrderTypeByorderCode(@PathVariable String orderCode,
										    String receiveOrderType){
		log.info("[modifyOrderTypeByorderCode] orderCode -> {}", orderCode);
		log.info("[modifyOrderTypeByorderCode] receiveOrderType -> {}", receiveOrderType);
		
		OrdersDto ordersDto = new OrdersDto();
		ordersDto.setReceiveOrderType(receiveOrderType);
		
		int orderType = omService.modifyOrderTypeByorderCode(orderCode, ordersDto);
		String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyOrderTypeByorderCode] orderStatus -> {}", orderCode);
		log.info("[modifyOrderTypeByorderCode] ordersDto.getReceiveOrderType() -> {}", ordersDto.getReceiveOrderType());
		
		return orderTypeStr;
	}
	
	@PostMapping(value = "insert-receive-order")
	public String receiveOrderAdd(OrdersDto ordersDto, Model model) {
		
		omService.addReceiveOrder(ordersDto);
		if(ordersDto == null) {
			System.out.println("deptVO NULL");
		} else {
			model.addAttribute("msg", "정상 입력 되었습니다");
			model.addAttribute("ordersDto", ordersDto);
		}
		return "sales/receive-order";
	}
	
	
	
	
	
	
	
	//
	/*
	 * 수주 detail-content List
	 * 
	 */
	//@GetMapping("/place-order-detail-list/{orderCode}")
	@GetMapping("/place-order-detail-list")
	@ResponseBody
	//public List<OrdersDto> placeOrderDetailList(@PathVariable String orderCode) {
	public List<OrdersDetailDto> placeOrderDetailList(@RequestParam("orderCode") String orderCode) {
		
		log.info("[placeOrderDetailList] orderCode -> {}", orderCode);
		
		List<OrdersDetailDto> placeOrderDetailList = omService.findPlaceOrderDetailListByCompanyCode(orderCode);
		//model.addAttribute("placeOrderList", placeOrderList);
		
		return placeOrderDetailList;
	}
	
	
}
