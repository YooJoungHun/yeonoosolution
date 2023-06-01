package com.choongang.yeonsolution.sales.om.service;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OMOrdersAOMDto;

public interface AOMService {

	List<OMOrdersAOMDto> findRecieveOrderListByCompanyCode();

	List<OMOrdersAOMDto> findSemiManufacturesListByCompanyCode(String orderCode);

}
