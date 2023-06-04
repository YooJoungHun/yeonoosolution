package com.choongang.yeonsolution.product.is.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.choongang.yeonsolution.product.is.domain.IsBomDto;
import com.choongang.yeonsolution.product.is.domain.IsPaginationDto;
import com.choongang.yeonsolution.product.is.domain.IsWhDto;
import com.choongang.yeonsolution.product.is.domain.IsWhStockDetailDto;

public interface ISService {
	List<IsWhStockDetailDto> findIsItemListByItemCode(IsWhStockDetailDto whStockDetailDto);

	Map<String, Object> findIsWhListByPagination(IsPaginationDto paginationDto);
	List<IsWhDto> findIsWhDtoWhList();
	Map<String, Object> findIsWhListByWhCode(String whCode, IsPaginationDto paginationDto);

	List<IsBomDto> findIsBomListByItemNameAndItemType(IsBomDto isBomDto);

	Map<String, Object> findInfoForMainPage(HttpSession session);


}
