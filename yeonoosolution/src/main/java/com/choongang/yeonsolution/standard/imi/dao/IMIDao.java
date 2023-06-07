package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.imi.domain.IMICompanyDto;

public interface IMIDao {

	// 제품 리스트
	List<IMIItemDto> selectItemList();

	// 제품 등록
	int insertItem(IMIItemDto itemInfo);
	
	// 창고 리스트
	List<IMIItemDto> selectWhList();
	
	// 제품 삭제
	int updateItemByItemCode(String itemCode);

	// 제품 수정
	int updateItemByItemDto(IMIItemDto itemDto);
	
	// 거래처 목록
	List<IMICompanyDto> selectCompanyList();

	// 검색 리스트
	List<IMIItemDto> selectItemListBySearchKeyWord(String searchKeyWord);

}
