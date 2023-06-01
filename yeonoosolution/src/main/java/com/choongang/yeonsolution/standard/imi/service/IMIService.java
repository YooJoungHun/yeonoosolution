package com.choongang.yeonsolution.standard.imi.service;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.imi.domain.IMICompanyDto;

public interface IMIService {
	
	// 제품 리스트
	List<IMIItemDto> findItemList();

	// 제품 등록
	int addItem(IMIItemDto itemInfo);
	
	// 창고 목록
	List<IMIItemDto> findWhList();
	
	// 제품 삭제
	int modifyItemByItemCode(String itemCode);
	
	// 제품 수정
	int modifyItemByItemDto(IMIItemDto itemDto);
	
	// 거래처 목록
	List<IMICompanyDto> findCompanyList();

}
