package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;

public interface PmService {

	List<OrdersDto> findOrdersBySearch(Search search);
	List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode);
	String modifyOrdersByOrderCode(String orderCode, String column, String data);

}
