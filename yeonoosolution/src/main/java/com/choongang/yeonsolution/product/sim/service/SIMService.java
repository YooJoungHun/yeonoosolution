package com.choongang.yeonsolution.product.sim.service;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.StInDto;

public interface SIMService {

	// 양동균
	List<StInDto> stInList();
	List<StInDto> stInList(StInDto stInDto);
	void modifyStIn(StInDto stInDto);
	void removeStIn(StInDto stInDto);
	void modifyStInFix(StInDto stInDto);
	void modifyStInCancel(StInDto stInDto);
}
