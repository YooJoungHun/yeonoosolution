package com.choongang.yeonsolution.standard.imi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.dao.IMIDao;
import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.imi.domain.IMICompanyDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class IMIServiceImpl implements IMIService {
	
	private final IMIDao imiDao;
	
	@Override
	public List<IMIItemDto> findItemList() {
		List<IMIItemDto> itemList = imiDao.selectItemList();
		// null 값 공백 처리
		for(IMIItemDto item : itemList) {
			item.setMemo(item.getMemo() == null ? "" : item.getMemo());
			item.setItemName(item.getItemName() == null ? "" : item.getItemName());
			item.setStockUnit(item.getStockUnit() == null ? "" : item.getStockUnit());
			item.setWhCode(item.getWhCode() == null ? "" : item.getWhCode());
			item.setPurchasePrice(item.getPurchasePrice() == null ? 0 : item.getPurchasePrice());
			item.setSalesPrice(item.getSalesPrice() == null ? 0 : item.getSalesPrice());
		}
		
		log.info("selectItemList -> " + itemList);
		
		return itemList;
	}

	@Override
	public int addItem(IMIItemDto itemInfo) {
		int insertResult = imiDao.insertItem(itemInfo);
		
		return insertResult;
	}

	@Override
	public List<IMIItemDto> findWhList() {
		
		return imiDao.selectWhList();
	}

	@Override
	public int modifyItemByItemCode(String itemCode) {
		
		return imiDao.updateItemByItemCode(itemCode);
	}

	@Override
	public int modifyItemByItemDto(IMIItemDto itemDto) {
		
		return imiDao.updateItemByItemDto(itemDto);
	}

	@Override
	public List<IMICompanyDto> findCompanyList() {
		
		return imiDao.selectCompanyList();
	}

}
