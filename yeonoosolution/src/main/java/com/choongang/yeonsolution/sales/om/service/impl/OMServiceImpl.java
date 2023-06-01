package com.choongang.yeonsolution.sales.om.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.om.dao.OMDao;
import com.choongang.yeonsolution.sales.om.domain.OrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersItemDto;
import com.choongang.yeonsolution.sales.om.service.OMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OMServiceImpl implements OMService {

	private final OMDao omDao;
	
	public OMServiceImpl(OMDao omDao) {
		this.omDao = omDao;
	}
	
	
	@Override
	public List<OrdersDto> findPlaceOrderListByCompanyCode() {
		
		List<OrdersDto> placeOrderList = null;
		
		placeOrderList = omDao.selectPlaceOrderListByCompanyCode();
		log.info("[findPlaceOrderListByCompanyCode] placeOrderList.size() -> {}", placeOrderList.size());
		
		return placeOrderList;
	}


	@Override
	public int modifyStatusToConfirmByorderCode(String orderCode) {
		
		int orderStatus = omDao.updateStatusToConfirmByorderCode(orderCode);
		
		return orderStatus;
	}


	@Override
	public int modifyStatusToCancelByorderCode(String orderCode) {
		
		int orderStatus = omDao.updateStatusToCancelByorderCode(orderCode);

		return orderStatus;
	}

	@Override
	public int modifyOrderTypeByorderCode(String orderCode, OrdersDto ordersDto) {
		
		int orderType = omDao.updateOrderTypeByorderCode(orderCode, ordersDto);
		
		return orderType;
	}
	
	@Override
	public int modifyOrderDateByorderCode(OrdersDto ordersDto) {

		int updatedOrderDate = omDao.updateOrderDateByorderCode(ordersDto);
		
		return updatedOrderDate;
	}
	

	@Override
	public int modifyDueDateByorderCode(OrdersDto ordersDto) {
		int updatedDueDate = omDao.updateDueDateByorderCode(ordersDto);
		
		return updatedDueDate;
	}
	
	@Override
	public int modifyEmpidByOrderCode(OrdersDto ordersDto) {
		int updatedEmpid = omDao.updateEmpidByOrderCode(ordersDto);
		
		return updatedEmpid;
	}
	
	@Override
	public void addReceiveOrder(OrdersDto ordersDto) {
		
		omDao.insertReceiveOrder(ordersDto);
	}
	
	@Override
	public int removeReceiveOrderByOrderCode(String orderCode) {
		int receiveOrderDelete = 0;
		int receiveOrderDetailDelete = 0;
		
		receiveOrderDelete = omDao.deleteReceiveOrderDetailByOrderCode(orderCode);
		
		receiveOrderDelete = omDao.deleteReceiveOrderByOrderCode(orderCode);
		
		receiveOrderDelete += receiveOrderDetailDelete;
		
		return receiveOrderDelete;
	}

	
	
	
	//
	@Override
	public List<OrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode) {
		
		List<OrdersDetailDto> placeOrderDetailList = null;
		
		placeOrderDetailList = omDao.selectPlaceOrderDetailListByCompanyCode(orderCode);
		log.info("[findPlaceOrderDetailListByCompanyCode] placeOrderList.size() -> {}", placeOrderDetailList.size());
		
		return placeOrderDetailList;
	}


	@Override
	public void addReceiveOrderDetail(OrdersDetailDto ordersDetailDto) {

		omDao.insertReceiveOrderDetail(ordersDetailDto);
		
	}


	@Override
	public int modifyAmountByordersDetailDto(OrdersDetailDto ordersDetailDto) {
		int updatedAmount = omDao.updateAmountByordersDetailDto(ordersDetailDto);
		
		return updatedAmount;
	}


	@Override
	public int modifyItemStockUnitByorderDetailCode(OrdersDetailDto ordersDetailDto) {
		int modifiedUnit = omDao.updateItemStockUnitByorderCode(ordersDetailDto);
		
		return modifiedUnit;
	}
	
	@Override
	public int modifyMemoByOrdersDetailDto(OrdersDetailDto ordersDetailDto) {
		int modifiedMemo = omDao.updateMemoByOrdersDetailDto(ordersDetailDto);
		
		return modifiedMemo;
	}


	@Override
	public int modifyEndYnByOrderDetailCode(OrdersDetailDto ordersDetailDto) {
		int modifiedEndYn = omDao.updateEndYnByOrderDetailCode(ordersDetailDto);
		
		return modifiedEndYn;
	}

	@Override
	public String findOrderStatusByOrderCode(String orderCode) {
		String OrderStatus = null;
				
		OrderStatus = omDao.selectOrderStatusByOrderCode(orderCode);
		
		return OrderStatus;
	}

	@Override
	public int addOrdersToStOutByOrderCode(String orderCode) {
		
		int stockOutReg = 0;
//		int stockOutDetailReg = 0;
		stockOutReg = omDao.insertOdersToStOutByOrderCod(orderCode);
		log.info("[addOrdersToStOutByOrderCode] stockOutReg -> {}", stockOutReg);
		
		if(stockOutReg > 0) {
			omDao.insertOdersDetailToStOutDetailByOrderCod(orderCode);
			log.info("[addOrdersToStOutByOrderCode] stockOutDetailReg -> {}", stockOutReg);
		}
		return stockOutReg;
	}


	@Override
	public int addOrdersToWOByOrderCode(String orderCode) {
		int WOReg = 0;
		WOReg = omDao.insertOdersToWOByOrderCode(orderCode);
		
		return WOReg;
	}


	@Override
	public List<OrdersCompanyDto> findCustomerList() {
		List<OrdersCompanyDto> customerList = null;
		
		customerList = omDao.selectCustomerList();
		log.info("[findCustomerList] customerList.size() -> {}", customerList.size());
		
		return customerList;
	}


	@Override
	public List<OrdersItemDto> finditemList() {
		List<OrdersItemDto> itemList = null;
		
		itemList = omDao.selectItemList();
		log.info("[findCustomerList] itemList.size() -> {}", itemList.size());
		
		return itemList;
	}


	@Override
	public int modifyItemByordersDetailDto(OrdersItemDto ordersItemDto) {
		int updatedItem = omDao.updateItemByordersDetailDto(ordersItemDto);
		
		return updatedItem;
	}


	


	

}
