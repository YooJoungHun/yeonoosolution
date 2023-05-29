package com.choongang.yeonsolution.product.is.dao;

import java.util.List;

import com.choongang.yeonsolution.product.is.domain.PaginationDto;
import com.choongang.yeonsolution.product.is.domain.WhDto;
import com.choongang.yeonsolution.product.is.domain.WhStockDetailDto;

public interface ISDao {
	WhStockDetailDto selectIsItemListByItemCode(WhStockDetailDto whStockDetailDto);

	List<WhDto> selectIsWhDtoWhList();
	int selectWhTotalCount();
	List<WhDto> selectWhListByPagination(PaginationDto paginationDto);

}
