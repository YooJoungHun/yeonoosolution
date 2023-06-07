package com.choongang.yeonsolution.product.is.dao;

import java.util.List;

import com.choongang.yeonsolution.product.is.domain.IsBomDto;
import com.choongang.yeonsolution.product.is.domain.IsLossDto;
import com.choongang.yeonsolution.product.is.domain.IsPaginationDto;
import com.choongang.yeonsolution.product.is.domain.IsWhDto;
import com.choongang.yeonsolution.product.is.domain.IsWhStockDetailDto;
import com.choongang.yeonsolution.product.is.domain.MainPageDto;

public interface ISDao {
	List<IsWhStockDetailDto> selectIsItemListByItemCode(IsWhStockDetailDto whStockDetailDto);

	List<IsBomDto> selectIsBomListByItemNameAndItemType(IsBomDto isBomDto);
	
	List<IsWhDto> selectIsWhDtoWhList();
	int selectWhTotalCount();
	List<IsWhDto> selectWhListByPagination(IsPaginationDto paginationDto);
	int selectWhItemTotalCount(String whCode);
	List<IsWhDto> selectISItemListByWhCode(IsWhDto paramWhDto);

	List<MainPageDto> selectInfoForMainPage();
	List<MainPageDto> selectOrdersListForMainPage();
	List<IsLossDto> selectLossListForMainPage();




}
