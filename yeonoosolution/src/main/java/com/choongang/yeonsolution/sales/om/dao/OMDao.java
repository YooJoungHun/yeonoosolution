package com.choongang.yeonsolution.sales.om.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;

@Repository
public interface OMDao {

	List<OrdersDto> selectPlaceOrderListByCompanyCode();

	int updateStatusToConfirmByorderCode(String orderCode);

	int updateStatusToCancelByorderCode(String orderCode);

	List<OrdersDetailDto> selectPlaceOrderDetailListByCompanyCode(String orderCode);

	int updateOrderTypeByorderCode(String orderCode, OrdersDto ordersDto);

	void insertReceiveOrder(OrdersDto ordersDto);

}
