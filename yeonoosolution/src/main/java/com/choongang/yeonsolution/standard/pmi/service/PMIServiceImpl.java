package com.choongang.yeonsolution.standard.pmi.service;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.pmi.dao.PMIDao;
import com.choongang.yeonsolution.standard.pmi.domain.PMIBomDto;


@Service
@RequiredArgsConstructor
public class PMIServiceImpl implements PMIService {
	private final PMIDao pmiDao;

	@Override
	public List<IMIItemDto> findProductItemList() {
		List<IMIItemDto> findProductItemList = pmiDao.selectProductItemList();
		// null 값 공백 처리
		for(IMIItemDto item : findProductItemList) {
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
	public List<IMIItemDto> findSemiProductItemList() {
		List<IMIItemDto> findSemiProductItemList = pmiDao.selectSemiProductItemList();
		// null 값 공백 처리
		for(IMIItemDto item : findSemiProductItemList) {
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
	public List<PMIBomDto> findBomListByItemCode(String itemCode) {

		return pmiDao.selectBomListByItemCode(itemCode);
	}

	@Override
	public int addBomByBomDto(PMIBomDto bomDto) {
		try {
	        int insertResult = pmiDao.insertBomByBomDto(bomDto);
	        return insertResult;
	    } catch (Exception e) {
	        // 중복 등록 시 예외 처리
	        return -1; // 중복으로 인해 인서트 실패
	    }
	}

	@Override
	public int removeBomByBomDto(PMIBomDto bomDto) {
		
		return pmiDao.deleteBomByBomDto(bomDto);
	}

}
