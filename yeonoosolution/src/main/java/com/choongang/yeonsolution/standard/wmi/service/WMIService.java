package com.choongang.yeonsolution.standard.wmi.service;

import java.util.List;

import com.choongang.yeonsolution.standard.wmi.domain.WMIWhDto;

public interface WMIService {

	List<WMIWhDto>		findWarehouses();
	List<WMIWhDto>		findWareHouseSearchByWhDto(WMIWhDto whDto);
	int				saveWareHouseByWhDto(WMIWhDto whDto);
	int				addtWareHouseByWhDto(WMIWhDto whDto);

}
