package com.choongang.yeonsolution.standard.pmi.service;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.BomDto;

public interface PMIService {

	// 완제품 리스트
	List<ItemDto> findProductItemList();
	
	// 반제품 리스트
	List<ItemDto> findSemiProductItemList();
	
	// Bom 리스트
	List<BomDto> findBomListByItemCode(String itemCode);
	
	// Bom 인서트
	int addBomByBomDto(BomDto bomDto);
	

}
