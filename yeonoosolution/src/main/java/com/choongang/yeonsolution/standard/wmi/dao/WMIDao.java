package com.choongang.yeonsolution.standard.wmi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.wmi.domain.WMIWhDto;

public interface WMIDao {

	List<WMIWhDto>		selectWareHouses();
	List<WMIWhDto>		selectWareHouseSearchByWhDto(WMIWhDto whDto);
	int				updateWarehouseByWhDto(WMIWhDto whDto);
	int				deleteWarehouseByWhDto(WMIWhDto whDto);
	int				insertWarehouseByWhDto(WMIWhDto whDto);

}
