package com.choongang.yeonsolution.sales.pm.dao;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.sales.pm.domain.CompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.ItemDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.domain.StInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.StockInDto;
import com.choongang.yeonsolution.sales.pm.domain.WhDto;

public interface PmDao {

	List<OrdersDto> selectOrdersBySearch(Search search);
	List<OrdersDetailDto> selectOrdersDetailByOrderCode(String orderCode);
	int updateOrdersByOrderCode(Map<String, String> map);
	List<CompanyDto> selectCompanyBySearch(String search);
	List<ItemDto> selectItemyBySearch(String search);
	String insertOrder(OrdersDto order);
	int insertOrdersDetail(OrdersDetailDto orderDetail);
	int updateOrder(OrdersDto order);
	int deleteOrderDetailByOrderCode(String orderCode);
	
	List<StockInDto> selectStockInListBySearch(Search search);
	List<StInDetailDto> selectStockInDetailByInCode(String inCode);
	int updateStockInByInCode(Map<String, Object> map);
	List<WhDto> selectWh();
	void updateWhStockDetailBystInDetail(Map<String, Object> map);
	void updateWhStockDetailBystInDetail(StInDetailDto stInDetail);
	String insertStIn(StockInDto stIn);
	int insertStInDetail(StInDetailDto stInDetail);
	int updateStIn(StockInDto stIn);
	int deleteStInDetailByInCode(String inCode);

}
