package com.choongang.yeonsolution.sales.pm.dao;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;

public interface PmDao {

	List<OrdersDto> selectOrders();
	List<OrdersDetailDto> selectOrdersDetailByOrderCode(String orderCode);

}
