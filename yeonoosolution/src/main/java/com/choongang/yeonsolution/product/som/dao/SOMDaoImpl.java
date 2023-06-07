package com.choongang.yeonsolution.product.som.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.som.domain.SOMStOutDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class SOMDaoImpl implements SOMDao {
	
	private final SqlSession	sqlSession;
	
	@Override
	public List<SOMStOutDto> selectStOutLists() {
		List<SOMStOutDto> listStOut = null;
		log.info("SOMDaoImpl selectStOutLists start");
		
		try {
			listStOut = sqlSession.selectList("SOMStOutList");
			log.info("SOMDaoImpl selectStOutLists listStOut size -> "+ listStOut.size());
		} catch (Exception e) {
			log.info("SOMDaoImpl selectStOutLists e.getMessage() -> "+ e.getMessage());
		}
		
		return listStOut;
	}

	@Override
	public List<SOMStOutDto> selectStOutDetailListsByOutCode(String outCode) {
		List<SOMStOutDto>listStOutDetail = null;
		log.info("SOMDaoImpl selectStOutDetailLists start");
		
		try {
			listStOutDetail = sqlSession.selectList("SOMStOutListDetail", outCode);
			log.info("SOMDaoImpl selectStOutLists listStOutDetail size -> "+ listStOutDetail.size());
		} catch (Exception e) {
			log.info("SOMDaoImpl selectStOutDetailLists e.getMessage() -> "+ e.getMessage());
		}
		
		return listStOutDetail;
	}
	
	@Override
	public List<SOMStOutDto> selectStOutDtoWhLists() {
		List<SOMStOutDto> stOutWhLists = null;
		log.info("SOMDaoImpl selectStOutDtoWhLists start");
		
		try {
			stOutWhLists = sqlSession.selectList("SOMStOUtDtoWhList");
			log.info("SOMDaoImpl selectStOutDtoWhLists stOutWhLists size -> "+ stOutWhLists.size());
		} catch (Exception e) {
			log.info("SOMDaoImpl selectStOutDtoWhLists e.getMessage() -> "+ e.getMessage());
		}
		
		return stOutWhLists;
	}

	@Override
	public List<SOMStOutDto> selectStOutDtoItemLists() {
		List<SOMStOutDto> stOutItemLists = null;
		log.info("SOMDaoImpl selectStOutDtoItemLists start");
		
		try {
			stOutItemLists = sqlSession.selectList("SOMStOUtDtoInfoList");
			log.info("SOMDaoImpl selectStOutDtoItemLists stOutItemLists size -> "+ stOutItemLists.size());
		} catch (Exception e) {
			log.info("SOMDaoImpl selectStOutDtoItemLists e.getMessage() -> "+ e.getMessage());
		}
		
		return stOutItemLists;
	}

	@Override
	public int insertStOutBySOMStOutDto(SOMStOutDto stOutDto) {
		int insertCount = 0;
		log.info("SOMDaoImpl insertStOutBySOMStOutDto start");
		
		try {
			insertCount = sqlSession.insert("SOMStOutInsert", stOutDto);
			log.info("SOMDaoImpl insertStOutBySOMStOutDto insertCount -> "+ insertCount);
		} catch (Exception e) {
			log.info("SOMDaoImpl insertStOutBySOMStOutDto e.getMessage() -> "+ e.getMessage());
		}
		
		return insertCount;
	}

	@Override
	public int insertStOutDetailBySOMStOutDto(SOMStOutDto stOutDto) {
		int insertCount2 = 0;
		log.info("SOMDaoImpl insertStOutDetailBySOMStOutDto start");
		
		try {
			insertCount2 = sqlSession.insert("SOMStOutDetailInsert", stOutDto);
			log.info("SOMDaoImpl insertStOutDetailBySOMStOutDto insertCount2 -> "+ insertCount2);
		} catch (Exception e) {
			log.info("SOMDaoImpl insertStOutDetailBySOMStOutDto e.getMessage() -> "+ e.getMessage());
		}
		
		return insertCount2;
	}

	@Override
	public int deleteStOutByOutCode(String outCode) {
		int deleteCount = 0;
		log.info("SOMDaoImpl deleteStOutByOutCode start");
		
		try {
			deleteCount = sqlSession.update("SOMStOutDelete", outCode);
			log.info("SOMDaoImpl deleteStOutByOutCode deleteCount -> "+ deleteCount);
		} catch (Exception e) {
			log.info("SOMDaoImpl deleteStOutByOutCode e.getMessage() -> "+ e.getMessage());
		}
		
		return deleteCount;
	}

	
}
