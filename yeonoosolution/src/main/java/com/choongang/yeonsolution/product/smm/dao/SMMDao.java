package com.choongang.yeonsolution.product.smm.dao;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.product.smm.domain.ItemDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDto;
import com.choongang.yeonsolution.product.smm.domain.WhDto;

public interface SMMDao {

	List<StMoveDetailDto> selectStockMoveStatusList();

	List<StMoveDetailDto> selectStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate);

	List<StMoveDto> selectStockMoveRegistrationList();

	void updateStockMoveConfirmationByMoveCode(String moveCode);

	List<StMoveDetailDto> selectStockMoveDetailListByMoveCode(String moveCode);

	void insertStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(String memberUid, String moveDate, String moveMemo);

	List<ItemDto> selectItemCodeList();

	List<WhDto> selectWhCodeList();

	List<ItemDto> selectItemCodeRowDataListByItemCode(String itemCode);

	void insertStockMoveDetailByStMoveDetailDto(StMoveDetailDto stMoveDetailDto);

	List<StMoveDetailDto> selectSorderByMoveCode(String moveCode);

	void updateStockMoveRegistrationByMoveCodeAndMoveMemo(String moveCode, String moveMemo);

	void updateStockMoveRegistrationDeleteStatusByMoveCode(String moveCode);

	void updateStockMoveDetailByMoveCodeAndSorderAndMoveMemo(String moveCode, String sorder, String moveMemo);

	void deleteStockMoveDetailByMoveCodeAndSorder(String moveCode, String sorder);

	void updateStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(String memberUid, String moveCode);

	void updateWhStockDetailByStockMoveDetailList(StMoveDetailDto stMoveDetailDto);

	void updateWhStockDetailByStMoveDetailMap(Map<String, Object> stMoveDetailMap);

}
