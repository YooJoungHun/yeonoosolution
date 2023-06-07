package com.choongang.yeonsolution.sales.om.service;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OMOrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersItemDto;

public interface OMService {

	List<OMOrdersDto> findPlaceOrderListByCompanyCode();

	int modifyStatusToConfirmByorderCode(String orderCode);

	int modifyStatusToCancelByorderCode(String orderCode);

	List<OMOrdersDetailDto> findPlaceOrderDetailListByCompanyCode(String orderCode);

	int modifyOrderTypeByorderCode(String orderCode, OMOrdersDto ordersDto);

	void addReceiveOrder(OMOrdersDto ordersDto);

	int removeReceiveOrderByOrderCode(String orderCode);

	void addReceiveOrderDetail(OMOrdersDetailDto ordersDetailDto);

	int modifyOrderDateByorderCode(OMOrdersDto ordersDto);

	int modifyDueDateByorderCode(OMOrdersDto ordersDto);

	int modifyAmountByordersDetailDto(OMOrdersDetailDto ordersDetailDto);

	int modifyItemStockUnitByorderDetailCode(OMOrdersDetailDto ordersDetailDto);

	int modifyEndYnByOrderDetailCode(OMOrdersDetailDto ordersDetailDto);

	int addOrdersToStOutByOrderCode(String orderCode);

	int addOrdersToWOByOrderCode(String orderCode);

	String findOrderStatusByOrderCode(String orderCode);

	List<OMOrdersCompanyDto> findCustomerList();

	List<OMOrdersItemDto> finditemList();

	int modifyItemByordersDetailDto(OMOrdersItemDto ordersItemDto);

	int modifyEmpidByOrderCode(OMOrdersDto ordersDto);

	int modifyMemoByOrdersDetailDto(OMOrdersDetailDto ordersDetailDto);

}
