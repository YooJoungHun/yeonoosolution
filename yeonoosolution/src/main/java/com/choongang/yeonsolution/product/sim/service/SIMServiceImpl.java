package com.choongang.yeonsolution.product.sim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.sim.dao.SIMDao;
import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.OrdersDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SIMServiceImpl implements SIMService {
	private final SIMDao simDao;
	
	// 양동균
	@Override
	public List<StInDto> findStIn(StInDto stInDto) {return simDao.selectStIn(stInDto); }
	@Override
	public void modifyStIn(StInDto stInDto) {simDao.updateStIn(stInDto); }
	@Override
	public void removeStIn(StInDto stInDto) {simDao.deleteStIn(stInDto); }
	@Override
	public void modifyStInFix(StInDto stInDto) {simDao.updateStInFix(stInDto); }
	@Override
	public void modifyStInCancel(StInDto stInDto) {simDao.updateStInCancel(stInDto); }
	@Override
	public void addStIn(StInDto stInDto) {simDao.insertStIn(stInDto);} // 입고 등록
	@Override
	public void addStInDtail(List<StInDetailDto> stInDetailDtoList) {simDao.insertStInDetail(stInDetailDtoList);} // 상세 등록
	@Override
	public List<CompanyDto> findCompany() {return simDao.selectCompany();}	// 회사 목록 조회
	@Override
	public List<WhDto> findWh() {return simDao.selectWh();}					// 창고 목록 조회
	@Override
	public List<ItemDto> findItem() {return simDao.selectItem();}// 아이템 목록 조회
	@Override
	public void addStInDetail(List<StInDetailDto> sidList) {simDao.insertStInDetail(sidList);} // 입고 상세 추가
	@Override
	public void removeStInDetail(List<StInDetailDto> sidList) {simDao.deleteStInDetail(sidList);} // 입고 상세 삭제
	@Override
	public List<OrdersDto> findOrders() {return simDao.selectOrders();} // 입고 상세 삭제
	
}
