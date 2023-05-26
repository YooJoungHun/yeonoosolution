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
	public void addReceiveOrder(OrdersDto ordersDto) {
		// TODO Auto-generated method stub
		
		omdao.insertReceiveOrder(ordersDto);
	}
	
	
	
	
	
	//
	@Override
	public List<OrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode) {
		
		List<OrdersDetailDto> placeOrderDetailList = null;
		
		placeOrderDetailList = omdao.selectPlaceOrderDetailListByCompanyCode(orderCode);
		log.info("[findPlaceOrderDetailListByCompanyCode] placeOrderList.size() -> {}", placeOrderDetailList.size());
		
		return placeOrderDetailList;
	}


	


	
	

}
