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

import com.choongang.yeonsolution.sales.om.domain.OMOrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersItemDto;
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
	 */
	@GetMapping("/sales/receive-order/place-order-list")
	@ResponseBody
	public List<OMOrdersDto> placeOrderList() {
		
		//log.info("[placeOrder] -> {}", companyCode);
		
		List<OMOrdersDto> placeOrderList = omService.findPlaceOrderListByCompanyCode();
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
		
		OMOrdersDto ordersDto = new OMOrdersDto();
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
		
		OMOrdersDto ordersDto = new OMOrdersDto();
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
		
		OMOrdersDto ordersDto = new OMOrdersDto();
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
	 * 수주담당자 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderCode}/modify-empid")
	@ResponseBody
	public int modifyEmpidByOrderCode(@PathVariable String orderCode, 
									  @RequestBody OMOrdersDto ordersDto){
										    
		ordersDto.setOrderCode(orderCode);
		
		log.info("[modifyEmpidByOrderCode] orderCode -> {}", ordersDto.getOrderCode());
		log.info("[modifyEmpidByOrderCode] ordersDto.getOrderEmpid() -> {}", ordersDto.getOrderEmpid());
		
		log.info("[modifyEmpidByOrderCode] ordersDto.toString -> {}", ordersDto.toString());
		int modifiedEmpid = omService.modifyEmpidByOrderCode(ordersDto);
		//String orderTypeStr =  Integer.toString(orderType);
		
		log.info("[modifyEmpidByOrderCode] modifiedEmpid -> {}", modifiedEmpid);
		log.info("[modifyEmpidByOrderCode] ordersDto.getOrderEmpid() -> {}", ordersDto.getOrderEmpid());
		
		return modifiedEmpid;
	}
	
	
	
	/*
	 * receive-opder-insert
	 */
	@PostMapping(value = "/sales/om/insert-receive-order")
	public String receiveOrderAdd(OMOrdersDto ordersDto, Model model) {
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
	
	/*
	 * modal customer List
	 */
	@GetMapping("/sales/receive-order/customer-code-list")
	@ResponseBody
	public List<OMOrdersCompanyDto> customerList() {
		
		List<OMOrdersCompanyDto> customerList = omService.findCustomerList();
		log.info("[customerList] customerList.toString() -> {}", customerList.toString());
		
		return customerList;
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
	public List<OMOrdersDetailDto> placeOrderDetailList(@RequestParam("orderCode") String orderCode) {
		
		log.info("[placeOrderDetailList] orderCode -> {}", orderCode);
		
		List<OMOrdersDetailDto> placeOrderDetailList = omService.findPlaceOrderDetailListByCompanyCode(orderCode);
		//model.addAttribute("placeOrderList", placeOrderList);
		
		return placeOrderDetailList;
	}
	
	/*
	 * receive-opder-detail-insert
	 */
	@PostMapping(value = "/sales/om/insert-receive-order-detail")
	public String receiveOrderDetailAdd(OMOrdersDetailDto ordersDetailDto, Model model) {
		log.info("[receiveOrderDetailAdd] ordersDto.toString -> {}", ordersDetailDto.toString());
		
		omService.addReceiveOrderDetail(ordersDetailDto);
		
		return "redirect:/sales/receive-order";
	}
	
	/*
	 * 제품 변경 
	 */
	@ResponseBody
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-item")
	public int modifyItemByOrderDetailCode(@PathVariable String orderDetailCode, 
										   @RequestBody  OMOrdersItemDto ordersItemDto){
										    
		log.info("[modifyItemByOrderDetailCode] orderDetailCode -> {}", orderDetailCode);
		ordersItemDto.setOrderDetailCode(orderDetailCode);
		log.info("[modifyItemByOrderDetailCode] ordersItemDto.toString() -> {}", ordersItemDto.toString());
		
		int modifiedItem = omService.modifyItemByordersDetailDto(ordersItemDto);
		
		log.info("[modifyItemByOrderDetailCode] modifiedItmm -> {}", modifiedItem);
		
		return modifiedItem;
	}

	/*
	 * 금액 변경 
	 */
	@ResponseBody
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-amount")
	public int modifyAmountByOrderDetailCode(@PathVariable String orderDetailCode, 
											 @RequestBody  OMOrdersDetailDto ordersDetailDto){
										    
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
		
		OMOrdersDetailDto ordersDetailDto = new OMOrdersDetailDto();
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
		
		OMOrdersDetailDto ordersDetailDto = new OMOrdersDetailDto();
		ordersDetailDto.setOrderDetailCode(orderDetailCode);
		ordersDetailDto.setEndYn(endYn);
		
		int modifiedEndYn = omService.modifyEndYnByOrderDetailCode(ordersDetailDto);
		
		log.info("[modifyItemStockUnitByOrderDetailCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());
		
		return modifiedEndYn;
	}
	
	
	/*
	 * 저장 확인 검증
	 */
	@ResponseBody
	@GetMapping("/sales/receive-order/{orderCode}/order-status")
	public String getOrderStatusByOrderCode(@PathVariable String orderCode) {
		log.info("[getOrderStatusByOrderCode] orderCode -> {}", orderCode);
		
		String orderStatus = omService.findOrderStatusByOrderCode(orderCode);
		
		log.info("[getOrderStatusByOrderCode] OrderStatus -> {}", orderStatus);
		
		return orderStatus;
	}
	
	/*
	 * 비고 변경 
	 */
	@PatchMapping("/sales/receive-order/{orderDetailCode}/modify-memo")
	@ResponseBody
	public int modifyMemoByOrdersDetailDto(@PathVariable String orderDetailCode, 
									       @RequestBody OMOrdersDetailDto ordersDetailDto){
										    
		ordersDetailDto.setOrderDetailCode(orderDetailCode);
		
		log.info("[modifyMemoByOrderCode] ordersDetailDto.getOrderDetailCode() -> {}", ordersDetailDto.getOrderDetailCode());
		log.info("[modifyMemoByOrderCode] ordersDetailDto.getOrderEmpid() -> {}", ordersDetailDto.getMemo());
		
		log.info("[modifyMemoByOrderCode] ordersDetailDto.toString -> {}", ordersDetailDto.toString());
		int modifiedMemo = omService.modifyMemoByOrdersDetailDto(ordersDetailDto);
		
		log.info("[modifyMemoByOrderCode] modifiedMemo -> {}", modifiedMemo);
		log.info("[modifyMemoByOrderCode] ordersDetailDto.getMemo() -> {}", ordersDetailDto.getMemo());
		
		return modifiedMemo;
	}
	
	
	/*
	 * item List
	 */
	@GetMapping("/sales/receive-order/item-code-list")
	@ResponseBody
	public List<OMOrdersItemDto> itemList() {
		
		List<OMOrdersItemDto> itemList = omService.finditemList();
		log.info("[itemList] itemList.size() -> {}", itemList.size());
		
		return itemList;
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
