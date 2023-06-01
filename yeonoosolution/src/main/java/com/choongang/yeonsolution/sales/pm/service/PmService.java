package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.CompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.ItemDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.domain.StInDataDto;
import com.choongang.yeonsolution.sales.pm.domain.StInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.StockInDto;
import com.choongang.yeonsolution.sales.pm.domain.WhDto;

public interface PmService {

	List<OrdersDto> findOrdersBySearch(Search search);
	List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode);
	String modifyOrdersByOrderCode(String orderCode, String column, String data);
	List<CompanyDto> findCompanyBySearch(String search);
	List<ItemDto> findItemBySearch(String search);
	String addOrder(OrdersDataDto orderData);
	String modifyOrder(OrdersDataDto orderData);
	
	List<StockInDto> findStockInListBySearch(Search search);
	List<StInDetailDto> findStockInDetailByInCode(String inCode);
	String modifyStockInByInCode(String inCode, String column, String data);
	List<WhDto> findWhList();
	String addStIn(StInDataDto stInData);
	String modifyStIn(StInDataDto stInData);

}
