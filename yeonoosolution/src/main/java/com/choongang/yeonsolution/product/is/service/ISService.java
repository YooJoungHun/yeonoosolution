package com.choongang.yeonsolution.product.is.service;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.product.is.domain.PaginationDto;
import com.choongang.yeonsolution.product.is.domain.WhDto;
import com.choongang.yeonsolution.product.is.domain.WhStockDetailDto;

public interface ISService {
	WhStockDetailDto findIsItemListByItemCode(WhStockDetailDto whStockDetailDto);

	Map<String, Object> findIsWhListByPagination(PaginationDto paginationDto);
	List<WhDto> findIsWhDtoWhList();

}
