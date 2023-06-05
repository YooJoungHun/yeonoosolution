package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;

public interface SIMDao {
	
	// 양동균
	List<StInDto> findStIn();
	List<StInDto> findStIn(StInDto stInDto);
	void updateStIn(StInDto stInDto);
	void deleteStIn(StInDto stInDto);
	void updateStInFix(StInDto stInDto);
	void updateStInCancel(StInDto stInDto);
	List<CompanyDto> findCompany(); // 회사 목록 조회
}
