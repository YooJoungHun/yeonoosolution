package com.choongang.yeonsolution.sales.om.service;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersItemDto;

public interface OMService {

	List<OrdersDto> findPlaceOrderListByCompanyCode();

	int modifyStatusToConfirmByorderCode(String orderCode);

	int modifyStatusToCancelByorderCode(String orderCode);

	List<OrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode);

	int modifyOrderTypeByorderCode(String orderCode, OrdersDto ordersDto);

	void addReceiveOrder(OrdersDto ordersDto);

	int removeReceiveOrderByOrderCode(String orderCode);

	void addReceiveOrderDetail(OrdersDetailDto ordersDetailDto);

	int modifyOrderDateByorderCode(OrdersDto ordersDto);

	int modifyDueDateByorderCode(OrdersDto ordersDto);

	int modifyAmountByordersDetailDto(OrdersDetailDto ordersDetailDto);

	int modifyItemStockUnitByorderDetailCode(OrdersDetailDto ordersDetailDto);

	int modifyEndYnByOrderDetailCode(OrdersDetailDto ordersDetailDto);

	int addOrdersToStOutByOrderCode(String orderCode);

	int addOrdersToWOByOrderCode(String orderCode);

	String findOrderStatusByOrderCode(String orderCode);

	List<OrdersCompanyDto> findCustomerList();

	List<OrdersItemDto> finditemList();

	int modifyItemByordersDetailDto(OrdersItemDto ordersItemDto);

	int modifyEmpidByOrderCode(OrdersDto ordersDto);

	int modifyMemoByOrdersDetailDto(OrdersDetailDto ordersDetailDto);

}
