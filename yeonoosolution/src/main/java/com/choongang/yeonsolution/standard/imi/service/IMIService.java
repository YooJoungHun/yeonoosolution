package com.choongang.yeonsolution.standard.imi.service;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.domain.CompanyDto;

public interface IMIService {
	
	// 제품 리스트
	List<ItemDto> findItemList();

	// 제품 등록
	int addItem(ItemDto itemInfo);
	
	// 창고 목록
	List<ItemDto> findWhList();
	
	// 제품 삭제
	int modifyItemByItemCode(String itemCode);
	
	// 제품 수정
	int modifyItemByItemDto(ItemDto itemDto);
	
	// 거래처 목록
	List<CompanyDto> findCompanyList();

}
