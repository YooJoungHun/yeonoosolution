package com.choongang.yeonsolution.product.smm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.smm.domain.ItemDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDto;
import com.choongang.yeonsolution.product.smm.domain.WhDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SMMDaoImpl implements SMMDao {
	private final SqlSession sqlSession;

	@Override
	public List<StMoveDetailDto> selectStockMoveStatusList() {
		
		List<StMoveDetailDto> stockMoveStatus = sqlSession.selectList("selectStockMoveStatusList");
		
		return stockMoveStatus;
	}

	@Override
	public List<StMoveDetailDto> selectStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate) {
			
		Map<String, Object> stockMoveSearchMap = new HashMap<>();
		stockMoveSearchMap.put("keyword", keyword);
		stockMoveSearchMap.put("startDate", startDate);
		stockMoveSearchMap.put("endDate", endDate);
		
		List<StMoveDetailDto> stockMoveSearch = sqlSession.selectList("selectStockMoveSearchListByKeywordAndDate", stockMoveSearchMap);
		
		return stockMoveSearch;
	}

	@Override
	public List<StMoveDto> selectStockMoveRegistrationList() {
		
		List<StMoveDto> stockMoveRegistration = sqlSession.selectList("selectStockMoveRegistrationList");
		
		return stockMoveRegistration;
	}

	@Override
	public void updateStockMoveConfirmationByMoveCode(String moveCode) {
		sqlSession.update("updateStockMoveConfirmationByMoveCode", moveCode);
	}

	@Override
	public List<StMoveDetailDto> selectStockMoveDetailListByMoveCode(String moveCode) {
		
		List<StMoveDetailDto> stockMoveDetail = sqlSession.selectList("selectStockMoveDetailListByMoveCode", moveCode);
		
		return stockMoveDetail;
	}

	@Override
	public void insertStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(String memberUid, String moveDate, String moveMemo) {
		
		Map<String, Object> insertStockMoveRegistrationMap = new HashMap<>();
		insertStockMoveRegistrationMap.put("memberUid", memberUid);
		insertStockMoveRegistrationMap.put("moveDate", moveDate);
		insertStockMoveRegistrationMap.put("moveMemo", moveMemo);
		
		sqlSession.insert("insertStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo", insertStockMoveRegistrationMap);
	}

	@Override
	public List<ItemDto> selectItemCodeList() {
		
		List<ItemDto> itemCodeList = sqlSession.selectList("selectItemCodeList");
		return itemCodeList;
	}

	@Override
	public List<WhDto> selectWhCodeList() {
		
		List<WhDto> whCodeList = sqlSession.selectList("selectWhCodeList");
		return whCodeList;
	}
	
	@Override
	public List<ItemDto> selectItemCodeRowDataListByItemCode(String itemCode) {
		
		List<ItemDto> itemCodeRowData = sqlSession.selectList("selectItemCodeRowDataListByItemCode", itemCode);
		return itemCodeRowData;
	}

	@Override
	public void insertStockMoveDetailByStMoveDetailDto(StMoveDetailDto stMoveDetailDto) {
		
		sqlSession.insert("insertStockMoveDetailByStMoveDetailDto", stMoveDetailDto);
	}

	//move_code로 sorder 가져오기
	@Override
	public List<StMoveDetailDto> selectSorderByMoveCode(String moveCode) {
		
		List<StMoveDetailDto> sorders = sqlSession.selectList("selectSorderByMoveCode", moveCode);
		
		return sorders;
	}

	@Override
	public void updateStockMoveRegistrationByMoveCodeAndMoveMemo(String moveCode, String moveMemo) {
		
		Map<String, Object> updateStockMoveRegistrationMap = new HashMap<>();
		updateStockMoveRegistrationMap.put("moveCode", moveCode);
		updateStockMoveRegistrationMap.put("moveMemo", moveMemo);
		
		sqlSession.update("updateStockMoveRegistrationByMoveCodeAndMoveMemo", updateStockMoveRegistrationMap);
	}

	@Override
	public void updateStockMoveRegistrationDeleteStatusByMoveCode(String moveCode) {
		
		sqlSession.update("updateStockMoveRegistrationDeleteStatusByMoveCode", moveCode);
	}

	@Override
	public void updateStockMoveDetailByMoveCodeAndSorderAndMoveMemo(String moveCode, String sorder, String moveMemo) {
		
		Map<String, Object> updateStockMoveDetailMap = new HashMap<>();
		updateStockMoveDetailMap.put("moveCode", moveCode);
		updateStockMoveDetailMap.put("sorder", sorder);
		updateStockMoveDetailMap.put("moveMemo", moveMemo);
		
		sqlSession.update("updateStockMoveDetailByMoveCodeAndSorderAndMoveMemo", updateStockMoveDetailMap);
	}

	@Override
	public void deleteStockMoveDetailByMoveCodeAndSorder(String moveCode, String sorder) {
		
		Map<String, Object> deleteStockMoveDetailMap = new HashMap<>();
		deleteStockMoveDetailMap.put("moveCode", moveCode);
		deleteStockMoveDetailMap.put("sorder", sorder);
		
		sqlSession.update("deleteStockMoveDetailByMoveCodeAndSorder", deleteStockMoveDetailMap);
	}

	@Override
	public void updateStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(String memberUid, String moveCode) {
		
		Map<String, Object> updateStockMoveRegistrationMap = new HashMap<>();
		updateStockMoveRegistrationMap.put("memberUid", memberUid);
		updateStockMoveRegistrationMap.put("moveCode", moveCode);
		
		sqlSession.update("updateStockMoveRegistrationDateAndUserByMemberUidAndMoveCode", updateStockMoveRegistrationMap);
	}

	@Override
	public void updateWhStockDetailByStockMoveDetailList(StMoveDetailDto stMoveDetailDto) {
		sqlSession.update("updateWhStockDetailByStockMoveDetailList", stMoveDetailDto);
	}

	@Override
	public void updateWhStockDetailByStMoveDetailMap(Map<String, Object> stMoveDetailMap) {
		sqlSession.selectOne("orders.updatePmWhStockDetailByStInDetail", stMoveDetailMap);
		
	}

}
