package com.choongang.yeonsolution.product.is.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.is.dao.ISDao;
import com.choongang.yeonsolution.product.is.domain.PaginationDto;
import com.choongang.yeonsolution.product.is.domain.WhDto;
import com.choongang.yeonsolution.product.is.domain.WhStockDetailDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ISServiceImpl implements ISService {
	private final ISDao isDao;

	@Override
	public WhStockDetailDto findIsItemListByItemCode(WhStockDetailDto whStockDetailDto) {
		log.info("is Service findIsItemListByItemCode() start");
		WhStockDetailDto returnWhStockDetailDto= null;
		returnWhStockDetailDto = isDao.selectIsItemListByItemCode(whStockDetailDto);
		
		return returnWhStockDetailDto;
	}

	@Override
	public List<WhDto> findIsWhDtoWhList() {
		log.info("is Service findIsWhDtoWhList() start");
		List<WhDto> whDtoList = isDao.selectIsWhDtoWhList();
		
		return whDtoList;
	}

	@Override
	public Map<String, Object> findIsWhListByPagination(PaginationDto paginationDto) {
		log.info("is Service findIsWhListByPagination() start");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int totalCount = isDao.selectWhTotalCount();
		paginationDto.setTotalCount(totalCount);
		log.info("paginationDto : " + paginationDto.toString());
		
		List<WhDto> whDtoList = isDao.selectWhListByPagination(paginationDto);
		log.info("whDtoList : " + whDtoList.toString());
		
		returnMap.put("pagination", paginationDto);
		returnMap.put("whDtoList", whDtoList);
		
		return returnMap;
	}
	
}
