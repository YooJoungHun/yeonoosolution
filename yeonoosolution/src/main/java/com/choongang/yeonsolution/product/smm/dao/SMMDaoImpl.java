package com.choongang.yeonsolution.product.smm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.smm.domain.itemDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SMMDaoImpl implements SMMDao {
	private final SqlSession sqlSession;

	@Override
	public List<stMoveDetailDto> selectStockMoveStatusList() {
		
		List<stMoveDetailDto> stockMoveStatus = sqlSession.selectList("selectStockMoveStatusList");
		
		return stockMoveStatus;
	}

	@Override
	public List<stMoveDetailDto> selectStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate) {
			
		Map<String, Object> stockMoveSearchMap = new HashMap<>();
		stockMoveSearchMap.put("keyword", keyword);
		stockMoveSearchMap.put("startDate", startDate);
		stockMoveSearchMap.put("endDate", endDate);
		
		List<stMoveDetailDto> stockMoveSearch = sqlSession.selectList("selectStockMoveSearchListByKeywordAndDate", stockMoveSearchMap);
		
		return stockMoveSearch;
	}

	@Override
	public List<stMoveDto> selectStockMoveRegistrationList() {
		
		List<stMoveDto> stockMoveRegistration = sqlSession.selectList("selectStockMoveRegistrationList");
		
		return stockMoveRegistration;
	}

	@Override
	public void updateStockMoveConfirmationByMoveCodes(String moveCode) {
		sqlSession.update("updateStockMoveConfirmationByMoveCodes", moveCode);
	}

	@Override
	public List<stMoveDetailDto> selectStockMoveDetailListByMoveCode(String moveCode) {
		
		List<stMoveDetailDto> stockMoveDetail = sqlSession.selectList("selectStockMoveDetailListByMoveCode", moveCode);
		
		return stockMoveDetail;
	}

	@Override
	public void insertStockMoveRegistrationByMoveDateAndMoveMemo(String moveDate, String moveMemo) {
		
		Map<String, Object> stockMoveRegistrationMap = new HashMap<>();
		stockMoveRegistrationMap.put("moveDate", moveDate);
		stockMoveRegistrationMap.put("moveMemo", moveMemo);
		
		sqlSession.insert("insertStockMoveRegistrationByMoveDateAndMoveMemo", stockMoveRegistrationMap);
	}

	@Override
	public List<itemDto> selectItemCodeList() {
		
		List<itemDto> itemCodeList = sqlSession.selectList("selectItemCodeList");
		return itemCodeList;
	}

	@Override
	public List<itemDto> selectItemCodeRowDataListByItemCode(String itemCode) {
		
		List<itemDto> itemCodeRowData = sqlSession.selectList("selectItemCodeRowDataListByItemCode", itemCode);
		return itemCodeRowData;
	}

}
