package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;

public interface PmService {

	List<OrdersDto> findOrders();
	List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode);

}
