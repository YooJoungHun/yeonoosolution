package com.choongang.yeonsolution.standard.pmi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.PMIBomDto;

public interface PMIDao {
	
	// 완제품 리스트
	List<IMIItemDto> selectProductItemList();

	// 반제품 리스트
	List<IMIItemDto> selectSemiProductItemList();
	
	// Bom 리스트
	List<PMIBomDto> selectBomListByItemCode(String itemCode);
	
	// Bom 인서트
	int insertBomByBomDto(PMIBomDto bomDto);
	
	// Bom 딜리트
	int deleteBomByBomDto(PMIBomDto bomDto);

}
