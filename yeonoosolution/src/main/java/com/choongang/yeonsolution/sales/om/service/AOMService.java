package com.choongang.yeonsolution.sales.om.service;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OrdersAOMDto;

public interface AOMService {

	List<OrdersAOMDto> findRecieveOrderListByCompanyCode();

	List<OrdersAOMDto> findSemiManufacturesListByCompanyCode(String orderCode);

}
