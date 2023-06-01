package com.choongang.yeonsolution.sales.om.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.om.dao.AOMDao;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersAOMDto;
import com.choongang.yeonsolution.sales.om.service.AOMService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AOMServiceImle implements AOMService {
	
	private final AOMDao aomDao;
	
	public AOMServiceImle(AOMDao aomDao) {
		this.aomDao = aomDao;
	}
	
	@Override
	public List<OMOrdersAOMDto> findRecieveOrderListByCompanyCode() {
		List<OMOrdersAOMDto> receiveOrderList = null;
		
		receiveOrderList = aomDao.selectReceiveOrderListByCompanyCode();
		log.info("[findRecieveOrderListByCompanyCode] receiveOrderList.size() -> {}", receiveOrderList.size());
		
		return receiveOrderList;
	}

	@Override
	public List<OMOrdersAOMDto> findSemiManufacturesListByCompanyCode(String orderCode) {
		List<OMOrdersAOMDto> semiManufacturesList = null;
		
		semiManufacturesList = aomDao.selectSemiManufacturesListByCompanyCode(orderCode);
		log.info("[findRecieveOrderListByCompanyCode] receiveOrderList.size() -> {}", semiManufacturesList.size());
		
		return semiManufacturesList;
	}

}
