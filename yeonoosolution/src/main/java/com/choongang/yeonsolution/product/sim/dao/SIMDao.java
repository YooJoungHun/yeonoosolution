package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhDto;

public interface SIMDao {
	
	// 양동균
	List<StInDto> selectStIn(StInDto stInDto); // 입고 목록 조회
	void updateStIn(StInDto stInDto); // 입고 수정
	void deleteStIn(StInDto stInDto); // 입고 삭제
	void updateStInFix(StInDto stInDto); // 입고 확정
	void updateStInCancel(StInDto stInDto); // 입고 확정 취소
	void insertStIn(StInDto stInDto); // 입고 등록
	void insertStInDetail(List<StInDetailDto> sidList);// 입고 상세 등록
	List<CompanyDto> selectCompany(); 	// 회사 목록 조회
	List<WhDto> selectWh();				// 창고 목록 조회
	List<ItemDto> selectItem();			// 아이템 목록 조회
}
