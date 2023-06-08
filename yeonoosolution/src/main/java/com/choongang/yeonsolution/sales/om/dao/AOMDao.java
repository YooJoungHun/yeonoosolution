package com.choongang.yeonsolution.sales.om.dao;

import java.util.List;

import com.choongang.yeonsolution.sales.om.domain.OMOrdersAOMDto;

public interface AOMDao {

	List<OMOrdersAOMDto> selectReceiveOrderListByCompanyCode();

	List<OMOrdersAOMDto> selectSemiManufacturesListByCompanyCode(String orderCode);

}
