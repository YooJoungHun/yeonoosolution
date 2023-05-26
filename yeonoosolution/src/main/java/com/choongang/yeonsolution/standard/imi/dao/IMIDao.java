package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

public interface IMIDao {

	// 제품 리스트
	List<ItemDto> selectItemList();

	// 제품 등록
	int insertItem(ItemDto itemInfo);
	
	// 창고 리스트
	List<ItemDto> selectWhList();

}
