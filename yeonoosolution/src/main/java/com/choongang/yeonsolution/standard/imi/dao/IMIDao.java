package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

public interface IMIDao {

	List<ItemDto> selectItemList();

}
