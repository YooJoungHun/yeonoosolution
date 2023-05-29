package com.choongang.yeonsolution.sales.om.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.om.dao.OMDao;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.service.OMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OMServiceImpl implements OMService {

	private final OMDao omdao;
	
	public OMServiceImpl(OMDao omdao) {
		this.omdao = omdao;
	}
	
	
	@Override
	public List<OrdersDto> findPlaceOrderListByCompanyCode() {
		
		List<OrdersDto> placeOrderList = null;
		
		placeOrderList = omdao.selectPlaceOrderListByCompanyCode();
		log.info("[findPlaceOrderListByCompanyCode] placeOrderList.size() -> {}", placeOrderList.size());
		
		return placeOrderList;
	}


	@Override
	public int modifyStatusToConfirmByorderCode(String orderCode) {
		
		int orderStatus = omdao.updateStatusToConfirmByorderCode(orderCode);
		
		return orderStatus;
	}


	@Override
	public int modifyStatusToCancelByorderCode(String orderCode) {
		
		int orderStatus = omdao.updateStatusToCancelByorderCode(orderCode);

		return orderStatus;
	}

	@Override
	public int modifyOrderTypeByorderCode(String orderCode, OrdersDto ordersDto) {
		
		int orderType = omdao.updateOrderTypeByorderCode(orderCode, ordersDto);
		
		return orderType;
	}
	
	@Override
	public int modifyOrderDateByorderCode(OrdersDto ordersDto) {

		int updatedOrderDate = omdao.updateOrderDateByorderCode(ordersDto);
		
		return updatedOrderDate;
	}
	

	@Override
	public int modifyDueDateByorderCode(OrdersDto ordersDto) {
		int updatedDueDate = omdao.updateDueDateByorderCode(ordersDto);
		
		return updatedDueDate;
	}
	
	@Override
	public void addReceiveOrder(OrdersDto ordersDto) {
		
		omdao.insertReceiveOrder(ordersDto);
	}
	
	@Override
	public int removeReceiveOrderByOrderCode(String orderCode) {
		int receiveOrderDelete = 0;
		int receiveOrderDetailDelete = 0;
		
		receiveOrderDelete = omdao.deleteReceiveOrderDetailByOrderCode(orderCode);
		
		receiveOrderDelete = omdao.deleteReceiveOrderByOrderCode(orderCode);
		
		receiveOrderDelete += receiveOrderDetailDelete;
		
		return receiveOrderDelete;
	}

	
	
	
	//
	@Override
	public List<OrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode) {
		
		List<OrdersDetailDto> placeOrderDetailList = null;
		
		placeOrderDetailList = omdao.selectPlaceOrderDetailListByCompanyCode(orderCode);
		log.info("[findPlaceOrderDetailListByCompanyCode] placeOrderList.size() -> {}", placeOrderDetailList.size());
		
		return placeOrderDetailList;
	}


	@Override
	public void addReceiveOrderDetail(OrdersDetailDto ordersDetailDto) {

		omdao.insertReceiveOrderDetail(ordersDetailDto);
		
	}


	@Override
	public int modifyAmountByordersDetailDto(OrdersDetailDto ordersDetailDto) {
		int updatedAmount = omdao.updateAmountByordersDetailDto(ordersDetailDto);
		
		return updatedAmount;
	}


	@Override
	public int modifyItemStockUnitByorderDetailCode(OrdersDetailDto ordersDetailDto) {
		int modifiedUnit = omdao.updateItemStockUnitByorderCode(ordersDetailDto);
		
		return modifiedUnit;
	}


	@Override
	public int modifyEndYnByOrderDetailCode(OrdersDetailDto ordersDetailDto) {
		int modifiedEndYn = omdao.updateEndYnByOrderDetailCode(ordersDetailDto);
		
		return modifiedEndYn;
	}


	@Override
	public int addOrdersToStOutByOrderCode(String orderCode) {
		
		int stockOutReg = 0;
		int stockOutDetailReg = 0;
		stockOutReg = omdao.insertOdersToStOutByOrderCod(orderCode);
		log.info("[addOrdersToStOutByOrderCode] stockOutReg -> {}", stockOutReg);
		
		if(stockOutReg > 0) {
			stockOutDetailReg = omdao.insertOdersDetailToStOutDetailByOrderCod(orderCode);
		}
		return stockOutReg;
	}


	@Override
	public int addOrdersToWOByOrderCode(String orderCode) {
		int WOReg = 0;
		WOReg = omdao.insertOdersToWOByOrderCode(orderCode);
		
		return WOReg;
	}




	



}
