package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	String modifyOrdersByOrderCode(PmOrdersDto pmOrdersDto, HttpSession session);
	List<PmCompanyDto> findCompanyBySearch(String search);
	List<PmItemDto> findItemBySearch(String search);
	String addOrder(PmOrdersDataDto orderData, HttpSession session);
	String modifyOrder(PmOrdersDataDto orderData, HttpSession session);
	
	List<PmStockInDto> findStockInListBySearch(PmSearch search);
	List<PmStInDetailDto> findStockInDetailByInCode(String inCode);
	String modifyStockInByInCode(PmStockInDto pmStockInDto, HttpSession session);
	List<PmWhDto> findWhList();
	String addStIn(PmStInDataDto stInData, HttpSession session);
	String modifyStIn(PmStInDataDto stInData, HttpSession session);

}
