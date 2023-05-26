package com.choongang.yeonsolution.standard.imi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.dao.IMIDao;
import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class IMIServiceImpl implements IMIService {
	
	private final IMIDao imiDao;
	
	@Override
	public List<ItemDto> findItemList() {
		List<ItemDto> itemList = imiDao.selectItemList();
		// memo null 값 공백 처리
		for(ItemDto item : itemList) {
			String memo = item.getMemo();
			if (memo == null) {
				memo = "";
			}
			item.setMemo(memo);
		}
		log.info("selectItemList -> " + itemList);
		
		return itemList;
	}

	@Override
	public int addItem(ItemDto itemInfo) {
		int insertResult = imiDao.insertItem(itemInfo);
		
		return insertResult;
	}

	@Override
	public List<ItemDto> findWhList() {
		
		return imiDao.selectWhList();
	}

}
