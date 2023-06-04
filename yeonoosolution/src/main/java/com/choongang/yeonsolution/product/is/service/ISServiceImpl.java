package com.choongang.yeonsolution.product.is.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.is.dao.ISDao;
import com.choongang.yeonsolution.product.is.domain.IsBomDto;
import com.choongang.yeonsolution.product.is.domain.IsPaginationDto;
import com.choongang.yeonsolution.product.is.domain.IsWhDto;
import com.choongang.yeonsolution.product.is.domain.IsWhStockDetailDto;
import com.choongang.yeonsolution.product.is.domain.MainPageDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ISServiceImpl implements ISService {
	private final ISDao isDao;

	@Override
	public List<IsWhStockDetailDto> findIsItemListByItemCode(IsWhStockDetailDto whStockDetailDto) {
		log.info("is Service findIsItemListByItemCode() start");
		List<IsWhStockDetailDto> whStockDetailDtoList= null;
		whStockDetailDtoList = isDao.selectIsItemListByItemCode(whStockDetailDto);
		
		return whStockDetailDtoList;
	}
	

	@Override
	public List<IsBomDto> findIsBomListByItemNameAndItemType(IsBomDto isBomDto) {
		log.info("is bom Service findIsBomListByItemNameAndItemType() start");
		List<IsBomDto> isBomDtoList = isDao.selectIsBomListByItemNameAndItemType(isBomDto);
		
		return isBomDtoList;
	}

	@Override
	public List<IsWhDto> findIsWhDtoWhList() {
		log.info("is Service findIsWhDtoWhList() start");
		List<IsWhDto> whDtoList = isDao.selectIsWhDtoWhList();
		
		return whDtoList;
	}

	@Override
	public Map<String, Object> findIsWhListByPagination(IsPaginationDto paginationDto) {
		log.info("is Service findIsWhListByPagination() start");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int totalCount = isDao.selectWhTotalCount();
		paginationDto.setTotalCount(totalCount);
		log.info("paginationDto : " + paginationDto.toString());
		
		List<IsWhDto> whDtoList = isDao.selectWhListByPagination(paginationDto);
		log.info("whDtoList : " + whDtoList.toString());
		
		returnMap.put("pagination", paginationDto);
		returnMap.put("whDtoList", whDtoList);
		
		return returnMap;
	}

	@Override
	public Map<String, Object> findIsWhListByWhCode(String whCode, IsPaginationDto paginationDto) {
		log.info("is wh Service findIsWhListByWhCode() start");
		int totalCount = isDao.selectWhItemTotalCount(whCode);
		
		log.info("is wh Service findIsWhListByWhCode() totalCount : " + totalCount);
		paginationDto.setTotalCount(totalCount);
		log.info("paginationDto : "+paginationDto);
		
		IsWhDto paramWhDto = new IsWhDto();
		paramWhDto.setStartRow(paginationDto.getStartRow());
		paramWhDto.setEndRow(paginationDto.getEndRow());
		paramWhDto.setWdCode(whCode);
		
		List<IsWhDto> whDtoList = isDao.selectISItemListByWhCode(paramWhDto);
		
		Map<String, Object> whDtoMap = new HashMap<String, Object>();
		whDtoMap.put("pagination", paginationDto);
		whDtoMap.put("whDtoList", whDtoList);
		
		return whDtoMap;
	}


	@Override
	public Map<String, Object> findInfoForMainPage(HttpSession session) {
		log.info("is main Service findInfoForMainPage() start");
		Map<String, Object> mainPageMap = new HashMap<String, Object>();
		List<MainPageDto> mainPageDtoList = isDao.selectInfoForMainPage();
		
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		mainPageMap.put("memberDto", memberDto);
		mainPageMap.put("mainPageDtoList", mainPageDtoList);
		
		return mainPageMap;
	}

	
}
