package com.choongang.yeonsolution.standard.wmi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.wmi.dao.WMIDao;
import com.choongang.yeonsolution.standard.wmi.domain.WMIWhDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class WMIServiceImpl implements WMIService {
	
	private final WMIDao	wmiDao;
	
	// 창고 list
	@Override
	public List<WMIWhDto> findWarehouses() {
		List<WMIWhDto> listWarehouse = null;
		log.info("IMIServiceImpl findWarehouses start");
		
		listWarehouse = wmiDao.selectWareHouses();
		
		return listWarehouse;
	}

	@Override
	public List<WMIWhDto> findWareHouseSearchByWhDto(WMIWhDto whDto) {
		List<WMIWhDto> searchWHList = null;
		log.info("IMIServiceImpl findWareHouseSearchByWhDto start");
		searchWHList = wmiDao.selectWareHouseSearchByWhDto(whDto);
		
		return searchWHList;
	}

	@Override
	public int saveWareHouseByWhDto(WMIWhDto whDto) {
		int modifiedResult = 0;
		log.info("IMIServiceImpl saveWareHouseByWhDto start");
		
		if(whDto.getKindN() == 1) {
			modifiedResult = wmiDao.updateWarehouseByWhDto(whDto);
			
		}else if(whDto.getKindN() == 2) {	
			modifiedResult = wmiDao.deleteWarehouseByWhDto(whDto);
			
		}
			
		return modifiedResult;
	}

	@Override
	public int addtWareHouseByWhDto(WMIWhDto whDto) {
		int insertResult = 0;
		log.info("IMIServiceImpl addtWareHouseByWhDto start");
		
		insertResult = wmiDao.insertWarehouseByWhDto(whDto);
		
		return insertResult;
	}
}
