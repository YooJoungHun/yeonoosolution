package com.choongang.yeonsolution.product.smm.dao;

import java.util.List;

import com.choongang.yeonsolution.product.smm.domain.itemDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDto;

public interface SMMDao {

	List<stMoveDetailDto> selectStockMoveStatusList();

	List<stMoveDetailDto> selectStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate);

	List<stMoveDto> selectStockMoveRegistrationList();

	void updateStockMoveConfirmationByMoveCodes(String moveCode);

	List<stMoveDetailDto> selectStockMoveDetailListByMoveCode(String moveCode);

	void insertStockMoveRegistrationByMoveDateAndMoveMemo(String moveDate, String moveMemo);

	List<itemDto> selectItemCodeList();

	List<itemDto> selectItemCodeRowDataListByItemCode(String itemCode);



}
