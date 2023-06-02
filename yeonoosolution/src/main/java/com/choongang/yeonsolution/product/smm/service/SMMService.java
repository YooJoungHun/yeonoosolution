package com.choongang.yeonsolution.product.smm.service;

import java.util.List;

import com.choongang.yeonsolution.product.smm.domain.itemDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDto;

public interface SMMService {

	List<stMoveDetailDto> findStockMoveStatusList();

	List<stMoveDetailDto> findStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate);

	List<stMoveDto> findStockMoveRegistrationList();

	void modifyStockMoveConfirmationBymoveCodes(String moveCode);

	List<stMoveDetailDto> findStockMoveDetailListByMoveCode(String moveCode);

	void addStockMoveRegistrationByMoveDateAndMoveMemo(String moveDate, String moveMemo);

	List<itemDto> findItemCodeList();

	List<itemDto> findItemCodeRowDataListByItemCode(String itemCode);



}
