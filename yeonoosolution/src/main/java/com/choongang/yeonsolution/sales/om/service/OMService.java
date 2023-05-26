package com.choongang.yeonsolution.sales.om.service;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;

public interface OMService {

	List<OrdersDto> findPlaceOrderListByCompanyCode();

	int modifyStatusToConfirmByorderCode(String orderCode);

	int modifyStatusToCancelByorderCode(String orderCode);

	List<OrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode);

	int modifyOrderTypeByorderCode(String orderCode, OrdersDto ordersDto);

	void addReceiveOrder(OrdersDto ordersDto);

}
