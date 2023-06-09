package com.choongang.yeonsolution.product.sim.service;

import java.util.List;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.OrdersDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhDto;

public interface SIMService {

	// 양동균
	List<StInDto> findStIn(StInDto stInDto);	// 입고 목록 조회
	void modifyStIn(StInDto stInDto); 	// 입고 수정
	void removeStIn(StInDto stInDto); 	// 입고 삭제
	void modifyStInFix(StInDto stInDto); 	// 입고 확정
	void modifyStInCancel(StInDto stInDto); 	// 입고 확정 취소
	void addStIn(StInDto stInDto);				// 기타 입고 등록
	void addStInDtail(List<StInDetailDto> stInDetailDtoList); // 기타 입고 상세 등록
	List<CompanyDto> findCompany(); 			// 회사 목록 조회
	List<WhDto> findWh(); 						// 창고 목록 조회
	List<ItemDto> findItem(); 					// 아이템 목록 조회
	void addStInDetail(List<StInDetailDto> sidList);	// 입고 상세 추가
	void removeStInDetail(List<StInDetailDto> sidList); // 입고 상세 삭제
	List<OrdersDto> findOrders(); // 수주 목록 조회
	
	
}
