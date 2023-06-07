package com.choongang.yeonsolution.product.som.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.som.dao.SOMDao;
import com.choongang.yeonsolution.product.som.domain.SOMStOutDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class SOMServiceImpl implements SOMService {
	
	private final SOMDao	somDao;
	
	@Override
	public List<SOMStOutDto> findStOutLists() {
		List<SOMStOutDto> listStOut = null;
		log.info("SOMServiceImpl findStOutList start");
		
		listStOut = somDao.selectStOutLists();
		
		return listStOut;
	}

	@Override
	public List<SOMStOutDto> findStOutDetailListsByOutCode(String outCode) {
		List<SOMStOutDto> listStOutDetail = null;
		log.info("SOMServiceImpl findStOutDetailLists start");
		
		listStOutDetail = somDao.selectStOutDetailListsByOutCode(outCode);
		
		return listStOutDetail;
	}
	
	@Override
	public List<SOMStOutDto> findStOutDtoWhLists() {
		List<SOMStOutDto> stOutWhLists = null;
		log.info("SOMServiceImpl findStOutDtoWhLists start");
		
		stOutWhLists = somDao.selectStOutDtoWhLists();
		
		return stOutWhLists;
	}

	@Override
	public List<SOMStOutDto> findStOutDtoItemLists() {
		List<SOMStOutDto> stOutItemLists = null;
		log.info("SOMServiceImpl findStOutDtoItemLists start");
		
		stOutItemLists = somDao.selectStOutDtoItemLists();
		
		return stOutItemLists;
	}
	

	@Override
	public int addStOutBySOMStOutDto(SOMStOutDto stOutDto) {
		int insertResult1 = 0;
		int insertResult2 = 0;
		log.info("SOMServiceImpl addStOutBySOMStOutDto start");
		
		insertResult1 = somDao.insertStOutBySOMStOutDto(stOutDto);
		
		if(insertResult1 == 1) {
			insertResult2 = somDao.insertStOutDetailBySOMStOutDto(stOutDto);			
		}
		
		log.info("SOMServiceImpl addStOutBySOMStOutDto insertResult1 + insertResult2 -> "+ (insertResult1 + insertResult2));
		
		return (insertResult1 + insertResult2);
	}

	@Override
	public int removeStOutByOutCode(String outCode) {
		int deleteResult = 0;
		log.info("SOMServiceImpl removeStOutByOutCode start");
		
		deleteResult = somDao.deleteStOutByOutCode(outCode);
		
		return deleteResult;
	}

	
	
}
