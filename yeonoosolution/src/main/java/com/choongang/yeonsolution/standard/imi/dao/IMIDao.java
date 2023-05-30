package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.domain.CompanyDto;

public interface IMIDao {

	// 제품 리스트
	List<ItemDto> selectItemList();

	// 제품 등록
	int insertItem(ItemDto itemInfo);
	
	// 창고 리스트
	List<ItemDto> selectWhList();
	
	// 제품 삭제
	int updateItemByItemCode(String itemCode);

	// 제품 수정
	int updateItemByItemDto(ItemDto itemDto);
	
	// 거래처 목록
	List<CompanyDto> selectCompanyList();

}
