package com.choongang.yeonsolution.standard.pmi.service;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.pmi.dao.PMIDao;
import com.choongang.yeonsolution.standard.pmi.domain.BomDto;


@Service
@RequiredArgsConstructor
public class PMIServiceImpl implements PMIService {
	private final PMIDao pmiDao;

	@Override
	public List<ItemDto> findProductItemList() {
		List<ItemDto> findProductItemList = pmiDao.selectProductItemList();
		// null 값 공백 처리
		for(ItemDto item : findProductItemList) {
			item.setMemo(item.getMemo() == null ? "" : item.getMemo());
			item.setItemName(item.getItemName() == null ? "" : item.getItemName());
			item.setStockUnit(item.getStockUnit() == null ? "" : item.getStockUnit());
			item.setWhCode(item.getWhCode() == null ? "" : item.getWhCode());
			item.setPurchasePrice(item.getPurchasePrice() == null ? 0 : item.getPurchasePrice());
			item.setSalesPrice(item.getSalesPrice() == null ? 0 : item.getSalesPrice());
		}
		
		return findProductItemList;
	}

	@Override
	public List<ItemDto> findSemiProductItemList() {
		List<ItemDto> findSemiProductItemList = pmiDao.selectSemiProductItemList();
		// null 값 공백 처리
		for(ItemDto item : findSemiProductItemList) {
			item.setMemo(item.getMemo() == null ? "" : item.getMemo());
			item.setItemName(item.getItemName() == null ? "" : item.getItemName());
			item.setStockUnit(item.getStockUnit() == null ? "" : item.getStockUnit());
			item.setWhCode(item.getWhCode() == null ? "" : item.getWhCode());
			item.setPurchasePrice(item.getPurchasePrice() == null ? 0 : item.getPurchasePrice());
			item.setSalesPrice(item.getSalesPrice() == null ? 0 : item.getSalesPrice());
		}
		
		return findSemiProductItemList;
	}

	@Override
	public List<BomDto> findBomListByItemCode(String itemCode) {

		return pmiDao.selectBomListByItemCode(itemCode);
	}

	@Override
	public int addBomByBomDto(BomDto bomDto) {
		try {
	        int insertResult = pmiDao.insertBomByBomDto(bomDto);
	        return insertResult;
	    } catch (Exception e) {
	        // 중복 등록 시 예외 처리
	        return -1; // 중복으로 인해 인서트 실패
	    }
	}

	@Override
	public int removeBomByBomDto(BomDto bomDto) {
		
		return pmiDao.deleteBomByBomDto(bomDto);
	}

}
