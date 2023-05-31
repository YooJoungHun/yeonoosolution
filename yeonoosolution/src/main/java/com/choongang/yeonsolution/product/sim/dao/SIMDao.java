package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.StInDto;

public interface SIMDao {
	
	List<StInDto> findStIn();
	List<StInDto> findStIn(StInDto stInDto);
	void updateStIn(StInDto stInDto);
	void deleteStIn(StInDto stInDto);
	void updateStInFix(StInDto stInDto);
	void updateStInCancel(StInDto stInDto);
}
