package com.choongang.yeonsolution.sales.om.dao;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OrdersAOMDto;

public interface AOMDao {

	List<OrdersAOMDto> selectReceiveOrderListByCompanyCode();

	List<OrdersAOMDto> selectSemiManufacturesListByCompanyCode(String orderCode);

}
