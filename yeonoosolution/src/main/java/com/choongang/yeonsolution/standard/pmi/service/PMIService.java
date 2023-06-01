package com.choongang.yeonsolution.standard.pmi.service;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.PMIBomDto;

public interface PMIService {

	// 완제품 리스트
	List<IMIItemDto> findProductItemList();
	
	// 반제품 리스트
	List<IMIItemDto> findSemiProductItemList();
	
	// Bom 리스트
	List<PMIBomDto> findBomListByItemCode(String itemCode);
	
	// Bom 인서트
	int addBomByBomDto(PMIBomDto bomDto);
	
	// Bom 딜리트
	int removeBomByBomDto(PMIBomDto bomDto);
	

}
