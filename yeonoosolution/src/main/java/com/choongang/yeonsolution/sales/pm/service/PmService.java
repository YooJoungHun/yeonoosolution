package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import com.choongang.yeonsolution.sales.pm.domain.PmCompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.PmItemDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.PmSearch;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStockInDto;
import com.choongang.yeonsolution.sales.pm.domain.PmWhDto;

public interface PmService {

	List<PmOrdersDto> findOrdersBySearch(PmSearch search);
	List<PmOrdersDetailDto> findOrdersDetailByOrderCode(String orderCode);
	String modifyOrdersByOrderCode(String orderCode, String column, String data);
	List<PmCompanyDto> findCompanyBySearch(String search);
	List<PmItemDto> findItemBySearch(String search);
	String addOrder(PmOrdersDataDto orderData);
	String modifyOrder(PmOrdersDataDto orderData);
	
	List<PmStockInDto> findStockInListBySearch(PmSearch search);
	List<PmStInDetailDto> findStockInDetailByInCode(String inCode);
	String modifyStockInByInCode(String inCode, String column, String data);
	List<PmWhDto> findWhList();
	String addStIn(PmStInDataDto stInData);
	String modifyStIn(PmStInDataDto stInData);

}
