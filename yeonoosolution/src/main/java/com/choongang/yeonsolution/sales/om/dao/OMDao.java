package com.choongang.yeonsolution.sales.om.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.domain.OrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersItemDto;

@Repository
public interface OMDao {

	List<OrdersDto> selectPlaceOrderListByCompanyCode();

	int updateStatusToConfirmByorderCode(String orderCode);

	int updateStatusToCancelByorderCode(String orderCode);

	List<OrdersDetailDto> selectPlaceOrderDetailListByCompanyCode(String orderCode);

	int updateOrderTypeByorderCode(String orderCode, OrdersDto ordersDto);

	void insertReceiveOrder(OrdersDto ordersDto);

	int deleteReceiveOrderByOrderCode(String orderCode);

	int deleteReceiveOrderDetailByOrderCode(String orderCode);
	
	void insertReceiveOrderDetail(OrdersDetailDto ordersDetailDto);

	int updateOrderDateByorderCode(OrdersDto ordersDto);

	int updateDueDateByorderCode(OrdersDto ordersDto);

	int updateAmountByordersDetailDto(OrdersDetailDto ordersDetailDto);

	int updateItemStockUnitByorderCode(OrdersDetailDto ordersDetailDto);

	int updateEndYnByOrderDetailCode(OrdersDetailDto ordersDetailDto);

	int insertOdersToStOutByOrderCod(String orderCode);

	int insertOdersDetailToStOutDetailByOrderCod(String orderCode);

	int insertOdersToWOByOrderCode(String orderCode);

	String selectOrderStatusByOrderCode(String orderCode);

	List<OrdersCompanyDto> selectCustomerList();

	List<OrdersItemDto> selectItemList();

	int updateItemByordersDetailDto(OrdersItemDto ordersItemDto);

	int updateEmpidByOrderCode(OrdersDto ordersDto);

	int updateMemoByOrdersDetailDto(OrdersDetailDto ordersDetailDto);


}
