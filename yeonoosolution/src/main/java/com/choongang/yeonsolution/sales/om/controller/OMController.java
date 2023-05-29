package com.choongang.yeonsolution.sales.om.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.service.OMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/sales/receive-order")
public class OMController {
	
	private final OMService omService;
	
	@Autowired
	public OMController(OMService omService) { 
		this.omService = omService;
	}

	
	/*
	 * 수주서 관리
	 */
	@GetMapping("/sales/receive-order")
	public String placeOrder() {
		
		//log.info("[placeOrder] -> {}", companyCode);
		
		
		return "sales/receive-order";
	}
	
	/*
	 * 수주 content List
	 * 
	 */
	@GetMapping("/sales/receive-order/place-order-list")
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
	@PatchMapping("/sales/receive-order/{orderCode}/confirm")
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
	@PatchMapping("/sales/receive-order/{orderCode}/cancel")
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
	@PatchMapping("/sales/receive-order/{orderCode}/modify-type")
	@ResponseBody
	public String modifyOrderTypeByOrderCode(@PathVariable String orderCode,
										    String receiveOrderType){
		log.info("[modifyOrderTypeByOrderCode] orderCode -> {}", orderCode);
		log.info("[modifyOrderTypeByOrderCode] receiveOrderType -> {}", receiveOrderType);
		
		OrdersDto ordersDto = new OrdersDto();
		ordersDto.setReceiveOrderType(receiveOrderType);
		
		int orderType = omService.modifyOrderTypeByorderCode(orderCode, ordersDto);
		String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyOrderTypeByOrderCode] orderStatus -> {}", orderCode);
		log.info("[modifyOrderTypeByOrderCode] ordersDto.getReceiveOrderType() -> {}", ordersDto.getReceiveOrderType());
		
		return orderTypeStr;
	}
	
	/*
	 * 수주일 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderCode}/change-order-date")
	@ResponseBody
	public int modifyOrderDateByOrderCode(@PathVariable String orderCode, String orderDate){
										    
		log.info("[modifyOrderDateByOrderCode] orderCode -> {}", orderCode);
		log.info("[modifyOrderDateByOrderCode] orderDate -> {}", orderDate);
		
		OrdersDto ordersDto = new OrdersDto();
		ordersDto.setOrderDate(orderDate);
		ordersDto.setOrderCode(orderCode);
		log.info("[modifyOrderDateByOrderCode] orderDate.toString -> {}", ordersDto.toString());
		int modifiedOrderDate = omService.modifyOrderDateByorderCode(ordersDto);
		//String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyOrderTypeByOrderCode] modifiedOrderDate -> {}", modifiedOrderDate);
		log.info("[modifyOrderTypeByOrderCode] ordersDto.getOrderDate() -> {}", ordersDto.getOrderDate());
		
		return modifiedOrderDate;
	}
	
	/*
	 * 납기일 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderCode}/change-due-date")
	@ResponseBody
	public int modifyOrderDueByOrderCode(@PathVariable String orderCode, String dueDate){
										    
		log.info("[modifyOrderDueByOrderCode] orderCode -> {}", orderCode);
		log.info("[modifyOrderDueByOrderCode] orderDate -> {}", dueDate);
		
		OrdersDto ordersDto = new OrdersDto();
		ordersDto.setDueDate(dueDate);
		ordersDto.setOrderCode(orderCode);
		log.info("[modifyOrderDueByOrderCode] ordersDto.toString -> {}", ordersDto.toString());
		int modifiedDueDate = omService.modifyDueDateByorderCode(ordersDto);
		//String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyOrderDueByOrderCode] modifiedDueDate -> {}", modifiedDueDate);
		log.info("[modifyOrderDueByOrderCode] ordersDto.getDueDate() -> {}", ordersDto.getDueDate());
		
		return modifiedDueDate;
	}
	
	
	
	/*
	 * receive-opder-insert
	 */
	@PostMapping(value = "/sales/om/insert-receive-order")
	public String receiveOrderAdd(OrdersDto ordersDto, Model model) {
		log.info("[receiveOrderAdd] ordersDto.toString -> {}", ordersDto.toString());
		
		omService.addReceiveOrder(ordersDto);
		
		return "redirect:/sales/receive-order";
	}
	
	
	/*
	 * delete
	 */
	@DeleteMapping("/sales/receive-order/{orderCode}/delete")
	public ResponseEntity<String> receiveOrderRemoveByOrderCode(@PathVariable String orderCode) {
		log.info("[receiveOrderRemoveByOrderCode] orderCode -> {}", orderCode);
		int receiveOrderDelete;
		receiveOrderDelete = omService.removeReceiveOrderByOrderCode(orderCode);

		if (receiveOrderDelete > 0) {
			return ResponseEntity.ok("삭제되었습니다");
		} else {
			return ResponseEntity.badRequest().body("삭제 실패");
		}
	}
	
	
	
	
	//
	/*
	 * 수주 detail-content List
	 * 
	 */
	//@GetMapping("/place-order-detail-list/{orderCode}")
	@GetMapping("/sales/receive-order/place-order-detail-list")
	@ResponseBody
	//public List<OrdersDto> placeOrderDetailList(@PathVariable String orderCode) {
	public List<OrdersDetailDto> placeOrderDetailList(@RequestParam("orderCode") String orderCode) {
		
		log.info("[placeOrderDetailList] orderCode -> {}", orderCode);
		
		List<OrdersDetailDto> placeOrderDetailList = omService.findPlaceOrderDetailListByCompanyCode(orderCode);
		//model.addAttribute("placeOrderList", placeOrderList);
		
		return placeOrderDetailList;
	}
	
	/*
	 * receive-opder-detail-insert
	 */
	@PostMapping(value = "/sales/om/insert-receive-order-detail")
	public String receiveOrderDetailAdd(OrdersDetailDto ordersDetailDto, Model model) {
		log.info("[receiveOrderDetailAdd] ordersDto.toString -> {}", ordersDetailDto.toString());
		
		omService.addReceiveOrderDetail(ordersDetailDto);
		
		return "redirect:/sales/receive-order";
	}
	

	/*
	 * 금액 변경 
	 */
	@ResponseBody
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-amount")
	public int modifyAmountByOrderDetailCode(@PathVariable String orderDetailCode, 
											 @RequestBody  OrdersDetailDto ordersDetailDto){
										    
		log.info("[modifyAmountByOrderDetailCode] orderDetailCode -> {}", orderDetailCode);
		ordersDetailDto.setOrderDetailCode(orderDetailCode);
		log.info("[modifyAmountByOrderDetailCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());
		
		int modifiedAmount = omService.modifyAmountByordersDetailDto(ordersDetailDto);
		//String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyAmountByOrderDetailCode] modifiedDueDate -> {}", modifiedAmount);
		
		return modifiedAmount;
	}
	
	
	/*
	 * 재고단위 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-item-stock-unit")
	@ResponseBody
	public int modifyItemStockUnitByOrderDetailCode(@PathVariable String orderDetailCode, String itemStockUnit) {
		log.info("[modifyItemStockUnitByOrderDetailCode] orderDetailCode -> {}", orderDetailCode);
		log.info("[modifyItemStockUnitByOrderDetailCode] itemStockUnit -> {}", itemStockUnit);
		
		OrdersDetailDto ordersDetailDto = new OrdersDetailDto();
		ordersDetailDto.setOrderDetailCode(orderDetailCode);
		ordersDetailDto.setItemStockUnit(itemStockUnit);
		
		int modifiedUnit = omService.modifyItemStockUnitByorderDetailCode(ordersDetailDto);
		
		log.info("[modifyItemStockUnitByOrderDetailCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());
		
		return modifiedUnit;
	}
	
	/*
	 * 마감여부 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-end-yn")
	@ResponseBody
	public int modifyEndYnByOrderDetailCode(@PathVariable String orderDetailCode, String endYn) {
		log.info("[modifyItemStockUnitByOrderDetailCode] orderDetailCode -> {}", orderDetailCode);
		log.info("[modifyItemStockUnitByOrderDetailCode] endYn -> {}", endYn);
		
		OrdersDetailDto ordersDetailDto = new OrdersDetailDto();
		ordersDetailDto.setOrderDetailCode(orderDetailCode);
		ordersDetailDto.setEndYn(endYn);
		
		int modifiedEndYn = omService.modifyEndYnByOrderDetailCode(ordersDetailDto);
		
		log.info("[modifyItemStockUnitByOrderDetailCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());
		
		return modifiedEndYn;
	}
	
	
	/*
	 * 출하등록
	 */
	@ResponseBody
	@PostMapping("/sales/receive-order/{orderCode}/stock-out-reg")
	public String stockOutRegToStOutAddByOrderCode(@PathVariable String orderCode) {
		log.info("[stockOutRegToStOutAddByOrderCode] orderCode -> {}", orderCode);
		int stockOutReg = 0;
		String returnStr = null;
		
		stockOutReg = omService.addOrdersToStOutByOrderCode(orderCode);
		
		if(stockOutReg > 0) {
			returnStr = "Stock out registration successful";
		}
		return returnStr;
	}
	
	/*
	 * 작업지시등록
	 */
	@ResponseBody
	@PostMapping("/sales/receive-order/{orderCode}/work-order-reg")
	public String workOutRegToStWOAddByOrderCode(@PathVariable String orderCode) {
		log.info("[workOutRegToStWOAddByOrderCode] orderCode -> {}", orderCode);
		int WOReg = 0;
		String returnStr = null;
		WOReg = omService.addOrdersToWOByOrderCode(orderCode);
		
		if(WOReg > 0) {
			returnStr = "work out registration successful";
		}
		log.info("[workOutRegToStWOAddByOrderCode] WOReg -> {}", WOReg);
		return returnStr;
	}
}
