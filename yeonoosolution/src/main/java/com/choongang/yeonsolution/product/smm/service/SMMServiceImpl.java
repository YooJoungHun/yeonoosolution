package com.choongang.yeonsolution.product.smm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.smm.dao.SMMDao;
import com.choongang.yeonsolution.product.smm.domain.ItemDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDto;
import com.choongang.yeonsolution.product.smm.domain.WhDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SMMServiceImpl implements SMMService {
	private final SMMDao smmDao;

	@Override
	public List<StMoveDetailDto> findStockMoveStatusList() {
		List<StMoveDetailDto> stockMoveStatus = smmDao.selectStockMoveStatusList();
		return stockMoveStatus;
	}

	@Override
	public List<StMoveDetailDto> findStockMoveSearchListByKeywordAndDate(String keyword, String startDate, String endDate) {
		
		List<StMoveDetailDto> stockMoveSearch = smmDao.selectStockMoveSearchListByKeywordAndDate(keyword, startDate, endDate);
		
		return stockMoveSearch;
	}

	@Override
	public List<StMoveDto> findStockMoveRegistrationList() {
		
		List<StMoveDto> stockMoveRegistration = smmDao.selectStockMoveRegistrationList();
		
		return stockMoveRegistration;
	}

	@Override
	public void modifyStockMoveConfirmationBymoveCode(String moveCode, String memberName) {
		
		// "저장" -> "확정" 변경
		smmDao.updateStockMoveConfirmationByMoveCode(moveCode);
		
		List<StMoveDetailDto> stMoveDetailList = smmDao.selectStockMoveDetailListByMoveCode(moveCode);
		
		for(StMoveDetailDto stMoveDetailDto : stMoveDetailList) {
			smmDao.updateWhStockDetailByStockMoveDetailList(stMoveDetailDto);
			
			Map<String, Object> stMoveDetailMap = new HashMap<String, Object>();
			stMoveDetailMap.put("whCode", stMoveDetailDto.getWhCodeIn());
			stMoveDetailMap.put("itemCode", stMoveDetailDto.getItemCode());
			stMoveDetailMap.put("inQuantity", stMoveDetailDto.getMoveQuantity());
			stMoveDetailMap.put("updateUser", memberName);
			smmDao.updateWhStockDetailByStMoveDetailMap(stMoveDetailMap);
		}
	}

	@Override
	public List<StMoveDetailDto> findStockMoveDetailListByMoveCode(String moveCode) {
		
		List<StMoveDetailDto> stockMoveDetail = smmDao.selectStockMoveDetailListByMoveCode(moveCode);
		
		return stockMoveDetail;
	}

	@Override
	public void addStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(String memberUid, String moveDate, String moveMemo) {
		
		smmDao.insertStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(memberUid, moveDate, moveMemo);
		
	}

	@Override
	public List<ItemDto> findItemCodeList() {
		
		List<ItemDto> itemCodeList = smmDao.selectItemCodeList();
		
		return itemCodeList;
	}

	@Override
	public List<WhDto> findWhCodeList() {
		
		List<WhDto> whCodeList = smmDao.selectWhCodeList();
				
		return whCodeList;
	}
	
	@Override
	public List<ItemDto> findItemCodeRowDataListByItemCode(String itemCode) {
		
		List<ItemDto> itemCodeRowDataList = smmDao.selectItemCodeRowDataListByItemCode(itemCode);
		return itemCodeRowDataList;
	}

	@Override
	public void addStockMoveDetailByStMoveDetailDto(StMoveDetailDto stMoveDetailDto) {
		
		// 해당 move_code에 대한 sorder를 가져와 +1
		List<StMoveDetailDto> sorders = smmDao.selectSorderByMoveCode(stMoveDetailDto.getMoveCode());
	    if (sorders.isEmpty()) {
	        stMoveDetailDto.setSorder(1L);
	    } else {
	    	StMoveDetailDto lastSorder = sorders.get(sorders.size() - 1); // sorders 의 마지막 요소
	    	stMoveDetailDto.setSorder(lastSorder.getSorder() + 1); // 마지막요소에 +1 (max)
	    }
	    smmDao.insertStockMoveDetailByStMoveDetailDto(stMoveDetailDto);
	}

	@Override
	public void modifyStockMoveRegistrationByMoveCodeAndMoveMemo(String moveCode, String moveMemo) {
		
		smmDao.updateStockMoveRegistrationByMoveCodeAndMoveMemo(moveCode, moveMemo);
	}

	@Override
	public void modifyStockMoveRegistrationDeleteStatusByMoveCode(String moveCode) {
		
		smmDao.updateStockMoveRegistrationDeleteStatusByMoveCode(moveCode);
	}

	@Override
	public void modifyStockMoveDetailByMoveCodeAndSorderAndMoveMemo(String moveCode, String sorder, String moveMemo) {
		
		smmDao.updateStockMoveDetailByMoveCodeAndSorderAndMoveMemo(moveCode, sorder, moveMemo);
	}

	@Override
	public void removeStockMoveDetailByMoveCodeAndSorder(String moveCode, String sorder) {
		
		smmDao.deleteStockMoveDetailByMoveCodeAndSorder(moveCode, sorder);
	}

	@Override
	public void modifyStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(String memberUid, String moveCode) {
		
		smmDao.updateStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(memberUid, moveCode);
	}
	
	
}
