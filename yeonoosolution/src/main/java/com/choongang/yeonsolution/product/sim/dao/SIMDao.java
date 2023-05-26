package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.StInDto;

public interface SIMDao {
	
	List<StInDto> findStIn();
}
