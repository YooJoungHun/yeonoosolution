package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.OrderSearch;

public interface PmService {

	List<OrdersDto> findOrders(OrderSearch search);
	List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode);

}
