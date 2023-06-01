package com.choongang.yeonsolution.standard.wmi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.wmi.domain.WMIWhDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class WMIDaoImpl implements WMIDao {
	
	private final SqlSession	sqlSession;
	
	// 창고 list
	@Override
	public List<WMIWhDto> selectWareHouses() {
		List<WMIWhDto> listWarehouse = null;
		log.info("IMIDaoImpl selectWareHouse start");
		
		try {
			listWarehouse = sqlSession.selectList("WareHouseList");
			log.info("IMIDaoImpl selectWareHouse listWarehouse size -> "+ listWarehouse.size());
		} catch (Exception e) {
			log.info("IMIDaoImpl selectWareHouse e.getMessage() -> "+ e.getMessage());
		}
		
		return listWarehouse;
	}
	
	// 창고 검색
	@Override
	public List<WMIWhDto> selectWareHouseSearchByWhDto(WMIWhDto whDto) {
		List<WMIWhDto> searchWHList = null;
		log.info("IMIDaoImpl selectWareHouseSearchByWhDto start");
		
		try {
			searchWHList = sqlSession.selectList("WareHouseSearchList", whDto);
			log.info("IMIDaoImpl selectWareHouseSearchByWhDto searchWHList size -> "+ searchWHList.size());
		} catch (Exception e) {
			log.info("IMIDaoImpl selectWareHouseSearchByWhDto e.getMessage() -> "+ e.getMessage());
		}
		
		return searchWHList;
	}

	@Override
	public int updateWarehouseByWhDto(WMIWhDto whDto) {
		int updateCount = 0;
		log.info("IMIDaoImpl updateWarehouseByWhDto start");
		
		try {
			updateCount = sqlSession.update("WareHouseUpdate", whDto);
			log.info("IMIDaoImpl updateWarehouseByWhDto updateCount -> "+ updateCount);
		} catch (Exception e) {
			log.info("IMIDaoImpl updateWarehouseByWhDto e.getMessage() -> "+ e.getMessage());
		}
		return updateCount;
	}

	@Override
	public int deleteWarehouseByWhDto(WMIWhDto whDto) {
		int deleteCount = 0;
		log.info("IMIDaoImpl deleteWarehouseByWhDto start");
		
		try {
			deleteCount = sqlSession.update("WareHouseDeleteUpdate", whDto);
			log.info("IMIDaoImpl deleteWarehouseByWhDto deleteCount -> "+ deleteCount);
		} catch (Exception e) {
			log.info("IMIDaoImpl deleteWarehouseByWhDto e.getMessage() -> "+ e.getMessage());
		}
		
		return deleteCount;
	}
	
	@Override
	public int insertWarehouseByWhDto(WMIWhDto whDto) {
		int insertCount = 0;
		log.info("IMIDaoImpl insertWarehouseByWhDto start");
		
		try {
			insertCount = sqlSession.insert("WareHouseInsert", whDto);
			log.info("IMIDaoImpl insertWarehouseByWhDto insertCount -> "+ insertCount);
		} catch (Exception e) {
			log.info("IMIDaoImpl insertWarehouseByWhDto e.getMessage() -> "+ e.getMessage());
		}
		
		return insertCount;
	}

}
