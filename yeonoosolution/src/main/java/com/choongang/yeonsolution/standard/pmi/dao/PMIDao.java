package com.choongang.yeonsolution.standard.pmi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.BomDto;

public interface PMIDao {
	
	// 완제품 리스트
	List<ItemDto> selectProductItemList();

	// 반제품 리스트
	List<ItemDto> selectSemiProductItemList();
	
	// Bom 리스트
	List<BomDto> selectBomListByItemCode(String itemCode);
	
	// Bom 인서트
	int insertBomByBomDto(BomDto bomDto);

}
