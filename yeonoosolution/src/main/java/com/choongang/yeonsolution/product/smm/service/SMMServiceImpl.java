package com.choongang.yeonsolution.product.smm.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.smm.dao.SMMDao;
import com.choongang.yeonsolution.product.smm.domain.itemDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SMMServiceImpl implements SMMService {
	private final SMMDao smmDao;

	@Override
	public List<stMoveDetailDto> findStockMoveStatusList() {
		List<stMoveDetailDto> stockMoveStatus = smmDao.selectStockMoveStatusList();
		return stockMoveStatus;
	}

	@Override
	public List<stMoveDetailDto> findStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate) {
		
		List<stMoveDetailDto> stockMoveSearch = smmDao.selectStockMoveSearchListByKeywordAndDate(keyword, startDate, endDate);
		
		return stockMoveSearch;
	}

	@Override
	public List<stMoveDto> findStockMoveRegistrationList() {
		
		List<stMoveDto> stockMoveRegistration = smmDao.selectStockMoveRegistrationList();
		
		return stockMoveRegistration;
	}

	@Override
	public void modifyStockMoveConfirmationBymoveCodes(String moveCode) {
		
		smmDao.updateStockMoveConfirmationByMoveCodes(moveCode);
	}

	@Override
	public List<stMoveDetailDto> findStockMoveDetailListByMoveCode(String moveCode) {
		
		List<stMoveDetailDto> stockMoveDetail = smmDao.selectStockMoveDetailListByMoveCode(moveCode);
		
		return stockMoveDetail;
	}

	@Override
	public void addStockMoveRegistrationByMoveDateAndMoveMemo(String moveDate, String moveMemo) {
		
		smmDao.insertStockMoveRegistrationByMoveDateAndMoveMemo(moveDate, moveMemo);
		
	}

	@Override
	public List<itemDto> findItemCodeList() {
		
		List<itemDto> itemCodeList = smmDao.selectItemCodeList();
		
		return itemCodeList;
	}

	@Override
	public List<itemDto> findItemCodeRowDataListByItemCode(String itemCode) {
		
		List<itemDto> itemCodeRowDataList = smmDao.selectItemCodeRowDataListByItemCode(itemCode);
		return itemCodeRowDataList;
	}

	
	
}
