package com.choongang.yeonsolution.product.smm.service;

import java.util.List;

import com.choongang.yeonsolution.product.smm.domain.ItemDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDto;
import com.choongang.yeonsolution.product.smm.domain.WhDto;

public interface SMMService {

	List<StMoveDetailDto> findStockMoveStatusList();

	List<StMoveDetailDto> findStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate);

	List<StMoveDto> findStockMoveRegistrationList();

	void modifyStockMoveConfirmationBymoveCode(String moveCode, String memberName);

	List<StMoveDetailDto> findStockMoveDetailListByMoveCode(String moveCode);

	void addStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(String memberUid, String moveDate, String moveMemo);

	List<ItemDto> findItemCodeList();

	List<WhDto> findWhCodeList();
	
	List<ItemDto> findItemCodeRowDataListByItemCode(String itemCode);

	void addStockMoveDetailByStMoveDetailDto(StMoveDetailDto stMoveDetailDto);

	void modifyStockMoveRegistrationByMoveCodeAndMoveMemo(String moveCode, String moveMemo);

	void modifyStockMoveRegistrationDeleteStatusByMoveCode(String moveCode);

	void modifyStockMoveDetailByMoveCodeAndSorderAndMoveMemo(String moveCode, String sorder, String moveMemo);

	void removeStockMoveDetailByMoveCodeAndSorder(String moveCode, String sorder);

	void modifyStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(String memberUid, String moveCode);

}
