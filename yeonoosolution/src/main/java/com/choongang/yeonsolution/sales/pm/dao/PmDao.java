package com.choongang.yeonsolution.sales.pm.dao;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.sales.pm.domain.PmCompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.PmItemDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.PmSearch;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStockInDto;
import com.choongang.yeonsolution.sales.pm.domain.PmWhDto;

public interface PmDao {

	List<PmOrdersDto> selectOrdersBySearch(PmSearch search);
	List<PmOrdersDetailDto> selectOrdersDetailByOrderCode(String orderCode);
	int updateOrdersByOrderCode(Map<String, String> map);
	List<PmCompanyDto> selectCompanyBySearch(String search);
	List<PmItemDto> selectItemyBySearch(String search);
	String insertOrder(PmOrdersDto order);
	int insertOrdersDetail(PmOrdersDetailDto orderDetail);
	int updateOrder(PmOrdersDto order);
	int deleteOrderDetailByOrderCode(String orderCode);
	
	List<PmStockInDto> selectStockInListBySearch(PmSearch search);
	List<PmStInDetailDto> selectStockInDetailByInCode(String inCode);
	int updateStockInByInCode(Map<String, Object> map);
	List<PmWhDto> selectWh();
	void updateWhStockDetailBystInDetail(Map<String, Object> map);
	void updateWhStockDetailBystInDetail(PmStInDetailDto stInDetail);
	String insertStIn(PmStockInDto stIn);
	int insertStInDetail(PmStInDetailDto stInDetail);
	int updateStIn(PmStockInDto stIn);
	int deleteStInDetailByInCode(String inCode);

}
